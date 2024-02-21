library(shiny)
library(tidyverse)
library(palmerpenguins)

### Create the user interface:
ui <- fluidPage(
  titlePanel("Solar Trends and Forecasts in California"),       
  sidebarLayout(                            
    sidebarPanel("Time Series Visualization",
      
     radioButtons(
       inputId = "Choose utility",
        label = "Choose utility type", 
      choices = c("Option 1","Option 2")),
     
     radioButtons(
       inputId = "Choose policy",
       label = "Choose policy type", 
       choices = c("Option 1","Option 2")),
     
     sliderInput("slider1", label = h3("Slider"), min = 1990, 
                 max = 2022, value = 1990),
    

  ), ### end of sidebarPanel
      
      mainPanel(
        h2("2nd level title"),
        h5("5th level paragraph of text"),
        "put graphs here!",
                  # plotOutput(outputId = "penguin_plot"),
                  # h3('Summary table'),
                  # tableOutput(outputId = "penguin_table")
                
                ### outputs for project:
                # map output: community solar potential
                # map of california, solar projects, where overlap
                
                
                
                ) ### end mainPanel
              
  ) ### end sidebayLayout
) ### end fluidPage

### Create the server function:
server <- function(input, output) {} ### end server

### Combine them into an app:
shinyApp(ui = ui, server = server)






