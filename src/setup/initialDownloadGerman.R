# Countries in which German is (or might be?) spoken:
# Germany, Denmark, Poland, Czechia, Austria, Switzerland, France, Luxembourg, Belgium, Netherlands, 
#   Norway, Sweden, Finland, Estonia, Latvia, Lituania, Belarus, Ukraine, Moldova, Romania, Slovakia, 
#   Hungary, Bulgaria, Serbia, North Macedonia, Kosovo, Greece, Albania, Croatia, Slovenia, Italy, 
#   Malta, Monaco, Andorra, Spain, Portugal, United Kingdom, Ireland

# List to store downloaded data for each country
country_data <- list()

# List of country codes
country_codes <- c("DEU", "DNK", "POL")  # Add more country codes as needed

# Loop through each country code
for (country_code in country_codes) {
  # Read data for each country
  file_name <- paste0(dir_raw_gadm, "gadm41_", country_code, "_0_pk.rds")
  country_data[[country_code]] <- readRDS(file_name)
}

# Combine data for all countries
combined_data <- do.call(rbind, country_data)





# Download Country/Region Data (Level 0)
########################################
#gadm_germany_0 <- downloadGadm(country="DEU", level=0, dir_raw, version="latest", resolution=1)

# Download Country/Region Data (Level 1)
########################################
#gadm_germany_1 <- downloadGadm(country="DEU", level=1, dir_raw, version="latest", resolution=1)

# Download Country/Region Data (Level 2) (For some countries no file available on this level)
#############################################################################################
#gadm_germany_2 <- downloadGadm(country="DEU", level=2, dir_raw, version="latest", resolution=1)

# Download Country/Region Data (Level 3) (Only exists for a few)
#############################################################################################
#gadm_germany_3 <- downloadGadm(country="DEU", level=3, dir_raw, version="latest", resolution=1)

