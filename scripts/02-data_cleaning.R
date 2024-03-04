#### Preamble ####
# Purpose: Clean the raw Paris airbnb data
# Author: Talia Fabregas
# Date: 3 March 2024
# Contact: talia.fabregas@mail.utoronto.ca
# License: MIT
# Pre-requisites: Run 01-download_data.R first
# Any other information needed?

#### Workspace setup ####
library(arrow)
library(janitor)

paris_airbnb_data <- read_csv("data/raw_data/paris_airbnb_data.csv")
paris_airbnb_data_selected <-
  paris_airbnb_data |>
  select(
    host_id,
    host_response_time,
    host_is_superhost,
    host_total_listings_count,
    neighbourhood_cleansed,
    bathrooms,
    bedrooms,
    price,
    number_of_reviews,
    review_scores_rating,
    review_scores_accuracy,
    review_scores_value
  )

paris_airbnb_data_selected$price |>
  str_split("") |>
  unlist() |>
  unique()

paris_airbnb_data_selected |>
  select(price) |>
  filter(str_detect(price, ","))

paris_airbnb_data_selected <-
  paris_airbnb_data_selected |>
  mutate(
    price = str_remove_all(price, "[\\$,]"),
    price = as.integer(price)
  )


#### Save data ####
# write_parquet(
#   x = paris_airbnb_data_selected, 
#   sink = 
#     "2023-12-12-paris-airbnblistings-select_variables.parquet"
# )

write_parquet(paris_airbnb_data_selected, 
              "data/analysis_data/2023-12-12-paris-airbnblistings-select_variables.parquet")



# rm(paris_airbnb_data)



