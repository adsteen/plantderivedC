require(tidyr)
require(dplyr)
require(ggplot2)
####load data for all metagenomes and subset to get aromatic genes####
MG_01 <- read.csv("metagenome_gpm/01_MG_GPM.csv")

MG_01_aro <- subset(MG_01, KO_num=="KO:K00448" | KO_num=="KO:K00449" | KO_num=="KO:K00450" | KO_num =="KO:K03381" | KO_num=="KO:K07104" | KO_num=="KO:K15511" | KO_num=="KO:K15512")

MG_01_aro$timepoint <- 1
MG_01_aro$time <- as.POSIXct("2014-07-16 11:00:00")
MG_01_aro$Depth <- 4
head(MG_01_aro)


MG_02 <- read.csv("metagenome_gpm/02_MG_GPM.csv")

MG_02_aro <- subset(MG_02, KO_num=="KO:K00448" | KO_num=="KO:K00449" | KO_num=="KO:K00450" | KO_num =="KO:K03381" | KO_num=="KO:K07104" | KO_num=="KO:K15511" | KO_num=="KO:K15512")
MG_02_aro$time <- as.POSIXct("2014-07-16 13:00:00")
MG_02_aro$Depth <- 4.4
MG_02_aro$timepoint <- 2
head(MG_02_aro)

MG_03 <- read.csv("metagenome_gpm/03_MG_GPM.csv")

MG_03_aro <- subset(MG_03, KO_num=="KO:K00448" | KO_num=="KO:K00449" | KO_num=="KO:K00450" | KO_num =="KO:K03381" | KO_num=="KO:K07104" | KO_num=="KO:K15511" | KO_num=="KO:K15512")

MG_03_aro$timepoint <- 3
MG_03_aro$Depth <- 3.7
MG_03_aro$time <- as.POSIXct("2014-07-16 15:00:00")
head(MG_03_aro)

MG_04 <- read.csv("metagenome_gpm/04_MG_GPM.csv")

MG_04_aro <- subset(MG_04, KO_num=="KO:K00448" | KO_num=="KO:K00449" | KO_num=="KO:K00450" | KO_num =="KO:K03381" | KO_num=="KO:K07104" | KO_num=="KO:K15511" | KO_num=="KO:K15512")
MG_04_aro$Depth <- 2.2
MG_04_aro$time <- as.POSIXct("2014-07-16 17:00:00")
MG_04_aro$timepoint <- 4
head(MG_04_aro)

MG_05A <- read.csv("metagenome_gpm/05A_MG_GPM.csv")

MG_05A_aro <- subset(MG_05A, KO_num=="KO:K00448" | KO_num=="KO:K00449" | KO_num=="KO:K00450" | KO_num =="KO:K03381" | KO_num=="KO:K07104" | KO_num=="KO:K15511" | KO_num=="KO:K15512")
MG_05A_aro$Depth <- 1.9
MG_05A_aro$time <- as.POSIXct("2014-07-16 19:00:00")
MG_05A_aro$timepoint <- 5
head(MG_05A_aro)

MG_05C <- read.csv("metagenome_gpm/05C_MG_GPM.csv")

MG_05C_aro <- subset(MG_05C, KO_num=="KO:K00448" | KO_num=="KO:K00449" | KO_num=="KO:K00450" | KO_num =="KO:K03381" | KO_num=="KO:K07104" | KO_num=="KO:K15511" | KO_num=="KO:K15512")
MG_05C_aro$Depth <- 1.9
MG_05C_aro$time <- as.POSIXct("2014-07-16 20:00:00")
MG_05C_aro$timepoint <- 5.5
head(MG_05C_aro)

MG_06 <- read.csv("metagenome_gpm/06_MG_GPM.csv")

MG_06_aro <- subset(MG_06, KO_num=="KO:K00448" | KO_num=="KO:K00449" | KO_num=="KO:K00450" | KO_num =="KO:K03381" | KO_num=="KO:K07104" | KO_num=="KO:K15511" | KO_num=="KO:K15512")
MG_06_aro$time <- as.POSIXct("2014-07-16 21:15:00")
MG_06_aro$Depth <- 3.1
MG_06_aro$timepoint <- 6
head(MG_06_aro)

