#### Preamble ####
# Purpose: Downloads and saves the data from Airbnb
# Author: Talia Fabregas
# Date: 3 March 2024 
# Contact: talia.fabregas@mail.utoronto.ca
# License: MIT


#### Workspace setup ####
library(janitor)
library(tidyverse)


#### Download data ####
url <-
  paste0(
    "http://data.insideairbnb.com/france/ile-de-france/", 
    "paris/2023-12-12/data/listings.csv.gz"
  )

paris_airbnb_data <-
  read_csv(
    file = url,
    guess_max = 20000
  )


#### Save data ####
write_csv(paris_airbnb_data, "data/raw_data/paris_airbnb_data.csv")

paris_airbnb_data




