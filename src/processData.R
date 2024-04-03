# Process Data
##############
# Process the geolocation data
source(paste0(dir_src, "process/geoData.R", sep=""))

dialect_classification = read.csv(paste0(dir_raw_links, "/KurdishDialectsInformation.csv", sep="", na.strings=c('')), sep=",")

# ==============================================================================
#gadm_level_0
gadm_level_0_names <- gadm_level_0[[c("COUNTRY")]]
write.csv(gadm_level_0_names, file = paste0(dir_processed, "fromR/level0/location_name_kurdistan_0.csv", sep=""), sep="\t", row.names=FALSE)

# ==============================================================================
#gadm_level_1
gadm_level_1_names <- gadm_level_1[[c("COUNTRY","NAME_1","VARNAME_1","NL_NAME_1")]]
write.csv(gadm_level_1_names, file = paste0(dir_processed, "fromR/level1/location_name_kurdistan_1.csv", sep=""), sep="\t", row.names=FALSE)

# ==============================================================================
#gadm_level_2
gadm_level_2_names <- gadm_level_2[[c("COUNTRY","NAME_1","NAME_2","VARNAME_2","NL_NAME_2")]]
write.csv(gadm_level_2_names, file = paste0(dir_processed, "fromR/level2/location_name_kurdistan_2.csv", sep=""), sep="\t", row.names=FALSE)

#dialect_location = read.csv(paste0(dir_raw_links, "/kurdistan_names_level2_wide_filled.csv", sep="", na.strings=c('')), sep=",")
#dialect_location[dialect_location == ''] <- NA
#gadm_kurd_2_info <- merge(x=gadm_kurd_2,y=dialect_location,by=intersect(names(gadm_kurd_2),names(dialect_location)))
#gadm_kurd_2_info <- merge(x=gadm_kurd_2_info,y=dialect_classification,by.x="DIALECT",by.y="Language_Name",all.x=TRUE,all.y=FALSE)
#gadm_kurd_2_info$X <- NULL
#gadm_kurd_2_info$X.1 <- NULL
#gadm_kurd_2_info$X.2 <- NULL
#gadm_kurd_2_info$X.3 <- NULL
#sf_kurd_2 <- sf::st_as_sf(gadm_kurd_2_info)

# ==============================================================================
#gadm_level_3
gadm_level_3_names <- gadm_level_3[[c("COUNTRY","NAME_1","NAME_2","NAME_3","VARNAME_3","NL_NAME_3")]]
write.csv(gadm_level_3_names, file = paste0(dir_processed, "fromR/level3/location_name_kurdistan_3.csv", sep=""), sep="\t", row.names=FALSE)










