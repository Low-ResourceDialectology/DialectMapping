
# Read Country/Region Data from local file (once downloaded)
############################################################
gadm_afghanistan_1 <- readRDS(paste0(dir_raw_gadm,"gadm41_AFG_1_pk.rds", sep=""))
gadm_armenia_1 <- readRDS(paste0(dir_raw_gadm,"gadm41_ARM_1_pk.rds", sep=""))
gadm_azerbaijan_1 <- readRDS(paste0(dir_raw_gadm,"gadm41_AZE_1_pk.rds", sep=""))
gadm_bahrain_1 <- readRDS(paste0(dir_raw_gadm,"gadm41_BHR_1_pk.rds", sep=""))
gadm_cyprus_1 <- readRDS(paste0(dir_raw_gadm,"gadm41_CYP_1_pk.rds", sep=""))
gadm_egypt_1 <- readRDS(paste0(dir_raw_gadm,"gadm41_EGY_1_pk.rds", sep=""))
gadm_georgia_1 <- readRDS(paste0(dir_raw_gadm,"gadm41_GEO_1_pk.rds", sep=""))
gadm_iran_1 <- readRDS(paste0(dir_raw_gadm,"gadm41_IRN_1_pk.rds", sep=""))
gadm_iraq_1 <- readRDS(paste0(dir_raw_gadm,"gadm41_IRQ_1_pk.rds", sep=""))
gadm_israel_1 <- readRDS(paste0(dir_raw_gadm,"gadm41_ISR_1_pk.rds", sep=""))
gadm_jordan_1 <- readRDS(paste0(dir_raw_gadm,"gadm41_JOR_1_pk.rds", sep=""))
gadm_kazakhstan_1 <- readRDS(paste0(dir_raw_gadm,"gadm41_KAZ_1_pk.rds", sep=""))
gadm_kuwait_1 <- readRDS(paste0(dir_raw_gadm,"gadm41_KWT_1_pk.rds", sep=""))
gadm_kyrgyzstan_1 <- readRDS(paste0(dir_raw_gadm,"gadm41_KGZ_1_pk.rds", sep=""))
gadm_lebanon_1 <- readRDS(paste0(dir_raw_gadm,"gadm41_LBN_1_pk.rds", sep=""))
gadm_oman_1 <- readRDS(paste0(dir_raw_gadm,"gadm41_OMN_1_pk.rds", sep=""))
gadm_pakistan_1 <- readRDS(paste0(dir_raw_gadm,"gadm41_PAK_1_pk.rds", sep=""))
gadm_qatar_1 <- readRDS(paste0(dir_raw_gadm,"gadm41_QAT_1_pk.rds", sep=""))
gadm_saudiarabia_1 <- readRDS(paste0(dir_raw_gadm,"gadm41_SAU_1_pk.rds", sep=""))
gadm_syria_1 <- readRDS(paste0(dir_raw_gadm,"gadm41_SYR_1_pk.rds", sep=""))
gadm_tajikistan_1 <- readRDS(paste0(dir_raw_gadm,"gadm41_TJK_1_pk.rds", sep=""))
gadm_turkmenistan_1 <- readRDS(paste0(dir_raw_gadm,"gadm41_TKM_1_pk.rds", sep=""))
gadm_turkey_1 <- readRDS(paste0(dir_raw_gadm,"gadm41_TUR_1_pk.rds", sep=""))
gadm_unitedarabemirated_1 <- readRDS(paste0(dir_raw_gadm,"gadm41_ARE_1_pk.rds", sep=""))
gadm_uzbekistan_1 <- readRDS(paste0(dir_raw_gadm,"gadm41_UZB_1_pk.rds", sep=""))
gadm_yemen_1 <- readRDS(paste0(dir_raw_gadm,"gadm41_YEM_1_pk.rds", sep=""))

# Combine the SpatVectors around Kurdistan
gadm_kurd_1_wide <- rbind(gadm_afghanistan_1,gadm_armenia_1,gadm_azerbaijan_1,
                     gadm_bahrain_1,gadm_cyprus_1,gadm_egypt_1,
                     gadm_georgia_1,gadm_iran_1,gadm_iraq_1,
                     gadm_israel_1,gadm_jordan_1,gadm_kazakhstan_1,
                     gadm_kuwait_1,gadm_kyrgyzstan_1,gadm_lebanon_1,
                     gadm_oman_1,gadm_pakistan_1,gadm_qatar_1,
                     gadm_saudiarabia_1,gadm_syria_1,gadm_tajikistan_1,
                     gadm_turkmenistan_1,gadm_turkey_1,gadm_unitedarabemirated_1,
                     gadm_uzbekistan_1,gadm_yemen_1) 

