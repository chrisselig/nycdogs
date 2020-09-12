# Script is used to load and manipulate data

# library(nycdogs)
# library(tidyverse)
# library(lubridate)
# library(sf)

bites_raw <- nyc_bites
names_raw <- nyc_license
geo_raw <- nyc_zips


# Create the bites tibble ----
bites_function <- function(data = bites_raw){
    bites_tbl <- data
    
    return(bites_tbl)
}


bites <- bites_raw %>% 
    mutate(year = year())
    

# Testing functions ----
data <- bites_raw

bites_tbl <- bites_function()