# 
# # ==============================================================================
# # Prior to 2024_01_23
# 
# # From geoData.R we get the combination of selected countries:
# #     Combine the SpatVectors around Kurdistan
# #     gadm_kurd_2 <- rbind(gadm_iran_2,gadm_iraq_2,gadm_syria_2,gadm_turkey_2)
# gadm_kurd_2_names <- gadm_kurd_2[[c("COUNTRY", "NAME_1", "NAME_2")]]
# 
# # From "DialectLocations" we get the Dialect-Location (Links) data 
# dialect_location = read.csv(paste0(dir_raw_links, "/kurdistan_names_level2_wide_filled.csv", sep="", na.strings=c('')), sep=",")
# 
# # Replace all empty strings with NA value 
# dialect_location[dialect_location == ''] <- NA
# 
# # Dialect Information about Language Family and Classifications by various researcher
# dialect_classification = read.csv(paste0(dir_raw_links, "/KurdishDialectsInformation.csv", sep="", na.strings=c('')), sep=",")
# 
# 
# # Merging of manually and automatically collected dialect data
# ## Merge the original SpatVector with the new dialect-location data
# # About merging in R: https://r-coder.com/merge-r/
# gadm_kurd_2_info <- merge(x = gadm_kurd_2, 
#                           y = dialect_location, 
#                           by = intersect(names(gadm_kurd_2), names(dialect_location)))
# #by.x=c("COUNTRY", "NAME_2"), 
# #by.y=c("COUNTRY", "NAME_2"))#, all.x = TRUE)
# 
# # Remove undesired variables for better readability of pop-up labels
# #gadm_kurd_2_info$GID_0 <- NULL
# #gadm_kurd_2_info$GID_1 <- NULL
# #gadm_kurd_2_info$GID_2 <- NULL
# #gadm_kurd_2_info$NL_NAME_1 <- NULL
# #gadm_kurd_2_info$NL_NAME_2 <- NULL
# #gadm_kurd_2_info$VARNAME_2 <- NULL
# #gadm_kurd_2_info$CC_2 <- NULL
# #gadm_kurd_2_info$HASC_2 <- NULL
# #gadm_kurd_2_info$TYPE_2 <- NULL
# #gadm_kurd_2_info$ENGTYPE_2 <- NULL
# 
# ## Merge with the dialect-classification data
# gadm_kurd_2_info <- merge(x = gadm_kurd_2_info, 
#                           y = dialect_classification, 
#                           by.x="DIALECT",
#                           by.y="Language_Name", 
#                           all.x = TRUE, 
#                           all.y = FALSE)
# 
# # Remove undesired variables for better readability of pop-up labels
# #gadm_kurd_2_info$Ethnologue_Name <- NULL
# #gadm_kurd_2_info$Ethnologue_Location <- NULL
# #gadm_kurd_2_info$Khalid2020_Name <- NULL
# #gadm_kurd_2_info$Khalid2020_Super <- NULL
# #gadm_kurd_2_info$Alam2023_Name <- NULL
# #gadm_kurd_2_info$Alam2023_Super <- NULL
# #gadm_kurd_2_info$Alam2023_Location <- NULL
# #gadm_kurd_2_info$Alam2023_Note <- NULL
# #gadm_kurd_2_info$Tavadze2019_Location <- NULL
# #gadm_kurd_2_info$OepenginHaig2014_Name <- NULL
# #gadm_kurd_2_info$OepenginHaig2014_Super <- NULL
# #gadm_kurd_2_info$Matras2019_Name <- NULL
# #gadm_kurd_2_info$Matras2019_Super <- NULL
# #gadm_kurd_2_info$Matras2019_Location <- NULL
# #gadm_kurd_2_info$Hassani2019_Name <- NULL
# #gadm_kurd_2_info$Hassani2019_Super <- NULL
# #gadm_kurd_2_info$Hassani2019_Location <- NULL
# gadm_kurd_2_info$X <- NULL
# gadm_kurd_2_info$X.1 <- NULL
# gadm_kurd_2_info$X.2 <- NULL
# gadm_kurd_2_info$X.3 <- NULL
# 
# # Replace all empty strings with NA value # Especially for "NAME_2", "Dialect_Group", "DIALECT"
# #gadm_kurd_2_info[gadm_kurd_2_info == ''] <- NA
# 
# 
# # Function for transforming a SpatVector into another format (needed for mapview)
# # https://github.com/r-spatial/mapview/pull/435
# sf_kurd_2 <- sf::st_as_sf(gadm_kurd_2_info)
# 
# 