MG_07 <- read.csv("metagenome_gpm/07_MG_GPM.csv")

MG_07_aro <- subset(MG_07, KO_num=="KO:K00448" | KO_num=="KO:K00449" | KO_num=="KO:K00450" | KO_num =="KO:K03381" | KO_num=="KO:K07104" | KO_num=="KO:K15511" | KO_num=="KO:K15512")
MG_07_aro$Depth <- 4
MG_07_aro$time <- as.POSIXct("2014-07-16 23:15:00")
MG_07_aro$timepoint <- 7
head(MG_07_aro)

MG_09A <- read.csv("metagenome_gpm/09A_MG_GPM.csv")

MG_09A_aro <- subset(MG_09A, KO_num=="KO:K00448" | KO_num=="KO:K00449" | KO_num=="KO:K00450" | KO_num =="KO:K03381" | KO_num=="KO:K07104" | KO_num=="KO:K15511" | KO_num=="KO:K15512")
MG_09A_aro$Depth <- 3.7
MG_09A_aro$time <- as.POSIXct("2014-07-17 03:30:00")
MG_09A_aro$timepoint <- 9
head(MG_09A_aro)

MG_09B <- read.csv("metagenome_gpm/09B_MG_GPM.csv")

MG_09B_aro <- subset(MG_09B, KO_num=="KO:K00448" | KO_num=="KO:K00449" | KO_num=="KO:K00450" | KO_num =="KO:K03381" | KO_num=="KO:K07104" | KO_num=="KO:K15511" | KO_num=="KO:K15512")
MG_09B_aro$time <- as.POSIXct("2014-07-17 04:30:00")
MG_09B_aro$Depth <- 3.7
MG_09B_aro$timepoint <- 9.5
head(MG_09B_aro)

MG_10 <- read.csv("metagenome_gpm/10_MG_GPM.csv")

MG_10_aro <- subset(MG_10, KO_num=="KO:K00448" | KO_num=="KO:K00449" | KO_num=="KO:K00450" | KO_num =="KO:K03381" | KO_num=="KO:K07104" | KO_num=="KO:K15511" | KO_num=="KO:K15512")
MG_10_aro$Depth <- 2.3
MG_10_aro$time <- as.POSIXct("2014-07-17 05:30:00")
MG_10_aro$timepoint <- 10
head(MG_10_aro)

MG_11 <- read.csv("metagenome_gpm/11_MG_GPM.csv")

MG_11_aro <- subset(MG_11, KO_num=="KO:K00448" | KO_num=="KO:K00449" | KO_num=="KO:K00450" | KO_num =="KO:K03381" | KO_num=="KO:K07104" | KO_num=="KO:K15511" | KO_num=="KO:K15512")
MG_11_aro$Depth <- 1.8
MG_11_aro$time <- as.POSIXct("2014-07-17 07:30:00")
MG_11_aro$timepoint <- 11
head(MG_11_aro)

MG_12A <- read.csv("metagenome_gpm/12A_MG_GPM.csv")

MG_12A_aro <- subset(MG_12A, KO_num=="KO:K00448" | KO_num=="KO:K00449" | KO_num=="KO:K00450" | KO_num =="KO:K03381" | KO_num=="KO:K07104" | KO_num=="KO:K15511" | KO_num=="KO:K15512")
MG_12A_aro$Depth <- 2.9
MG_12A_aro$time <- as.POSIXct("2014-07-17 09:30:00")
MG_12A_aro$timepoint <- 12
head(MG_12A_aro)

MG_12B <- read.csv("metagenome_gpm/12B_MG_GPM.csv")

