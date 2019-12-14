library(shiny)
library(ggplot2)
library(scales)
library(caret)
library(dplyr)
library(DT)



server <- function(input, output){
    
    plotData <- reactive({
        s <- Sacramento %>% 
            filter(city==input$city, 
                   type==input$type,
                   sqft<=input$sqft,
                   price<=input$price) %>%
            mutate(price.per.sqft = price/sqft)
    })
    
    
    output$myPlot <- renderPlot({
        p = ggplot(plotData(), aes(x=sqft, y=price)) + 
            geom_point(colour = "orange1", size = 3)+
            geom_smooth(method = 'loess', alpha = .5, colour = "purple1") +
            scale_y_continuous(labels = dollar)
        print(p)
    })
    
    output$theData <- DT::renderDataTable(
        plotData()
    )
    
}