# 
# ################################################################################
# # Prior 18.01.2024
# 
# # Select Variables for readable pop-up-labels
# gadm_kurd_1_names_wide <- gadm_kurd_1_wide[[c("COUNTRY", "NAME_1")]]
# gadm_kurd_2_names_wide <- gadm_kurd_2_wide[[c("COUNTRY", "NAME_1", "NAME_2")]]
# gadm_kurd_2_names <- gadm_kurd_2[[c("COUNTRY", "NAME_1", "NAME_2")]]
# 
# # Load manually collected data 
# ##############################
# # Replace empty strings '' with NA
# # https://sparkbyexamples.com/r-programming/r-read-csv-file-with-examples/
# # → na.strings=c('') is not working...
# ## Dialect information data
# #dialect_info = read.csv(paste0(dir_raw_links, "/kurdishDialectsInformation.csv", sep=""), sep=",")
# ## Dialect geolocation data
# dialect_location = read.csv(paste0(dir_raw_links, "/kurdistan_names_level2_wide_filled.csv", sep="", na.strings=c('')), sep=",")
# # Replace all empty strings with NA value 
# # https://sparkbyexamples.com/r-programming/replace-empty-string-with-na-in-r-dataframe/
# dialect_location[dialect_location == ''] <- NA
# 
# 
# ## Dialect Information about Language Family and Classifications by various researcher
# dialect_classification = read.csv(paste0(dir_raw_links, "/KurdishDialectsInformation.csv", sep="", na.strings=c('')), sep=",")
# 
# 
# # Merging of manually and automatically collected dialect data
# ## Merge the original SpatVector with the new dialect-location data
# # About merging in R: https://r-coder.com/merge-r/
# gadm_kurd_2_info <- merge(x = gadm_kurd_2, 
#                           y = dialect_location, 
#                           by = intersect(names(gadm_kurd_2), names(dialect_location)))
#                           #by.x=c("COUNTRY", "NAME_2"), 
#                           #by.y=c("COUNTRY", "NAME_2"))#, all.x = TRUE)
# 
# # Remove undesired variables for better readability of pop-up labels
# gadm_kurd_2_info$GID_0 <- NULL
# gadm_kurd_2_info$GID_1 <- NULL
# gadm_kurd_2_info$GID_2 <- NULL
# gadm_kurd_2_info$NL_NAME_1 <- NULL
# gadm_kurd_2_info$NL_NAME_2 <- NULL
# gadm_kurd_2_info$VARNAME_2 <- NULL
# gadm_kurd_2_info$CC_2 <- NULL
# gadm_kurd_2_info$HASC_2 <- NULL
# gadm_kurd_2_info$TYPE_2 <- NULL
# gadm_kurd_2_info$ENGTYPE_2 <- NULL
# 
# ## Merge with the dialect-classification data
# gadm_kurd_2_info <- merge(x = gadm_kurd_2_info, 
#                           y = dialect_classification, 
#                           by.x="DIALECT",
#                           by.y="Language_Name", 
#                           all.x = TRUE, 
#                           all.y = FALSE)
# 
# # Remove undesired variables for better readability of pop-up labels
# gadm_kurd_2_info$Ethnologue_Name <- NULL
# gadm_kurd_2_info$Ethnologue_Location <- NULL
# gadm_kurd_2_info$Khalid2020_Name <- NULL
# gadm_kurd_2_info$Khalid2020_Super <- NULL
# gadm_kurd_2_info$Alam2023_Name <- NULL
# gadm_kurd_2_info$Alam2023_Super <- NULL
# gadm_kurd_2_info$Alam2023_Location <- NULL
# gadm_kurd_2_info$Alam2023_Note <- NULL
# gadm_kurd_2_info$Tavadze2019_Location <- NULL
# gadm_kurd_2_info$OepenginHaig2014_Name <- NULL
# gadm_kurd_2_info$OepenginHaig2014_Super <- NULL
# gadm_kurd_2_info$Matras2019_Name <- NULL
# gadm_kurd_2_info$Matras2019_Super <- NULL
# gadm_kurd_2_info$Matras2019_Location <- NULL
# gadm_kurd_2_info$Hassani2019_Name <- NULL
# gadm_kurd_2_info$Hassani2019_Super <- NULL
# gadm_kurd_2_info$Hassani2019_Location <- NULL
# gadm_kurd_2_info$X <- NULL
# gadm_kurd_2_info$X.1 <- NULL
# gadm_kurd_2_info$X.2 <- NULL
# gadm_kurd_2_info$X.3 <- NULL
# 
# # Function for transforming a SpatVector into another format (needed for mapview)
# # https://github.com/r-spatial/mapview/pull/435
# sf_kurd_2 <- sf::st_as_sf(gadm_kurd_2_info)
# 
# 
# 
# 
# ################################################################################
# #
# # Older version (prior to 29.08.2023) #########################
# ## Dialect geolocation data
# #ialect_location = read.csv(paste0(dir_raw_links, "/kurdishDialectsLocations.csv", sep=""), sep=",")
# 
# # Merge the original SpatVector with the new dialect-data
# #gadm_kurd_2_info <- merge(x = gadm_kurd_2, y = dialect_location, by.x=c("COUNTRY", "NAME_2"), by.y=c("LocationCountry", "Level2Eng"), all.x = TRUE)
# 
# # Remove undesired variables for better readability of pop-up labels
# #gadm_kurd_2_info$GID_0 <- NULL
# #gadm_kurd_2_info$GID_1 <- NULL
# #gadm_kurd_2_info$GID_2 <- NULL
# #gadm_kurd_2_info$NL_NAME_1 <- NULL
# #gadm_kurd_2_info$NL_NAME_2 <- NULL
# #gadm_kurd_2_info$VARNAME_2 <- NULL
# #gadm_kurd_2_info$CC_2 <- NULL
# #gadm_kurd_2_info$HASC_2 <- NULL
# #gadm_kurd_2_info$TYPE_2 <- NULL
# #gadm_kurd_2_info$ENGTYPE_2 <- NULL
# 
# # Function for transforming a SpatVector into another format (needed for mapview)
# # https://github.com/r-spatial/mapview/pull/435
# #sf_kurd_2 <- sf::st_as_sf(gadm_kurd_2_info)
# # Older version (prior to 29.08.2023) #########################
# 
# 
# 
# 
# 
# # Colorblind-friendly color-palette:
# # https://jfly.uni-koeln.de/color/
# #color_pal <- palette.colors(palette = "Okabe-Ito")
# # TODO: Fix Warning messages:
# # 1: Found less unique colors (9) than unique zcol values (20)!
# # Recycling color vector.
# 
# # Process the collected dialect and language data
# #source(paste0(dir_src, "process/dialectData.R", sep=""))
# 
# # Semi-manual approach to identify dialect names
# #source(paste0(dir_src, "process/dialectNames.R", sep=""))
