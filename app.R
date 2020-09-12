#
# Created by Chris Selig of BIDAMIA INC. ----
# https://www.linkedin.com/in/chris-selig/
# bidamia.ca
# App for exploring and forecasting dog bites in NYC ----
# September 2020 v1.0
#

# * Libraries ----
# ** Shiny libraries ----
library(shiny)
library(shinyjs)
library(shinyWidgets)
library(shinythemes)

# ** Data manipulation libraries ----
library(tidyverse)
library(lubridate)

# ** Data library ----
library(nycdogs)

# * Source Scripts ----
source('01_scripts/01_get_clean_data.R')

# * Load Data ----
bites_tbl <- bites_function()

# Define UI ----
ui <-   
    tagList(
        
        # * CSS ----
        tags$head(
            tags$link(rel = "stylesheet", type = "text/css", href = "styles.css"),
            tags$link(href="https://fonts.googleapis.com/css?family=Old+Standard+TT:400,700&display=swap", 
                      rel="stylesheet"
            )
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
                class = "tabPanel",
                title = "Exploring Dog Bites",
                
                # ** Visualization Panel ----
                column(
                    width = 8
                ),
                
                # ** Filter Panel ----
                column(
                    width = 4,
                    fluidRow(
                        h2('Filters'),
                        
                        # *** Borough Filter ----
                        pickerInput(
                            inputId = 'bitesBurough',
                            label = 'Burough',
                            choices = sort(unique(bites_tbl$borough)),
                            selected = c('Bronx','Brooklyn', 'Manhattan','Queens','Staten Island','Other'),
                            multiple = TRUE,
                            options = list(
                                `actions-box` = TRUE,
                                `multiple-separator` = " | "
                                )
                        ),
                        
                        br(),
                        
                        # * Breed Filter ----
                        pickerInput(
                            inputId = 'bitesBreed',
                            label = 'Breed',
                            choices = sort(unique(bites_tbl$breed)),
                            selected = bites_tbl %>% select(breed_rc) %>% pull(),
                            multiple = TRUE,
                            options = list(
                                `actions-box` = TRUE,
                                liveSearch = TRUE,
                                size = 1200,
                                `multiple-separator` = " | "
                            )
                        )
                    )
                )
            ),
            
            # * Exploring Names Tab ----
            tabPanel(
                class = "tabPanel",
                title = "Exploring Dog Names"
            ),
            
            # * Forecasting Dog Bites Tab ----
            tabPanel(
                class = "tabPanel",
                title = "Forecasting Dog Bites"
            )
        )
    )

# Define server logic 
server <- function(input, output) {
    
    
}

# Run the application 
shinyApp(ui = ui, server = server)
