#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
source("global.R")

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    
    dataset <- read.csv("data/Stats.project.csv")
    observe({
        dataset <- read.csv("data/Stats.project.csv")
        new_data_set <- dataset[dataset$Car.Model==input$cars, c(2,3,4,5,6,7,8)]
        output$get_cars <- renderTable(new_data_set)   
        
    })
    
    output$hist <-renderPlot({
        column <- as.numeric(input$var)   
        hist(Stats.project[,column], main = "Histogram of Car Metrics", xlab = "test",
             col = rgb(.25, 0, .75, 0.75), )
        axis(side=1, at=seq(100,200, 15)
             
        )
        
        
    })
    observe({    
        dataset <- read.csv("data/Stats.project.csv")
        new_data_set <- dataset[dataset$Car.Model==input$cars2, c(1, 2, 6)]
        output$get_cars_2 <- renderTable(new_data_set)   
    })
    
    output$MPG.HP <-renderPlot({
        hist(Stats.project[,6], main = "Histogram of MPG/HP across all models", xlab = "MPG/HP",
             col = rgb(.25, 0, .75, 0.75)
        )
    })
})
    
