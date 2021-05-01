#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

dataset <- read.csv("data/Stats.project.csv")
library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
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


