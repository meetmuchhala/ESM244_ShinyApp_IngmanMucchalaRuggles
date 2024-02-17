library(shiny)
library(tidyverse)
library(palmerpenguins)

### Create the user interface:
ui <- fluidPage(
  titlePanel("I am adding a title!"),       
  sidebarLayout(                            
    sidebarPanel("put my widgets here",
      
     radioButtons(
       inputId = "penguin_species",
        label = "Choose penguin species", 
      choices = c("Adelie","Gentoo","Cool Chinstrap Penguins!" = "Chinstrap"))),
      
      mainPanel("put graphs here!")
              
      ) ### end sidebayLayout
) ### end fluidPage

### Create the server function:
server <- function(input, output) {}

### Combine them into an app:
shinyApp(ui = ui, server = server)






