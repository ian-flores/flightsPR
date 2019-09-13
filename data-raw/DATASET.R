## code to prepare `DATASET` dataset goes here
library(dplyr)

flights_raw <- readr::read_csv('inst/extdata/bts_rita_pr_d.csv') %>%
  janitor::clean_names()

flights_sju_mco <- flights_raw %>%
  dplyr::select(seats,
                passengers,
                distance,
                air_time,
                unique_carrier,
                unique_carrier_name,
                origin,
                dest,
                aircraft_type,
                year,
                quarter,
                month,
                class) %>%
  dplyr::filter(origin %in% c('SJU', 'MCO'),
                dest %in% c('MCO', 'SJU'),
                class == 'F') %>%
  dplyr::select(-class, -quarter)

usethis::use_data(flights_sju_mco)