# Save data to file to extract all region/city names
write.table(gadm_kurd_1_wide, file = paste0(dir_processed, "kurdistan_names_level1_wide.csv", sep=""), sep="\t", row.names=F)



# Read Country/Region Data from local file (once downloaded)
############################################################
gadm_afghanistan_2 <- readRDS(paste0(dir_raw_gadm,"gadm41_AFG_2_pk.rds", sep=""))
#gadm_armenia_2 → No file available
gadm_azerbaijan_2 <- readRDS(paste0(dir_raw_gadm,"gadm41_AZE_2_pk.rds", sep=""))
#gadm_bahrain_2 → No file available
#gadm_cyprus_2 → No file available
gadm_egypt_2 <- readRDS(paste0(dir_raw_gadm,"gadm41_EGY_2_pk.rds", sep=""))
gadm_georgia_2 <- readRDS(paste0(dir_raw_gadm,"gadm41_GEO_2_pk.rds", sep=""))
gadm_iran_2 <- readRDS(paste0(dir_raw_gadm,"gadm41_IRN_2_pk.rds", sep=""))
gadm_iraq_2 <- readRDS(paste0(dir_raw_gadm,"gadm41_IRQ_2_pk.rds", sep=""))
#gadm_israel_2 → No file available
gadm_jordan_2 <- readRDS(paste0(dir_raw_gadm,"gadm41_JOR_2_pk.rds", sep=""))
gadm_kazakhstan_2 <- readRDS(paste0(dir_raw_gadm,"gadm41_KAZ_2_pk.rds", sep=""))
#gadm_kuwait_2 → No file available
gadm_kyrgyzstan_2 <- readRDS(paste0(dir_raw_gadm,"gadm41_KGZ_2_pk.rds", sep=""))
gadm_lebanon_2 <- readRDS(paste0(dir_raw_gadm,"gadm41_LBN_2_pk.rds", sep=""))
gadm_oman_2 <- readRDS(paste0(dir_raw_gadm,"gadm41_OMN_2_pk.rds", sep=""))
gadm_pakistan_2 <- readRDS(paste0(dir_raw_gadm,"gadm41_PAK_2_pk.rds", sep=""))
#gadm_qatar_2 → No file available
gadm_saudiarabia_2 <- readRDS(paste0(dir_raw_gadm,"gadm41_SAU_2_pk.rds", sep=""))
gadm_syria_2 <- readRDS(paste0(dir_raw_gadm,"gadm41_SYR_2_pk.rds", sep=""))
gadm_tajikistan_2 <- readRDS(paste0(dir_raw_gadm,"gadm41_TJK_2_pk.rds", sep=""))
gadm_turkmenistan_2 <- readRDS(paste0(dir_raw_gadm,"gadm41_TKM_2_pk.rds", sep=""))
gadm_turkey_2 <- readRDS(paste0(dir_raw_gadm,"gadm41_TUR_2_pk.rds", sep=""))
gadm_unitedarabemirated_2 <- readRDS(paste0(dir_raw_gadm,"gadm41_ARE_2_pk.rds", sep=""))
gadm_uzbekistan_2 <- readRDS(paste0(dir_raw_gadm,"gadm41_UZB_2_pk.rds", sep=""))
gadm_yemen_2 <- readRDS(paste0(dir_raw_gadm,"gadm41_YEM_2_pk.rds", sep=""))

# Combine the SpatVectors around Kurdistan
gadm_kurd_2_wide <- rbind(gadm_afghanistan_2,gadm_azerbaijan_2,gadm_egypt_2,
                     gadm_georgia_2,gadm_iran_2,gadm_iraq_2,
                     gadm_jordan_2,gadm_kazakhstan_2,gadm_kyrgyzstan_2,
                     gadm_lebanon_2,gadm_oman_2,gadm_pakistan_2,
                     gadm_saudiarabia_2,gadm_syria_2,gadm_tajikistan_2,
                     gadm_turkmenistan_2,gadm_turkey_2,gadm_unitedarabemirated_2,
                     gadm_uzbekistan_2,gadm_yemen_2)

# Save data to file to extract all region/city names
write.table(gadm_kurd_2_wide, file = paste0(dir_processed, "kurdistan_names_level2_wide.csv", sep=""), sep="\t", row.names=F)


# Combine the SpatVectors around Kurdistan
gadm_kurd_2 <- rbind(gadm_iran_2,gadm_iraq_2,gadm_syria_2,gadm_turkey_2)

