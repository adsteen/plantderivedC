require(tidyr)
#require(dplyr)
#require(plyr)
require(ggplot2)
####load data for all metagenomes and subset to get aromatic genes####
MG_01 <- read.csv("metagenome_gpm/01_MG_GPM.csv")

MG_01_lig <- subset(MG_01, KO_num=="KO:K15733")

MG_01_lig$timepoint <- 1
MG_01_lig$time <- as.POSIXct("2014-07-16 11:00:00")
MG_01_lig$Depth <- 4
head(MG_01_lig)


MG_02 <- read.csv("metagenome_gpm/02_MG_GPM.csv")

MG_02_lig <- subset(MG_02, KO_num=="KO:K15733")

MG_02_lig$timepoint <- 2
MG_02_lig$time <- as.POSIXct("2014-07-16 13:00:00")
MG_02_lig$Depth <- 4.4
head(MG_02_lig)

MG_03 <- read.csv("metagenome_gpm/03_MG_GPM.csv")

MG_03_lig <- subset(MG_03, KO_num=="KO:K15733")

MG_03_lig$timepoint <- 3
MG_03_lig$Depth <- 3.7
MG_03_lig$time <- as.POSIXct("2014-07-16 15:00:00")
head(MG_03_lig)

MG_04 <- read.csv("metagenome_gpm/04_MG_GPM.csv")

MG_04_lig <- subset(MG_04, KO_num=="KO:K15733")

MG_04_lig$timepoint <- 4
MG_04_lig$Depth <- 2.2
MG_04_lig$time <- as.POSIXct("2014-07-16 17:00:00")
head(MG_04_lig)

MG_05A <- read.csv("metagenome_gpm/05A_MG_GPM.csv")

MG_05A_lig <- subset(MG_05A, KO_num=="KO:K15733")

MG_05A_lig$timepoint <- 5
MG_05A_lig$Depth <- 1.9
MG_05A_lig$time <- as.POSIXct("2014-07-16 19:00:00")
head(MG_05A_lig)

MG_05C <- read.csv("metagenome_gpm/05C_MG_GPM.csv")

MG_05C_lig <- subset(MG_05C, KO_num=="KO:K15733")

MG_05C_lig$timepoint <- 5.5
MG_05C_lig$Depth <- 1.9
MG_05C_lig$time <- as.POSIXct("2014-07-16 19:00:00")
head(MG_05C_lig)

MG_06 <- read.csv("metagenome_gpm/06_MG_GPM.csv")

MG_06_lig <- subset(MG_06, KO_num=="KO:K15733")
MG_06_lig$time <- as.POSIXct("2014-07-16 21:15:00")
MG_06_lig$timepoint <- 6
MG_06_lig$Depth <- 3.1
head(MG_06_lig)

MG_07 <- read.csv("metagenome_gpm/07_MG_GPM.csv")

MG_07_lig <- subset(MG_07, KO_num=="KO:K15733")
MG_07_lig$timepoint <- 7
MG_07_lig$Depth <- 4
MG_07_lig$time <- as.POSIXct("2014-07-16 23:15:00")
head(MG_07_lig)

MG_09A <- read.csv("metagenome_gpm/09A_MG_GPM.csv")

MG_09A_lig <- subset(MG_09A, KO_num=="KO:K15733")
MG_09A_lig$timepoint <- 9
MG_09A_lig$Depth <- 3.7
MG_09A_lig$time <- as.POSIXct("2014-07-17 03:30:00")
head(MG_09A_lig)

MG_09B <- read.csv("metagenome_gpm/09B_MG_GPM.csv")

MG_09B_lig <- subset(MG_09B, KO_num=="KO:K15733")
MG_09B_lig$time <- as.POSIXct("2014-07-17 03:30:00")
MG_09B_lig$Depth <- 3.7
MG_09B_lig$timepoint <- 9.5
head(MG_09B_lig)

MG_10 <- read.csv("metagenome_gpm/10_MG_GPM.csv")

MG_10_lig <- subset(MG_10, KO_num=="KO:K15733")
MG_10_lig$timepoint <- 10
MG_10_lig$Depth <- 2.3
MG_10_lig$time <- as.POSIXct("2014-07-17 05:30:00")
head(MG_10_lig)

MG_11 <- read.csv("metagenome_gpm/11_MG_GPM.csv")

MG_11_lig <- subset(MG_11, KO_num=="KO:K15733") 
MG_11_lig$timepoint <- 11
MG_11_lig$Depth <- 1.8
MG_11_lig$time <- as.POSIXct("2014-07-17 07:30:00")
head(MG_11_lig)

MG_12A <- read.csv("metagenome_gpm/12A_MG_GPM.csv")

MG_12A_lig <- subset(MG_12A, KO_num=="KO:K15733") 
MG_12A_lig$timepoint <- 12
MG_12A_lig$Depth <- 2.9
MG_12A_lig$time <- as.POSIXct("2014-07-17 09:30:00")
head(MG_12A_lig)

