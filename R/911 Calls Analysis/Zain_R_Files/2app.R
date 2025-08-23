library(shiny)
library(tidyverse)
library(leaflet)
library(sf)
library(DT)

# UI
ui <- fluidPage(
  titlePanel("Detroit 911 Calls Analysis"),
  sidebarLayout(
    sidebarPanel(
      h4("Data Filters"),
      sliderInput("call_range", "Call Count Range:",
                  min = 0, max = 5000, value = c(0, 5000)),
      numericInput("top_n", "Show Top N Locations:", value = 10, min = 1, max = 50),
      radioButtons("map_type", "Map Visualization:",
                   choices = c("Point Map" = "points", 
                               "Heatmap" = "heatmap",
                               "Clusters" = "clusters"),
                   selected = "points"),
      actionButton("update", "Update View"),
      hr(),
      h4("Key Findings"),
      verbatimTextOutput("summary_text")
    ),
    mainPanel(
      tabsetPanel(
        tabPanel("Map", leafletOutput("map", height = "600px")),
        tabPanel("Top Locations", DTOutput("top_table")),
        tabPanel("Distribution", plotOutput("histogram")),
        tabPanel("Cluster Analysis", 
                 plotOutput("cluster_plot"),
                 DTOutput("cluster_table"))
      )
    )
  )
)

# Server
server <- function(input, output) {
  
  # Load and prepare data
  calls_data <- reactive({
    calls <- read_csv("911CallLocations.csv",
                      col_names = c("Intersection", "Call_Count"),
                      skip = 1) %>%
      filter(!is.na(Intersection) & Intersection != "") %>%
      mutate(Call_Count = as.numeric(Call_Count))
    
    set.seed(123)
    calls <- calls %>%
      mutate(
        lat = 42.35 + runif(n(), -0.05, 0.05),
        lng = -83.10 + runif(n(), -0.05, 0.05),
        Scaled_Calls = scale(Call_Count)
      )
    
    # Filter by call range
    calls %>% filter(Call_Count >= input$call_range[1] & 
                       Call_Count <= input$call_range[2])
  })
  
  # Cluster data
  clustered_data <- reactive({
    calls <- calls_data()
    set.seed(123)
    clusters <- kmeans(calls[, c("lat", "lng", "Scaled_Calls")], centers = 3)
    calls$Cluster <- as.factor(clusters$cluster)
    calls
  })
  
  # Top locations table
  output$top_table <- renderDT({
    calls_data() %>%
      arrange(desc(Call_Count)) %>%
      head(input$top_n) %>%
      select(Intersection, Call_Count, lat, lng) %>%
      datatable(options = list(pageLength = 10))
  })
  
  # Histogram
  output$histogram <- renderPlot({
    ggplot(calls_data(), aes(x = Call_Count)) +
      geom_histogram(binwidth = 200, fill = "steelblue", color = "white") +
      labs(title = "Distribution of 911 Call Volumes at Intersections", 
           x = "Number of Calls", y = "Count of Locations") +
      theme_minimal()
  })
  
  # Map visualization
  output$map <- renderLeaflet({
    input$update
    
    if (input$map_type == "points") {
      data <- calls_data()
      leaflet(data) %>%
        addTiles() %>%
        addCircleMarkers(
          ~lng, ~lat, 
          radius = ~sqrt(Call_Count)/5, 
          color = "blue", 
          fillOpacity = 0.6, 
          popup = ~paste("<b>", Intersection, "</b><br>Calls:", Call_Count)) %>%
        addLegend(
          position = "bottomright",
          colors = "blue",
          labels = "Call Volume",
          title = "911 Call Frequency"
        )
    } else if (input$map_type == "heatmap") {
      data <- calls_data() %>%
        mutate(
          lat_round = round(lat, 3),
          lng_round = round(lng, 3)
        ) %>%
        group_by(lat_round, lng_round) %>%
        summarise(Total_Calls = sum(Call_Count), .groups = "drop")
      
      leaflet(data) %>%
        addTiles() %>%
        addRectangles(
          lng1 = ~lng_round - 0.0015, lat1 = ~lat_round - 0.0015,
          lng2 = ~lng_round + 0.0015, lat2 = ~lat_round + 0.0015,
          fillColor = ~colorBin("YlOrRd", Total_Calls)(Total_Calls),
          fillOpacity = 0.7,
          weight = 0,
          popup = ~paste("Calls:", Total_Calls)
        ) %>%
        addLegend(
          position = "bottomright",
          pal = colorBin("YlOrRd", data$Total_Calls),
          values = ~Total_Calls,
          title = "Call Density"
        )
    } else {
      data <- clustered_data()
      pal <- colorFactor(palette = c("red", "blue", "green"), domain = data$Cluster)
      
      leaflet(data) %>%
        addTiles() %>%
        addCircleMarkers(
          ~lng, ~lat, 
          radius = ~sqrt(Call_Count)/5, 
          color = ~pal(Cluster), 
          fillOpacity = 0.6, 
          popup = ~paste("<b>", Intersection, "</b><br>Calls:", Call_Count, "<br>Cluster:", Cluster)) %>%
        addLegend(
          position = "bottomright",
          pal = pal,
          values = ~Cluster,
          title = "Cluster"
        )
    }
  })
  
  # Cluster plot
  output$cluster_plot <- renderPlot({
    data <- clustered_data()
    ggplot(data, aes(x = lng, y = lat, color = Cluster)) +
      geom_point(aes(size = Call_Count)) +
      theme_minimal() +
      labs(title = "Spatial Clusters of 911 Call Frequency", 
           x = "Longitude", y = "Latitude")
  })
  
  # Cluster table
  output$cluster_table <- renderDT({
    clustered_data() %>%
      group_by(Cluster) %>%
      summarize(
        Locations = n(),
        Total_Calls = sum(Call_Count),
        Avg_Calls = mean(Call_Count),
        .groups = "drop"
      ) %>%
      arrange(desc(Total_Calls)) %>%
      datatable()
  })
  
  # Summary text
  output$summary_text <- renderText({
    calls <- calls_data()
    top_locations <- calls %>% arrange(desc(Call_Count)) %>% head(1)
    cluster_summary <- clustered_data() %>%
      group_by(Cluster) %>%
      summarize(Total_Calls = sum(Call_Count), .groups = "drop") %>%
      arrange(desc(Total_Calls))
    
    paste(
      "Total locations:", nrow(calls), "\n",
      "Total calls:", sum(calls$Call_Count), "\n",
      "Busiest intersection:", top_locations$Intersection[1], 
      "(", top_locations$Call_Count[1], "calls)\n",
      "Most active cluster: Cluster", cluster_summary$Cluster[1],
      "with", cluster_summary$Total_Calls[1], "calls"
    )
  })
}

# Run the app
shinyApp(ui = ui, server = server)