library(shiny)
library(ggplot2)
library(scales)
library(caret)
library(dplyr)
library(DT)

data(Sacramento)


ui <- fluidPage(
    
    sidebarLayout(
        
        sidebarPanel(
            
            selectInput('city', 'Choose a city:', choices=unique(Sacramento$city)),
            selectInput('type', 'Choose house type:', choices=unique(Sacramento$type)),
            sliderInput("sqft", "Size Range:",
                        min = 1, max = 2500,
                        value = 1250),
            sliderInput("price", "Price Range:",
                        min = 1, max = 400000,
                        value = 200000)
        ), 
        
        
        mainPanel(
            tabsetPanel(
                tabPanel('Price Plot', plotOutput('myPlot')),
                tabPanel('Data', DT::dataTableOutput('theData'))
            )
        ) 
    ) 
) 

