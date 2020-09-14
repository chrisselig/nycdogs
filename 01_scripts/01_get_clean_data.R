# Script is used to load and manipulate data


# Create the bites tibble ----
clean_names_function <- function(data = nyc_bites){
    
    bites_tbl <- data %>% 
        mutate(
            breed_clean = str_remove(str_to_lower(breed_rc),"(?<!^)mix"), # make sure mix isn't at beginning
            # Fix - at beginning of strings
            breed_clean = str_remove(breed_clean,"^-"),
            # Remove extra spaces
            breed_clean = str_squish(breed_clean)
            
        ) %>% 
        separate(col = breed_clean, into = c("breed_clean","x"),sep = "\\(",extra = 'drop') %>%
        separate(breed_clean, into = c("breed_clean","y"), sep = "-",extra = 'drop') %>%
        separate(breed_clean, into = c("breed_clean","z"), sep = "&",extra = 'drop') %>%
        separate(breed_clean, into = c("breed_clean","a"), sep = " or ",extra = 'drop') %>%
        mutate(
            breed_clean = str_replace(breed_clean, "boxer x","boxer"),
            breed_clean = str_replace(breed_clean, "boxer x w","boxer"),
            breed_clean = str_replace(breed_clean,"blue heeler x","blue heeler"),
            breed_clean = str_replace(breed_clean,"pit bull ed","pit bull"),
            breed_clean = str_replace(breed_clean, "pit bull terr", "pit bull terrier"),
            breed_clean = str_replace(breed_clean, "pit bull ter", "pit bull terrier"),
            breed_clean = str_remove(breed_clean, " x"),
            breed_clean = str_replace(breed_clean,"(?>=ter$)","terrier"),
            breed_clean = str_replace(breed_clean, 'bull dog','bulldog'),
            breed_clean = str_replace(breed_clean, 'pit bull','pitbull'),
            breed_clean = str_replace(breed_clean,"alaska husky","alaskan husky")
        ) %>%
        select(-c(breed,x,y,z,a)) %>% 
        mutate(breed_clean = str_squish(breed_clean))
    
    return(bites_tbl)
}



    # filter(!is.na(uniqueid))
    
# Testing ----
# library(nycdogs)
# library(tidyverse)
# library(lubridate)
# library(sf)
# 
# bites_raw <- nyc_bites
# names_raw <- nyc_license
# geo_raw <- nyc_zips

# clean_names_function()