MG_12B_aro <- subset(MG_12B, KO_num=="KO:K00448" | KO_num=="KO:K00449" | KO_num=="KO:K00450" | KO_num =="KO:K03381" | KO_num=="KO:K07104" | KO_num=="KO:K15511" | KO_num=="KO:K15512")
MG_12B_aro$Depth <- 2.9
MG_12B_aro$time <- as.POSIXct("2014-07-17 10:30:00")
MG_12B_aro$timepoint <- 12.5
head(MG_12B_aro)

MG_13A <- read.csv("metagenome_gpm/13A_MG_GPM.csv")

MG_13A_aro <- subset(MG_13A, KO_num=="KO:K00448" | KO_num=="KO:K00449" | KO_num=="KO:K00450" | KO_num =="KO:K03381" | KO_num=="KO:K07104" | KO_num=="KO:K15511" | KO_num=="KO:K15512")
MG_13A_aro$Depth <- 4
MG_13A_aro$time <- as.POSIXct("2014-07-17 11:45:00")
MG_13A_aro$timepoint <- 13
head(MG_13A_aro)

MG_13B <- read.csv("metagenome_gpm/13B_MG_GPM.csv")

MG_13B_aro <- subset(MG_13B, KO_num=="KO:K00448" | KO_num=="KO:K00449" | KO_num=="KO:K00450" | KO_num =="KO:K03381" | KO_num=="KO:K07104" | KO_num=="KO:K15511" | KO_num=="KO:K15512")
MG_13B_aro$Depth <- 4
MG_13B_aro$time <- as.POSIXct("2014-07-17 12:45:00")
MG_13B_aro$timepoint <- 13.5
head(MG_13B_aro)

#####combine all aromatic data frames into one big one####
aromatic <- rbind(MG_01_aro, MG_02_aro, MG_03_aro, MG_04_aro, MG_05A_aro, MG_05C_aro, MG_06_aro, MG_07_aro, MG_09A_aro,
                  MG_09B_aro, MG_10_aro, MG_11_aro, MG_12A_aro, MG_12B_aro, MG_13A_aro, MG_13B_aro)
head(aromatic)
tail(aromatic)
?facet_grid

aromatic$type <- "Metagenome"

MT_01 <- read.csv("metatranscriptome_tpm/01_MT_TPM.csv")

MT_01_aro <- subset(MT_01, KO_num=="KO:K00448" | KO_num=="KO:K00449" | KO_num=="KO:K00450" | KO_num =="KO:K03381" | KO_num=="KO:K07104" | KO_num=="KO:K15511" | KO_num=="KO:K15512")
MT_01_aro$time <- as.POSIXct("2014-07-16 11:00:00")
MT_01_aro$Depth <- 4
MT_01_aro$timepoint <- 1
head(MT_01_aro)


MT_02 <- read.csv("metatranscriptome_tpm/02_MT_TPM.csv")

MT_02_aro <- subset(MT_02, KO_num=="KO:K00448" | KO_num=="KO:K00449" | KO_num=="KO:K00450" | KO_num =="KO:K03381" | KO_num=="KO:K07104" | KO_num=="KO:K15511" | KO_num=="KO:K15512")
MT_02_aro$Depth <- 4.4
MT_02_aro$time <- as.POSIXct("2014-07-16 13:00:00")
MT_02_aro$timepoint <- 2
head(MT_02_aro)

MT_03 <- read.csv("metatranscriptome_tpm/03_MT_TPM.csv")

MT_03_aro <- subset(MT_03, KO_num=="KO:K00448" | KO_num=="KO:K00449" | KO_num=="KO:K00450" | KO_num =="KO:K03381" | KO_num=="KO:K07104" | KO_num=="KO:K15511" | KO_num=="KO:K15512")
MT_03_aro$Depth <- 3.7
MT_03_aro$time <- as.POSIXct("2014-07-16 15:00")
MT_03_aro$timepoint <- 3
head(MT_03_aro)


MT_05B <- read.csv("metatranscriptome_tpm/05B_MT_TPM.csv")