MG_12B <- read.csv("metagenome_gpm/12B_MG_GPM.csv")

MG_12B_lig <- subset(MG_12B, KO_num=="KO:K15733") 
MG_12B_lig$timepoint <- 12.5
MG_12B_lig$Depth <- 2.9
MG_12B_lig$time <- as.POSIXct("2014-07-17 09:30:00")
head(MG_12B_lig)

MG_13A <- read.csv("metagenome_gpm/13A_MG_GPM.csv")

MG_13A_lig <- subset(MG_13A, KO_num=="KO:K15733")
MG_13A_lig$timepoint <- 13
MG_13A_lig$Depth <- 4
MG_13A_lig$time <- as.POSIXct("2014-07-17 11:45:00")
head(MG_13A_lig)

MG_13B <- read.csv("metagenome_gpm/13B_MG_GPM.csv")

MG_13B_lig <- subset(MG_13B, KO_num=="KO:K15733")
MG_13B_lig$timepoint <- 13.5
MG_13B_lig$Depth <- 4
MG_13B_lig$time <- as.POSIXct("2014-07-17 11:45:00")
head(MG_13B_lig)

#####combine all aromatic data frames into one big one####
lignin <- rbind(MG_01_lig, MG_02_lig, MG_03_lig, MG_04_lig, MG_05A_lig, MG_05C_lig, MG_06_lig, MG_07_lig, MG_09A_lig,
                  MG_09B_lig, MG_10_lig, MG_11_lig, MG_12A_lig, MG_12B_lig, MG_13A_lig, MG_13B_lig)
head(lignin)
tail(lignin)
?facet_grid

lignin$type <- "Metagenome"

MT_01 <- read.csv("metatranscriptome_tpm/01_MT_TPM.csv")

MT_01_lig <- subset(MT_01, KO_num=="KO:K15733")
MT_01_lig$timepoint <- 1
MT_01_lig$time <- as.POSIXct("2014-07-16 11:00:00")
MT_01_lig$Depth <- 4
head(MT_01_lig)


MT_02 <- read.csv("metatranscriptome_tpm/02_MT_TPM.csv")

MT_02_lig <- subset(MT_02, KO_num=="KO:K15733")
MT_02_lig$timepoint <- 2
MT_02_lig$Depth <- 4.4
MT_02_lig$time <- as.POSIXct("2014-07-16 13:00:00")
head(MT_02_lig)

MT_03 <- read.csv("metatranscriptome_tpm/03_MT_TPM.csv")

MT_03_lig <- subset(MT_03, KO_num=="KO:K15733")
MT_03_lig$timepoint <- 3
MT_03_lig$Depth <- 3.7
MT_03_lig$time <- as.POSIXct("2014-07-16 15:00")
head(MT_03_lig)


MT_05B <- read.csv("metatranscriptome_tpm/05B_MT_TPM.csv")

MT_05B_lig <- subset(MT_05B, KO_num=="KO:K15733")
MT_05B_lig$timepoint <- 5
MT_05B_lig$Depth <- 1.9
MT_05B_lig$time <- as.POSIXct("2014-07-16 19:00")
head(MT_05B_lig)

MT_05C <- read.csv("metatranscriptome_tpm/05C_MT_TPM.csv")

MT_05C_lig <- subset(MT_05C, KO_num=="KO:K15733")
MT_05C_lig$timepoint <- 5.5
MT_05C_lig$Depth <- 1.9
MT_05C_lig$time <- as.POSIXct("2014-07-16 19:00:00")
head(MT_05C_lig)

MT_06 <- read.csv("metatranscriptome_tpm/06_MT_TPM.csv")

MT_06_lig <- subset(MT_06, KO_num=="KO:K15733")
MT_06_lig$timepoint <- 6
MT_06_lig$Depth <- 3.1
MT_06_lig$time <- as.POSIXct("2014-07-16 21:15:00")
head(MT_06_lig)

MT_07 <- read.csv("metatranscriptome_tpm/07_MT_TPM.csv")

MT_07_lig <- subset(MT_07, KO_num=="KO:K15733")
MT_07_lig$timepoint <- 7
MT_07_lig$time <- as.POSIXct("2014-07-16 23:15:00")
MT_07_lig$Depth <- 4
head(MT_07_lig)

MT_08 <- read.csv("metatranscriptome_tpm/08_MT_TPM.csv")

MT_08_lig <- subset(MT_08, KO_num=="KO:K15733")
MT_08_lig$timepoint <- 8
MT_08_lig$Depth <- 4.5
MT_08_lig$time <- as.POSIXct("2014-07-17 01:15:00")
head(MT_08_lig)

MT_09A <- read.csv("metatranscriptome_tpm/09A_MT_TPM.csv")

MT_09A_lig <- subset(MT_09A, KO_num=="KO:K15733")
MT_09A_lig$timepoint <- 9
MT_09A_lig$Depth <- 3.7
MT_09A_lig$time <- as.POSIXct("2014-07-17 03:30:00")
head(MT_09A_lig)

