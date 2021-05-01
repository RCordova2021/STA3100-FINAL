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
        hist(dataset[,column], main = "Histogram of Car Metrics", xlab = "Metric",
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
        hist(dataset[,6], main = "Histogram of MPG/HP across all models", xlab = "MPG/HP",
             col = rgb(.25, 0, .75, 0.75)
        )
    })
})

#     output$distPlot <- renderPlot({
#         # generate bins based on input$bins from ui.R
#         x    <- faithful[, 2]
#         bins <- seq(min(x), max(x), length.out = input$bins + 1)
# 
#         # draw the histogram with the specified number of bins
#         hist(x, breaks = bins, col = 'darkgray', border = 'white')
#     })

# observe({
#     hist_data_set <- dataset[dataset$Car.Model==input$Year, 8]
#     histdata <- data.frame((sort(table(hist_data_set), decreasing = TRUE)))
#     
#     tableData <- dataset[dataset$Car.Model==input$Year, c(1, 6)]
#     colnames(tableData) <- c("Car Model", "MPG/HP")
# 
# 
# 
#     output$hist <- renderPlot({
#         barplot(height=histdata$Car.Model, names=histdata$Car.Model,
#                 main=("Barplot comparing fuel efficiency to engine power"),
#                 xlab="Car.Model",
#                 ylab="MPG/HP",
#                 col=rgb(0.1,0.3,0.4),
#                 cex.names=0.84,
#                 font.lab=2,
#                 ylim=c(0,.5),
#                 xpd = FALSE
#                 )
#     output$test <- renderTable(tableData)
#     })
# })


# observe({
#    dataset <- read.csv("data/Stats.project.csv")
#    carplot  <- dataset[dataset$Car.Model==input$cars, 4]
#     new_carplot <- data.frame(carplot)
# 
#    tableData <- new_carplot[new_carplot$Car.Model==input$cars, c(2,3,4,5)]
#    colnames(tableData)<-  c("Year","MSRP", "MPG", "HorsePower")
#    #
#     library(ggplot2)
#     output$car_plot <- renderPlot({
#         ggplot(new_carplot, aes(MSRP, MPG.HP)) +
#             geom_jitter() +
#             theme_bw()
#  })
# 
# })  


#     dataset <- dataset[!is.na(dataset$Car.Model) & !is.na(dataset$Year),]
#     car <- input$cars
#     year <- input$year
# 
#  
#     show_car_stats <- function(car, year) {
#              sub <- dataset[dataset$Car.Model==car & dataset$Year==year,]
#              
#     if(nrow(sub)>0){
#         sub <- as.data.frame(sub)
#         return(sub)
#      } else {
#          return(data.frame(Availability="Not Available"))
#      }
#     show_car_stats(car, year)
#     })
# }
#     
# output$ppiplot <- renderPlot({
#     dataset <- read.csv("data/Stats.project.csv")
#     dataset <- dataset[!is.na(dataset$Car.Model) & !is.na(dataset$Year),]
#     
#     library(tidyr)
#     
#     car <- input$cars
#     year <- input$year
#     sub <- dataset[dataset$Car.Model==car & dataset$Year==year,]
#     
#     
#     library(ggplot2)
#     ggplot(sub, aes(car, year)) +
#         geom_jitter() + 
#         geom_smooth(method="lm") +
#         ggtitle("Car by Year regression")
#         theme_bw()
# })
# 
# 

    
