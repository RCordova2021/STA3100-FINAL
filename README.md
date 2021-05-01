
# Compact Car: Smiles Per Gallon

This web app takes several of the best selling and most common compact sedans on the market and conveniently lists them as a table. The table lists many important stats about the car including MSRP, MPG, Horsepower, and more. The vehicle options include models between 2017-2021. There are histograms that will let you compare the car that you choose to all the other cars. The position your car has on the histogram lets you get a general idea about whether it has above or below average MPG, Horsepower, etc. 





## How to use the APP

After opening the app there are two tabs. Clicking the tabs switches between them.

The tab labeled "General Info." contains inputs to generate a table and histogram of the cars from the dataset.  

 <ul>
 <li>Click the drop down menu to select the car you would like to know about.</li> 
 <li>Then Select the metric you want the histogram to run</li>
 <li>Then click confirm.</li> 
 </ul>
 

 The tab labeled "Smiles per Gallon" contains a chart that compares the MPG of the car to it Horsepower. 
 
<ul>
<li>Select the car you would like to display information on </li>
<li>Then click Confirm</li>
</ul>

Note that the Histogram does not change on the second tab. That histogram is of the MPG.HP metric. It is a measure of how much power a engine has per unit of MPG. 

## Run from Github
Run the app from GitHub by running the code below in R:

library(shiny)

shiny::runGitHub("STA3100-FINAL", "RCordova2021", ref = "main")

## ShinyApp.io Link

Run app using shinyapps.io at:
 https://rcordova2021.shinyapps.io/Test1/


