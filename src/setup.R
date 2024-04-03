# Setup
#######

# Installation of required packages
source(paste0(dir_src, "setup/installPackages.R", sep=""))

library(terra) # For downloadOsmData
library(geodata) # For downloadGadm
library(tidyverse)
library(sf)
library(mapview)
library(RColorBrewer)
# From oldMain.R ###########
#library(geodata)
#library(tidyverse)
#library(sf)
#library(mapview)
#library(RColorBrewer)

# Download functions of geolocation data
source(paste0(dir_src, "setup/downloadData.R", sep=""))
# → downloadGadm <- function(country, level, path, version, resolution)
# → downloadOsmData <- function(country, var, path)

# TODO: A function that checks if downloads are required(?)
# Initial download of geolocation data
source(paste0(dir_src, "setup/initialDownloadKurdish.R", sep=""))
source(paste0(dir_src, "setup/initialDownloadGerman.R", sep=""))

# Data download via geodata::osm
################################
#osm_syria <- downloadOsmData(country="Syria", var="places", path=dir_raw_osm)
# → file: SYR_places.gpkg