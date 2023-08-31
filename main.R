# Rprofile
#
# Preparation at start-up of project: Dialect Mapping
#
# Author: Christian "Doofnase" Schuler, Raman Ahmad
# Date: 2023 May
################################################################################

# Set initial working directories
dir_init <- getwd()
dir_src <- paste0(dir_init, "/src/", sep="")
## Raw data is not to be touched by anyone
dir_raw <- paste0(dir_init, "/data/raw/", sep="")
# Downloading uses "dir_raw" since the gadm-package automatically add a directory called "gadm"
# For reading and later use, this path: dir_raw_gadm
dir_raw_gadm <- paste0(dir_init, "/data/raw/gadm/", sep="")
dir_raw_osm <- paste0(dir_init, "/data/raw/osm/", sep="")
dir_raw_manual <- paste0(dir_init, "/data/manual/", sep="")
## Processed data as step to lessen the computational load
dir_processed <- paste0(dir_init, "/data/processed/", sep="")
## Output data holds all results and figures
dir_out <- paste0(dir_init, "/data/output/", sep="")

setwd(dir_init)
print(paste0("Working directory: ", dir_init))
print(paste0("Source directory: ", dir_src))
print(paste0("Data (raw) directory: ", dir_raw))
print(paste0("Output directory: ", dir_out))

# Setup
#######
## The script that takes care of the setup of this project
source(paste0(dir_src, "setup.R", sep=""))

# Process Data
##############
## The script that handles the data processing
source(paste0(dir_src, "processData.R", sep=""))

# Run Analysis
##############
## The script to run the interactive map
#source(paste0(dir_src, "runMap.R", sep=""))

## Mapview - COUNTRY & Dialect
##############################
# TODO: Move this into "runMap.R" (Currently it only opens in RStudio if placed in "main.R")
# About removing "na" from the legend: https://stackoverflow.com/questions/66663946/how-do-you-exclude-na-values-from-leaflet-legend
mapview(sf_kurd_2, zcol = "COUNTRY", 
        alpha.regions = 0.2, 
        alpha = 1, 
        #col.regions = color_pal
        na.color = NA) +
  mapview(sf_kurd_2, zcol = "Dialect_Group", 
          alpha.regions = 0.7, 
          alpha = 1, 
          #col.regions = color_pal, 
          na.color = NA) +
  mapview(sf_kurd_2, zcol = "DIALECT", 
          alpha.regions = 0.8, 
          alpha = 1, 
          #col.regions = color_pal, 
          na.color = NA)

