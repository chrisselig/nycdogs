#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinyjs)
library(shinyWidgets)
library(shinythemes)

library(tidyverse)


# Define UI for application that draws a histogram
ui <-   
    tagList(
        
    # * CSS ----
    tags$head(
        tags$link(rel = "stylesheet", type = "text/css", href = "styles.css"),
        tags$link(href="https://fonts.googleapis.com/css?family=Old+Standard+TT:400,700&display=swap", rel="stylesheet")
    ),
    
    # * JS ----
    shinyjs::useShinyjs(),
    
    navbarPage(

    # Application title
    title = "Exploring NYC Dog Data",
    
    collapsible = TRUE,
    
    theme = shinytheme("flatly"),
    
    # * Exploring Bites Tab ----
    tabPanel(
        title = "Exploring Dog Bites"
    ),
    
    # * Exploring Names Tab ----
    tabPanel(
        title = "Exploring Dog Names"
    ),
    
    # * Forecasting Dog Bites Tab ----
    tabPanel(
        title = "Forecasting Dog Bites"
    )

    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {


}

# Run the application 
shinyApp(ui = ui, server = server)
