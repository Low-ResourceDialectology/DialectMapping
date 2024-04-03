# Rprofile
#
# Preparation at start-up of project: Dialect Mapping
#
# Authors: Christian "Doofnase" Schuler, Raman "Brudi" Ahmad
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
dir_raw_links <- paste0(dir_init, "/data/links/", sep="")
## Processed data as step to lessen the computational load
dir_processed <- paste0(dir_init, "/data/processed/", sep="")
## Output data holds all results and figures
dir_out <- paste0(dir_init, "/data/output/", sep="")

setwd(dir_init)
print(paste0("Working directory: ", dir_init))
print(paste0("Source directory: ", dir_src))
print(paste0("Data (raw) directory: ", dir_raw))
print(paste0("Output directory: ", dir_out))

# TODO: Level-based application?
#level_param <- "0"
#level_param <- "1"
level_param <- "2"


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

# ==============================================================================
function_name <- function(level_param = "0"){
  # For level 0 == "Country"
  if (level_param == "0") {
    output <- paste("Process data for level ",level_param,"\n",sep="")}
  
  # For level 1 == "State"
  else if(level_param == "1") {
    output <- paste("Process data for level ",level_param,"\n",sep="")}
  
  # For level 2 == "District"
  else if(level_param == "2") {
    output <- paste("Process data for level ",level_param,"\n",sep="")}
  
  # For any level
  return(cat(output))
}







## Mapview - COUNTRY & Dialect
##############################
# TODO: Move this into "runMap.R" (Currently it only opens in RStudio if placed in "main.R")
# About removing "na" from the legend: https://stackoverflow.com/questions/66663946/how-do-you-exclude-na-values-from-leaflet-legend


# ==============================================================================
# LEVEL 2 (Administrative Level 2 == "Districts")
# ==============================================================================
# Version: Basic
runMap02 <- function() {
  mapview(sf_kurd_2, 
          zcol = c("NAME_2","DIALECT","Dialect_Group"),
          na.color = NA)
}
#runMap02()

# ==============================================================================
# Version: 
runMap02_a <- function() {
  mapview(sf_kurd_2, 
          zcol = "NAME_2",
          alpha.regions = 0.2,
          alpha = 1,
          #col.regions = color_pal
          na.color = NA) +
    mapview(sf_kurd_2, 
            zcol = "Dialect_Group",
            alpha.regions = 0.7,
            alpha = 1,
            #col.regions = color_pal,
            na.color = NA) +
    mapview(sf_kurd_2, 
            zcol = "DIALECT",
            alpha.regions = 0.8,
            alpha = 1,
            #col.regions = color_pal,
            na.color = NA)
}
runMap02_a()

# ==============================================================================
# Version: 
runMap02_b <- function() {
  mapview(sf_kurd_2, 
          zcol = c("Dialect_Group"),
          na.color = NA)
}
#runMap02_b()

# ==============================================================================
# Version: 
runMap02_b <- function() {
  mapview(sf_kurd_2,
          zcol = c("DIALECT",
                   "Dialect_Group"),
          na.color = NA,
          popup = popupTable(sf_kurd_2,
                             zcol = c("NAME_2",
                                      "DIALECT",
                                      "Dialect_Group",
                                      "SOURCE",
                                      "NOTES")))
  }
#runMap02_b()


# ==============================================================================
# LEVEL 1 (Administrative Level 1 == "States")
# ==============================================================================
# Version: Basic
runMap01 <- function() {
  mapview(sf_kurd_2,
          zcol = c("NAME_1",
                   "DIALECT",
                   "Dialect_Group"),
          na.color = NA,
          legend = TRUE,
          popup = popupTable(sf_kurd_2,
                             zcol = c("COUNTRY",
                                      "DIALECT",
                                      "Dialect_Group",
                                      "SOURCE",
                                      "NOTES")))
}
#runMap01()


# ==============================================================================
# Version: 
runMap01_a <- function() {
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
}
#runMap01_a()


# ==============================================================================
# Version: Multiple Layers - Dialect Groups
runMap01_b <- function() {
  
  # Filter unique combinations of columns to prevent oversaturation of a region 
  # in which multiple dialects where located 
  # (therefore having more than one entry in the dataframe)
  sf_kurd_2_state <- unique(sf_kurd_2[,c('NAME_1','NAME_2')])
  
  # Filter unique combinations of columns to prevent oversaturation of a region 
  # to prevent oversaturation of a region in which multiple dialects where located
  sf_kurd_2_dialectgroup <- unique(sf_kurd_2[,c('NAME_2','Dialect_Group')])
  
  mapview(sf_kurd_2_state, 
          zcol = "NAME_1",
          alpha.regions = 0.4) +
    mapview(sf_kurd_2_dialectgroup, 
            zcol = "Dialect_Group",
            na.color = NA)
}
#runMap01_b()


