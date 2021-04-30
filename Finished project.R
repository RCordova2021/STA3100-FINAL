#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(
    navbarPage("Compact Sedan Smiles per Gallon",
               tabPanel("General Information",
                        sidebarLayout(
                            sidebarPanel(
                                selectInput("cars", "Select Car",
                                    choices = list(
                                        "Toyota Corolla",
                                        "Nissan Sentra",
                                        "Mazda 3",
                                        "Hyundai Elantra",
                                        "Honda Civic",
                                        "Chevrolet Sonic"),
                                    selected = "Volkswagen Jetta"),
                                br(),
                                br(),
                                br(),
                                selectInput("var", "Select metric to run Histogram", choices = c("HorsePower" = 5, "MPG" = 4, "Torque" = 8)),
                                submitButton("Confirm"),
                                br(),
                                ),
                                
                                        
                            mainPanel(
                                tableOutput("get_cars"),
                                plotOutput("hist")
                            
                            )
                        )
               ),
               
               
               
               tabPanel("Smiles per Gallon",
                        sidebarLayout(
                            sidebarPanel(
                                selectInput("cars2", "Select Car",
                                            choices = list(
                                                "Toyota Corolla",
                                                "Nissan Sentra",
                                                "Mazda 3",
                                                "Hyundai Elantra",
                                                "Honda Civic",
                                                "Chevrolet Sonic"),
                                            selected = "Volkswagen Jetta"),
                                submitButton("Confirm"),
                                h4("A Smaller MPG.HP suggests a faster car.
                           A Larger MPG.HP suggests a slower car")),
                            
                                
                            
                        
                            mainPanel(plotOutput("MPG.HP"),
                                      
                                      tableOutput("get_cars_2"),
                                      
                           
                        )
                    )
                )
            )
        )


    

                            
                        
       
                        
                                
         
       
               # tabPanel("3",
               #              sidebarPanel(
               #                  selectInput("var", "Select metric to run", choices = c("Sepal.Length" = 5, "Sepal.Width" =8)),
               #                  br(),
               #                  radioButtons("Color", "Select again again", choices=c("Green", "Red"), selected="Green")
               #                  
               #              ),
               #              
               #              mainPanel(
               #                  plotOutput("hist")
               #              )
                        
                    
               

# 
#     # Application title
#     titlePanel("Old Faithful Geyser Data"),
# 
#     # Sidebar with a slider input for number of bins 
#     sidebarLayout(
#         sidebarPanel(
#             sliderInput("bins",
#                         "Number of bins:",
#                         min = 1,
#                         max = 50,
#                         value = 30)
#         ),
# 
#         # Show a plot of the generated distribution
#         mainPanel(
#            plotOutput("distPlot")
#         )
#     )

# Define server logic required to draw a histogram
server <- function(input, output) { 
    source("global.R")
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
    
 
}
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


# Run the application 
shinyApp(ui = ui, server = server)