MT_05B_aro <- subset(MT_05B, KO_num=="KO:K00448" | KO_num=="KO:K00449" | KO_num=="KO:K00450" | KO_num =="KO:K03381" | KO_num=="KO:K07104" | KO_num=="KO:K15511" | KO_num=="KO:K15512")
MT_05B_aro$Depth <- 1.9
MT_05B_aro$time <- as.POSIXct("2014-07-16 19:00")
MT_05B_aro$timepoint <- 5
head(MT_05B_aro)

MT_05C <- read.csv("metatranscriptome_tpm/05C_MT_TPM.csv")

MT_05C_aro <- subset(MT_05C, KO_num=="KO:K00448" | KO_num=="KO:K00449" | KO_num=="KO:K00450" | KO_num =="KO:K03381" | KO_num=="KO:K07104" | KO_num=="KO:K15511" | KO_num=="KO:K15512")
MT_05C_aro$Depth <- 1.9
MT_05C_aro$time <- as.POSIXct("2014-07-16 20:00:00")
MT_05C_aro$timepoint <- 5.5
head(MT_05C_aro)

MT_06 <- read.csv("metatranscriptome_tpm/06_MT_TPM.csv")

MT_06_aro <- subset(MT_06, KO_num=="KO:K00448" | KO_num=="KO:K00449" | KO_num=="KO:K00450" | KO_num =="KO:K03381" | KO_num=="KO:K07104" | KO_num=="KO:K15511" | KO_num=="KO:K15512")
MT_06_aro$Depth <- 3.1
MT_06_aro$time <- as.POSIXct("2014-07-16 21:15:00")
MT_06_aro$timepoint <- 6
head(MT_06_aro)

MT_07 <- read.csv("metatranscriptome_tpm/07_MT_TPM.csv")

MT_07_aro <- subset(MT_07, KO_num=="KO:K00448" | KO_num=="KO:K00449" | KO_num=="KO:K00450" | KO_num =="KO:K03381" | KO_num=="KO:K07104" | KO_num=="KO:K15511" | KO_num=="KO:K15512")
MT_07_aro$time <- as.POSIXct("2014-07-16 23:15:00")
MT_07_aro$Depth <- 4
MT_07_aro$timepoint <- 7
head(MT_07_aro)

MT_08 <- read.csv("metatranscriptome_tpm/08_MT_TPM.csv")

MT_08_aro <- subset(MT_08, KO_num=="KO:K00448" | KO_num=="KO:K00449" | KO_num=="KO:K00450" | KO_num =="KO:K03381" | KO_num=="KO:K07104" | KO_num=="KO:K15511" | KO_num=="KO:K15512")
MT_08_aro$Depth <- 4.5
MT_08_aro$time <- as.POSIXct("2014-07-17 01:15:00")
MT_08_aro$timepoint <- 8
head(MT_08_aro)

MT_09A <- read.csv("metatranscriptome_tpm/09A_MT_TPM.csv")

MT_09A_aro <- subset(MT_09A, KO_num=="KO:K00448" | KO_num=="KO:K00449" | KO_num=="KO:K00450" | KO_num =="KO:K03381" | KO_num=="KO:K07104" | KO_num=="KO:K15511" | KO_num=="KO:K15512")
MT_09A_aro$Depth <- 3.7
MT_09A_aro$time <- as.POSIXct("2014-07-17 03:30:00")
MT_09A_aro$timepoint <- 9
head(MT_09A_aro)


MT_10 <- read.csv("metatranscriptome_tpm/10_MT_TPM.csv")

MT_10_aro <- subset(MT_10, KO_num=="KO:K00448" | KO_num=="KO:K00449" | KO_num=="KO:K00450" | KO_num =="KO:K03381" | KO_num=="KO:K07104" | KO_num=="KO:K15511" | KO_num=="KO:K15512")
MT_10_aro$Depth <- 2.3
MT_10_aro$time <- as.POSIXct("2014-07-17 05:30:00")
MT_10_aro$timepoint <- 10
head(MT_10_aro)

