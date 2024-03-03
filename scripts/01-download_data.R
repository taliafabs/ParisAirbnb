#### Preamble ####
# Purpose: Downloads and saves the data from [...UPDATE THIS...]
# Author: Rohan Alexander [...UPDATE THIS...]
# Date: 11 February 2023 [...UPDATE THIS...]
# Contact: rohan.alexander@utoronto.ca [...UPDATE THIS...]
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]

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




