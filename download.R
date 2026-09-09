library(tidyverse)
library(tidycensus)

# Race and Hispanic origin variables from ACS Table B03002
race_vars <- c(
  white = "B03002_003",
  black = "B03002_004",
  asian = "B03002_006",
  hispanic = "B03002_012",
  total = "B03002_001"
)

# Download 5-year ACS data with tract boundary geometries
sarasota_race <- get_acs(
  geography = "tract",
  variables = race_vars,
  state = "FL",
  county = "Sarasota",
  year = 2022,
  geometry = TRUE,
  output = "wide"
)

# Save spatial data
write_rds(sarasota_race, "data/sarasota_race.rds")