MT_11 <- read.csv("metatranscriptome_tpm/11_MT_TPM.csv")

MT_11_aro <- subset(MT_11, KO_num=="KO:K00448" | KO_num=="KO:K00449" | KO_num=="KO:K00450" | KO_num =="KO:K03381" | KO_num=="KO:K07104" | KO_num=="KO:K15511" | KO_num=="KO:K15512")
MT_11_aro$Depth <- 1.8
MT_11_aro$time <- as.POSIXct("2014-07-17 07:30:00")
MT_11_aro$timepoint <- 11
head(MT_11_aro)

MT_12A <- read.csv("metatranscriptome_tpm/12A_MT_TPM.csv")

MT_12A_aro <- subset(MT_12A, KO_num=="KO:K00448" | KO_num=="KO:K00449" | KO_num=="KO:K00450" | KO_num =="KO:K03381" | KO_num=="KO:K07104" | KO_num=="KO:K15511" | KO_num=="KO:K15512")
MT_12A_aro$Depth <- 2.9
MT_12A_aro$time <- as.POSIXct("2014-07-17 09:30:00")
MT_12A_aro$timepoint <- 12
head(MT_12A_aro)

MT_12B <- read.csv("metatranscriptome_tpm/12B_MT_TPM.csv")

MT_12B_aro <- subset(MT_12B, KO_num=="KO:K00448" | KO_num=="KO:K00449" | KO_num=="KO:K00450" | KO_num =="KO:K03381" | KO_num=="KO:K07104" | KO_num=="KO:K15511" | KO_num=="KO:K15512")
MT_12B_aro$Depth <- 2.9
MT_12B_aro$time <- as.POSIXct("2014-07-17 10:30:00")
MT_12B_aro$timepoint <- 12.5
head(MT_12B_aro)

MT_13A <- read.csv("metatranscriptome_tpm/13A_MT_TPM.csv")

MT_13A_aro <- subset(MT_13A, KO_num=="KO:K00448" | KO_num=="KO:K00449" | KO_num=="KO:K00450" | KO_num =="KO:K03381" | KO_num=="KO:K07104" | KO_num=="KO:K15511" | KO_num=="KO:K15512")
MT_13A_aro$Depth <- 4
MT_13A_aro$time <- as.POSIXct("2014-07-17 11:45:00")
MT_13A_aro$timepoint <- 13
head(MT_13A_aro)

MT_13C <- read.csv("metatranscriptome_tpm/13C_MT_TPM.csv")

MT_13C_aro <- subset(MT_13C, KO_num=="KO:K00448" | KO_num=="KO:K00449" | KO_num=="KO:K00450" | KO_num =="KO:K03381" | KO_num=="KO:K07104" | KO_num=="KO:K15511" | KO_num=="KO:K15512")
MT_13C_aro$Depth <- 4
MT_13C_aro$time <- as.POSIXct("2014-07-17 12:45:00")
MT_13C_aro$timepoint <- 13.5
head(MT_13C_aro)

#####combine all aromatic data frames into one big one####
aromatic_mt <- rbind(MT_01_aro, MT_02_aro, MT_03_aro, MT_05B_aro, MT_05C_aro, MT_06_aro, MT_07_aro, MT_08_aro,
                     MT_09A_aro, MT_10_aro, MT_11_aro, MT_12A_aro, MT_12B_aro, MT_13A_aro, MT_13C_aro)
head(aromatic_mt)

aromatic_mt$type <- "Metatranscriptome"

aromatic_mt <- rename(aromatic_mt, GPM=TPM)

aromatic <- rbind(aromatic, aromatic_mt)
head(aromatic)
tail(aromatic)

####group by genus####
aromatic_sep <- separate(aromatic, taxonomy, c("domain", "phylum", "class", "order", "family", "genus", "species", "strain"),
                      sep=";", remove=TRUE)
head(aromatic_sep)

aromatic_sep <- subset(aromatic_sep, genus !="Thermus")

aromatic_sep <- subset(aromatic_sep, select=-c(genus, species, strain))
head(aromatic_sep)

