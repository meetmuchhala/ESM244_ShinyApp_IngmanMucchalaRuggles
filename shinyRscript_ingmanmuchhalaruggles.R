
library(shiny)
library(tidyverse)
library(palmerpenguins)

### Create the user interface:
ui <- fluidPage(
  titlePanel("I am adding a title!"),       # <1>
  sidebarLayout(                            # <2>
    sidebarPanel("put my widgets here"),    # <3>
    mainPanel("put my graph here")          # <4>
  ) ### end sidebarLayout#
) ### end fluidPage

### Create the server function:
server <- function(input, output) {}

### Combine them into an app:
shinyApp(ui = ui, server = server)

ui <- fluidPage(
  titlePanel("I am adding a title!"),       # <1>
  sidebarLayout(                            # <2>
    sidebarPanel("put my widgets here"),    # <3>
    mainPanel("put my graph here") 
  )
)


fluidPage(
  
  # Copy the line below to make a set of radio buttons
  radioButtons("radio", label = h3("Radio buttons"),
               choices = list("Choice 1" = 1, "Choice 2" = 2, "Choice 3" = 3), 
               selected = 1),
  
  hr(),
  fluidRow(column(3, verbatimTextOutput("value")))
  
)

sidebarLayout(
  sidebarPanel("put my widgets here",
               
               
               mainPanel("put my graph here",
                         
                         plotOutput(outputId = "penguin_plot"), # <1>
               
               radioButtons( # <1>
                 inputId = "penguin_species", # <2>
                 label = "Choose penguin species", 
                 choices = c("Adelie","Gentoo","Cool Chinstrap Penguins!" = "Chinstrap")
               )
               
  ), ### end sidebarLayout
  
  mainPanel("put my graph here")
  )
  
)


server <- function(input, output) {
  penguin_select <- reactive({
    penguins_df <- penguins %>%
      filter(species == input$penguin_species)
    
    return(penguins_df)
  }) ### end penguin_select
  
  output$penguin_plot <- renderPlot({               # <1>
    ggplot(data = penguin_select()) +               # <2>
      geom_point(aes(x = flipper_length_mm, y = body_mass_g))
  }) ### end penguin_plot
  
}




