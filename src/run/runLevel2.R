
## Mapview - COUNTRY & Dialect
##############################
mapview(sf_kurd_2, zcol = "COUNTRY", 
        alpha.regions = 0.4, 
        alpha = 1, 
        #col.regions = color_pal
        na.color = "transparent"
        ) +
  mapview(sf_kurd_2, zcol = "Dialect", 
          alpha.regions = 0.7, 
          alpha = 1, 
          #col.regions = color_pal, 
          na.color = "transparent")


#mapview(sf_kurd_2, zcol = "COUNTRY", alpha.regions = 0.4, alpha = 1, col.regions = color_pal) +
  #mapview(sf_kurdistan_2, zcol = "Dialect", alpha.regions = 0.4, alpha = 1, col.regions = c("green4", "royalblue4", "red4"), na.color = "transparent")
#  mapview(sf_kurd_2, zcol = "Dialect", alpha.regions = 0.7, alpha = 1, col.regions = color_pal, na.color = "transparent")