aromatic_sep$taxonomy <- paste(aromatic_sep$domain, aromatic_sep$phylum, aromatic_sep$class, aromatic_sep$order,
                            aromatic_sep$family, sep=";")
head(aromatic_sep)

write.csv(aromatic_sep, "aromatic_dataset_rawGPM.csv", row.names=FALSE)

aromatic_sep <- read.csv("aromatic_dataset_rawGPM.csv")
####only keep things above 75% ID####
aromatic_75 <- aromatic_sep
levels(aromatic_75$taxonomy) <- c(levels(aromatic_75$taxonomy), "less_than_75%_ID")
aromatic_75$taxonomy[aromatic_75$percent_id_tax<75] <- "less_than_75%_ID"
head(aromatic_75, n=20)


aromatic_by_family <- aggregate(aromatic_sep$GPM, by=list(aromatic_sep$taxonomy, aromatic_sep$KO_num, aromatic_sep$time, aromatic_sep$type, aromatic_sep$Depth), FUN=sum)
head(aromatic_by_family)
aromatic_by_family <- rename(aromatic_by_family, Taxonomy=Group.1, KO_num=Group.2, realtime=Group.3, Type=Group.4, Depth=Group.5, GPM=x)

aromatic_by_family_pad <- expand(aromatic_by_family, nesting(Taxonomy, KO_num, realtime, Type, Depth), realtime)
head(aromatic_by_family_pad)


###now get sum for dataset with < 75 as tax###
aromatic_by_family_75 <- aggregate(aromatic_75$GPM, by=list(aromatic_75$taxonomy, aromatic_75$EC, aromatic_75$timepoint, aromatic_75$type), FUN=sum)
head(aromatic_by_family_75)
aromatic_by_family_75 <- rename(aromatic_by_family_75, taxonomy=Group.1, EC=Group.2, realtime=Group.3, type=Group.4, GPM=x)

aromatic_by_family_pad_75 <- expand(aromatic_by_family_75, nesting(taxonomy, EC, realtime, type), realtime)
head(aromatic_by_family_pad_75)
?complete

#aromatic_by_family_pad_75 <- expand(aromatic_by_family_75, nesting(taxonomy, EC, timepoint, type), timepoint)
#head(aromatic_by_family_pad_75)


#######merge aromatic_by_family_pad with aromatic_by_family to get GPM associated with each timepoint#####
####rename the timepoint column in aromatic_by_family to timepoint1####
head(aromatic_by_family)
aromatic_by_family_pad <- rename(aromatic_by_family_pad, timepoint=realtime1)
aromatic_by_family <- rename(aromatic_by_family, timepoint=realtime)
aromatic_by_family_pad <- subset(aromatic_by_family_pad, select=-c(realtime))

typeof(aromatic_by_family$timepoint)
typeof(aromatic_by_family_pad$timepoint)
?merge
head(aromatic_by_family_pad)
head(aromatic_by_family)
aromatic_by_family_padded <- merge(aromatic_by_family_pad, aromatic_by_family, by=c("Taxonomy", "KO_num", "Type", "timepoint"), all=TRUE)
head(aromatic_by_family_padded)
tail(aromatic_by_family_padded)

aromatic_by_family_padded[is.na(aromatic_by_family_padded)] <- 0
aromatic_by_family_padded <- unique(aromatic_by_family_padded)


write.csv(aromatic_by_family_padded, "20190204_aromatic_by_family_padded_ko.csv")