# ==============================================================================
# Version: Multiple Layers - Dialects
runMap01_c <- function() {
  
  # Filter unique combinations of columns to prevent oversaturation of a region 
  # in which multiple dialects where located 
  # (therefore having more than one entry in the dataframe)
  sf_kurd_2_state <- unique(sf_kurd_2[,c('NAME_1','NAME_2')])
  
  # Filter unique combinations of columns to prevent oversaturation of a region 
  # to prevent oversaturation of a region in which multiple dialects where located
  sf_kurd_2_dialect <- unique(sf_kurd_2[,c('NAME_2','DIALECT')])
  
  mapview(sf_kurd_2_state, 
          zcol = "NAME_1",
          alpha.regions = 0.4) +
    mapview(sf_kurd_2_dialect, 
            zcol = "DIALECT",
            na.color = NA)
}
#runMap01_c()



# ==============================================================================
# LEVEL 0 (Administrative Level 0 == "Countries")
# ==============================================================================
# Version: Basic
runMap00 <- function() {
  mapview(sf_kurd_2, 
          zcol = "COUNTRY",
          alpha.regions = 0.2,
          alpha = 1,
          #col.regions = color_pal
          na.color = NA) +
    mapview(sf_kurd_2, 
            zcol = "Dialect_Group",
            alpha.regions = 0.7,
            alpha = 1,
            #col.regions = color_pal,
            na.color = NA) +
    mapview(sf_kurd_2, 
            zcol = "DIALECT",
            alpha.regions = 0.8,
            alpha = 1,
            #col.regions = color_pal,
            na.color = NA)
}
#runMap00()


# ==============================================================================
# Version: 
runMap00_a <- function() {
  mapview(sf_kurd_2, 
          zcol = c("COUNTRY","Dialect_Group"),
          alpha.regions = 0.2,
          alpha = 1,
          na.color = NA)
}
#runMap00_a()


# ==============================================================================
# Version: Multiple Layers - Dialect Groups
runMap00_b <- function() {
  
  # Filter unique combinations of "COUNTRY", "NAME_1", and "NAME_2" 
  # to prevent oversaturation of a region in which multiple dialects where located 
  # (therefore having more than one entry in the dataframe)
  sf_kurd_2_country <- unique(sf_kurd_2[,c('COUNTRY','NAME_1','NAME_2')])
  
  # Filter unique combinations of "COUNTRY", "NAME_2", and "Dialect_Group" 
  # to prevent oversaturation of a region in which multiple dialects where located
  sf_kurd_2_dialectgroup <- unique(sf_kurd_2[,c('COUNTRY','NAME_2','Dialect_Group')])
  
  mapview(sf_kurd_2_country, 
          zcol = "COUNTRY",
          #col.regions = c("#CC79A7","#000000","#E69F00","#F0E442","#56B4E9","#009E73","#0072B2","#D55E00","#999999"), # "Okabe-Ito"
          alpha.regions = 0.4) +
    mapview(sf_kurd_2_dialectgroup, 
            zcol = "Dialect_Group",
            na.color = NA)
}
#runMap00_b()



# ==============================================================================
# Version: Multiple Layers - Dialects
runMap00_c <- function() {
  
  # Filter unique combinations of "COUNTRY", "NAME_1", and "NAME_2" 
  # to prevent oversaturation of a region in which multiple dialects where located 
  # (therefore having more than one entry in the dataframe)
  sf_kurd_2_country <- unique(sf_kurd_2[,c('COUNTRY','NAME_1','NAME_2')])
  
  # Filter unique combinations of "COUNTRY", "NAME_2", and "DIALECT" 
  # to prevent oversaturation of a region in which multiple dialects where located
  sf_kurd_2_dialect <- unique(sf_kurd_2[,c('COUNTRY','NAME_2','DIALECT')])
  
  mapview(sf_kurd_2_country, 
          zcol = "COUNTRY",
          #col.regions = c("Iraq"="#CC79A7","Turkey"="#000000","Iran"="#F0E442","Syria"="#009E73","#E69F00","#56B4E9","#0072B2","#D55E00","#999999"), # "Okabe-Ito"
          alpha.regions = 0.4) +
    mapview(sf_kurd_2_dialect, 
            zcol = "DIALECT",
            na.color = NA)
}
runMap00_c()

