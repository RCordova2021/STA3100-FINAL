#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#


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