gen_mg <- subset(aromatic_by_family_padded, EC=="KO:K00450" & type=="metagenome")
write.csv(gen_mg, "gentisate_mg_commcomp.csv", row.names = FALSE)
gen_mt <-subset(aromatic_by_family_padded, EC=="KO:K00450" & type=="metatranscriptome")
write.csv(gen_mt, "gentisate_mt_commcomp.csv", row.names=FALSE)
pcag_mg <- subset(aromatic_by_family_padded, EC=="KO:K00448" & type=="metagenome")
write.csv(pcag_mg, "pcaG_mg_commcomp.csv", row.names=FALSE)
pcag_mt <- subset(aromatic_by_family_padded, EC=="KO:K00448" & type=="metatranscriptome")
write.csv(pcag_mt, "pcaG_mt_commcomp.csv", row.names=FALSE)
pcah_mg<-subset(aromatic_by_family_padded, EC=="KO:K00449" & type=="metagenome")
write.csv(pcah_mg, "pcaH_mg_commcomp.csv", row.names=FALSE)
pcah_mt <- subset(aromatic_by_family_padded, EC=="KO:K00449" & type=="metatranscriptome")
write.csv(pcah_mt, "pcaH_mt_commcomp.csv", row.names=FALSE)
cata_mg<- subset(aromatic_by_family_padded, EC=="KO:K03381" & type=="metagenome")
write.csv(cata_mg, "catA_mg_commcomp.csv", row.names=FALSE)
cata_mt <- subset(aromatic_by_family_padded, EC=="KO:K03381" & type=="metatranscriptome")
write.csv(cata_mt, "catA_mt_commcomp.csv", row.names=FALSE)
cate_mg <- subset(aromatic_by_family_padded, EC=="KO:K07104" & type=="metagenome")
write.csv(cate_mg, "catE_mg_commcomp.csv", row.names=FALSE)
cate_mt <- subset(aromatic_by_family_padded, EC=="KO:K07104" & type=="metatranscriptome")
write.csv(cate_mt, "catE_mt_commcomp.csv", row.names=FALSE)
boxa_mg <- subset(aromatic_by_family_padded, EC=="KO:K15511" & type=="metagenome")
write.csv(boxa_mg, "boxA_mg_commcomp.csv", row.names=FALSE)
boxa_mt <- subset(aromatic_by_family_padded, EC=="KO:K15511" & type=="metatranscriptome")
write.csv(boxa_mt, "boxA_mt_commcomp.csv", row.names=FALSE)
boxb_mg <- subset(aromatic_by_family_padded, EC=="KO:K15512" & type=="metagenome")
write.csv(boxb_mg, "boxB_mg_commcomp.csv", row.names=FALSE)
boxb_mt <- subset(aromatic_by_family_padded, EC=="KO:K15512" & type=="metatranscriptome")
write.csv(boxb_mt, "boxB_mt_commcomp.csv", row.names=FALSE)

boxA <- subset(aromatic_by_family_padded_75, EC=="EC:1.14.13.208")
boxA$GPM[boxA$GPM<=0.5] <-0


write.csv(boxA, "boxA_tax.csv")

p <- ggplot(boxA, aes(timepoint, GPM, fill=taxonomy)) +
  geom_area(position="stack") +
  facet_grid(~ type)

print(p)
boxA_pad <- read.csv("boxA_tax_padded.csv")

pp <- ggplot(boxA_pad, aes(timepoint, GPM, fill=taxonomy)) +
  geom_area(position="stack") +
  ggtitle("boxA taxonomy") +
  scale_x_continuous(breaks=c(4, 8, 12)) +
  guides(fill=guide_legend(ncol=1)) +
  theme_classic() +
  theme(text = element_text(size=12))
  
#theme(legend.position="none")
print(pp)

vanA <- subset(aro, EC=="EC:1.14.13.82")
vanA <- subset(vanA, GPM >=0.5)
vanAp <- ggplot(vanA, aes(timepoint, GPM, fill=taxonomy)) +
  geom_area(position = "stack")
print(vanAp)

write.csv(vanA, "vanA_mg_tax.csv")

vanA_pad <- read.csv("vanA_mg_tax.csv")
vanApp <- ggplot(vanA_pad, aes(timepoint, GPM, fill=taxonomy)) +
  geom_area(position = "stack") +
  theme_classic() +
  ggtitle("vanA taxonomy")
print(vanApp)

ggsave("vanA_mg_tax.pdf", height=20, width=20)
