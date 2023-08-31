# Script to install required packages
#
# Author: Christian "Doofnase" Schuler
# Date: 2023 May
################################################################################

# Prerequisites ################################################################
## Check installed packages
required_packages <- c("gapminder", 
                       "gstat", 
                       "maps", 
                       "mapview",
                       "rnaturalearth", 
                       "sf", 
                       "spatstat", 
                       "stars", 
                       "stringr", 
                       "tidyverse", 
                       "units", 
                       "spdep", 
                       "plm", 
                       "splm",
                       "terra")
# Extract not installed packages
not_installed <- required_packages[!(required_packages %in% installed.packages()[ , "Package"])]    
if(length(not_installed)) install.packages(not_installed)
# Print information to console
# "4 packages had to be installed."
print(paste(length(not_installed), "packages had to be installed.")) 