MT_10 <- read.csv("metatranscriptome_tpm/10_MT_TPM.csv")

MT_10_lig <- subset(MT_10, KO_num=="KO:K15733")
MT_10_lig$timepoint <- 10
MT_10_lig$Depth <- 2.3
MT_10_lig$time <- as.POSIXct("2014-07-17 05:30:00")
head(MT_10_lig)

MT_11 <- read.csv("metatranscriptome_tpm/11_MT_TPM.csv")

MT_11_lig <- subset(MT_11, KO_num=="KO:K15733")
MT_11_lig$timepoint <- 11
MT_11_lig$Depth <- 1.8
MT_11_lig$time <- as.POSIXct("2014-07-17 07:30:00")
head(MT_11_lig)

MT_12A <- read.csv("metatranscriptome_tpm/12A_MT_TPM.csv")

MT_12A_lig <- subset(MT_12A, KO_num=="KO:K15733")
MT_12A_lig$timepoint <- 12
MT_12A_lig$Depth <- 2.9
MT_12A_lig$time <- as.POSIXct("2014-07-17 09:30:00")
head(MT_12A_lig)

MT_12B <- read.csv("metatranscriptome_tpm/12B_MT_TPM.csv")

MT_12B_lig <- subset(MT_12B, KO_num=="KO:K15733") 
MT_12B_lig$timepoint <- 12.5
MT_12B_lig$Depth <- 2.9
MT_12B_lig$time <- as.POSIXct("2014-07-17 09:30:00")
head(MT_12B_lig)

MT_13A <- read.csv("metatranscriptome_tpm/13A_MT_TPM.csv")

MT_13A_lig <- subset(MT_13A, KO_num=="KO:K15733")
MT_13A_lig$timepoint <- 13
MT_13A_lig$Depth <- 4
MT_13A_lig$time <- as.POSIXct("2014-07-17 11:45:00")
head(MT_13A_lig)

MT_13C <- read.csv("metatranscriptome_tpm/13C_MT_TPM.csv")

MT_13C_lig <- subset(MT_13C, KO_num=="KO:K15733")
MT_13C_lig$timepoint <- 13.5
MT_13C_lig$Depth <- 4
MT_13C_lig$time <- as.POSIXct("2014-07-17 11:45:00")
head(MT_13C_lig)

#####combine all aromatic data frames into one big one####
lignin_mt <- rbind(MT_02_lig, MT_03_lig, MT_12B_lig, MT_13C_lig)
head(lignin_mt)

lignin_mt$type <- "Metatranscriptome"


detach("package:plyr", unload=TRUE)
require(dplyr)
lignin_mt <- rename(lignin_mt, GPM=TPM)

lignin <- rbind(lignin, lignin_mt)
head(lignin)
tail(lignin)

lignin_agg <- aggregate(lignin$GPM, by=list(lignin$time, lignin$type, lignin$Depth, lignin$timepoint), FUN=sum)
head(lignin_agg)

lignin_agg$Group.1 <- as.numeric(revalue(as.character(lignin_agg$Group.1), c("5.5" = "5", "9.5" = "9", "12.5"="12", "13.5"="13")))

detach("package:plyr", unload=TRUE)
lignin_agg <- rename(lignin_agg, Time='Group.1', Type='Group.2', Depth='Group.3', Count='x')
head(lignin_agg)

#tide_mg <- read.csv("stupidtidalcylcebullshit_mg.csv")
#tide_mt <- read.csv("stupidtidalcylcebullshit_mt.csv")
#tide_mt$Time <- as.POSIXct(tide_mt$Time)
#tide <- rbind(tide_mg, tide_mt)
#?unique
#tide <- unique(tide)
#tide <- subset(tide, Time !=5.5 & Time !=9.5 & Time !=12.5 & Time!=13.5)
#tail(tide)


#lig <- merge(lignin_agg, tide)
#head(lig)
#lignin_agg$Type <- revalue(lignin_agg$Type, c('metagenome'='Metagenome', 'metatranscriptome'='Metatranscriptome'))
lignin_agg$Depth <- lignin_agg$Depth*1.333

lignin_p <- ggplot() +
  geom_point(data=lignin_agg, aes(Time, Count, colour=Type, shape=Type), size=8) +
  geom_point(data=lignin_agg, aes(Time, Depth), size=4, shape=15) +
  geom_line(data=lignin_agg, aes(Time, Depth)) +
  xlab("Time of Sample Collection") +
  ylab("Genes or Transcripts per Million (GPM or TPM)") +
  scale_x_datetime() +
  scale_y_continuous(sec.axis = sec_axis(~./1.333, name="Depth (m)", breaks=c(0,2,4))) +
  scale_color_manual(values=c("springgreen", "darkgreen")) +
  theme_classic() +
  theme(text=element_text(size=20)) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  theme(legend.position="bottom")
print(lignin_p)

ggsave("20190204_lignin.pdf", height=8, width=12)
