require(dplyr)
require(splitstackshape)
require(tidyr)
require(ggplot2)
detach("package:plyr", unload=TRUE)
CAZy <- read.csv("CAZy_GPM.csv")
CAZy_anno <- read.delim("CAZyDB-ec-info.txt", sep="\t")
head(CAZy_anno)
CAZy <- cSplit(CAZy, "CAZy", "|")
head(CAZy)
CAZy <- subset(CAZy, select=-c(CAZy_3, CAZy_4))
CAZy <- rename(CAZy, genbank=CAZy_1, family=CAZy_2)
CAZy$class <- substr(CAZy$family, 0, 2)
head(CAZy)

tm1 <- as.POSIXct("2014-07-16 11:00")
tm2 <- as.POSIXct("2014-07-16 13:00")
tm3 <- as.POSIXct("2014-07-16 15:00")
tm4 <- as.POSIXct("2014-07-16 17:00")
tm5 <- as.POSIXct("2014-07-16 19:00")
tm5.5 <- as.POSIXct("2014-07-16 20:00")
tm6 <- as.POSIXct("2014-07-16 21:15")
tm7 <- as.POSIXct("2014-07-16 23:15")
tm8 <- as.POSIXct("2014-07-17 1:15")
tm9 <- as.POSIXct("2014-07-17 3:30")
tm9.5 <- as.POSIXct("2014-07-17 4:30")
tm10 <- as.POSIXct("2014-07-17 5:30")
tm11 <- as.POSIXct("2014-07-17 7:30")
tm12 <- as.POSIXct("2014-07-17 9:30")
tm12.5 <- as.POSIXct("2014-07-17 10:30")
tm13 <- as.POSIXct("2014-07-17 11:45")
tm13.5 <- as.POSIXct("2014-07-17 12:45")

CAZy$TimeCC[CAZy$time==1] <- tm1
CAZy$TimeCC[CAZy$time==2] <- tm2
CAZy$TimeCC[CAZy$time==3] <- tm3
CAZy$TimeCC[CAZy$time==4] <- tm4
CAZy$TimeCC[CAZy$time==5] <- tm5
CAZy$TimeCC[CAZy$time==5.5] <- tm5.5
CAZy$TimeCC[CAZy$time==6] <- tm6
CAZy$TimeCC[CAZy$time==7] <- tm7
CAZy$TimeCC[CAZy$time==8] <- tm8
CAZy$TimeCC[CAZy$time==9] <- tm9
CAZy$TimeCC[CAZy$time==9.5] <- tm9.5
CAZy$TimeCC[CAZy$time==10] <- tm10
CAZy$TimeCC[CAZy$time==11] <- tm11
CAZy$TimeCC[CAZy$time==12] <- tm12
CAZy$TimeCC[CAZy$time==12.5] <- tm12.5
CAZy$TimeCC[CAZy$time==13] <- tm13
CAZy$TimeCC[CAZy$time==13.5] <- tm13.5

CAZy$Depth[CAZy$time==1] <- 4
CAZy$Depth[CAZy$time==2] <- 4.4
CAZy$Depth[CAZy$time==3] <- 3.7
CAZy$Depth[CAZy$time==4] <- 2.2
CAZy$Depth[CAZy$time==5] <- 1.9
CAZy$Depth[CAZy$time==5.5] <- 1.9
CAZy$Depth[CAZy$time==6] <- 3.1
CAZy$Depth[CAZy$time==7] <- 4
CAZy$Depth[CAZy$time==8] <- 4.5
CAZy$Depth[CAZy$time==9] <- 3.7
CAZy$Depth[CAZy$time==9.5] <- 3.7
CAZy$Depth[CAZy$time==10] <- 2.3
CAZy$Depth[CAZy$time==11] <- 1.8
CAZy$Depth[CAZy$time==12] <- 2.9
CAZy$Depth[CAZy$time==12.5] <- 2.9
CAZy$Depth[CAZy$time==13] <- 4
CAZy$Depth[CAZy$time==13.5] <- 4

CAZy$TimeCC <- as.POSIXct(CAZy$TimeCC, origin = "1970-01-01")

CAZy$Time[CAZy$time==1] <- tm1
CAZy$Time[CAZy$time==2] <- tm2
CAZy$Time[CAZy$time==3] <- tm3
CAZy$Time[CAZy$time==4] <- tm4
CAZy$Time[CAZy$time==5] <- tm5
CAZy$Time[CAZy$time==5.5] <- tm5
CAZy$Time[CAZy$time==6] <- tm6
CAZy$Time[CAZy$time==7] <- tm7
CAZy$Time[CAZy$time==8] <- tm8
CAZy$Time[CAZy$time==9] <- tm9
CAZy$Time[CAZy$time==9.5] <- tm9
CAZy$Time[CAZy$time==10] <- tm10
CAZy$Time[CAZy$time==11] <- tm11
CAZy$Time[CAZy$time==12] <- tm12
CAZy$Time[CAZy$time==12.5] <- tm12
CAZy$Time[CAZy$time==13] <- tm13
CAZy$Time[CAZy$time==13.5] <- tm13
CAZy$Time <- as.POSIXct(CAZy$Time, origin = "1970-01-01")
head(CAZy)
tail(CAZy)
#CAZy_anno <- rename(CAZy_anno, family=X.family, EC=ec, enzyme_name=name)
#head(CAZy_anno)

#CAZy <- merge(CAZy, CAZy_anno)

head(CAZy)
CAZy_by_class <- aggregate(CAZy$GPM, by=list(CAZy$type, CAZy$TimeCC, CAZy$class, CAZy$Depth, CAZy$time), FUN=sum)
head(CAZy_by_class)
tail(CAZy_by_class)
CAZy_by_class <- rename(CAZy_by_class, Type=Group.1, Time=Group.2, Class=Group.3, Depth=Group.4, TimePoint=Group.5, Count=x)
require(plyr)
#CAZy_by_class$Class <- revalue(CAZy_by_class$Class, c(AA="Auxilary Activities", GH="Glycoside Hydrolases", GT="Glycosyl Transferases", CB="Carbohydrate Binding Module", PL="Polysaccharide Lyases", CE="Carbohydrate Esterases"))
#write.csv(CAZy_by_class, "cazy_by_class.csv", row.names=FALSE)
#CAZy_by_class <- read.csv("cazy_by_class.csv")
require(ggplot2)
tail(CAZy_by_class)
CAZy_by_class$Depth <- CAZy_by_class$Depth*333.333
CAZy_by_class_Depth <- subset(CAZy_by_class, Class=="Glycosyltransferases")
head(CAZy_by_class_Depth)

cazy_class_p <- ggplot(CAZy_by_class, aes(Time, Count, fill=Class)) +
  geom_area() + 
  geom_point(data=CAZy_by_class, aes(x=Time, y=Depth)) +
  geom_line(data=CAZy_by_class_Depth, aes(x=Time, y=Depth)) +
  facet_grid(~Type) +
  theme_classic() +
  scale_x_datetime() +
  scale_fill_manual(values=c("pink", "coral", "springgreen3", "turquoise", "violet", "rosybrown4")) +
  theme(text = element_text(size=20)) +
  scale_y_continuous(sec.axis = sec_axis(~./333.333, name="Depth (m)")) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  ylab("Genes or Transcripts per Million (GPM or TPM)") +
  xlab("Time of Sample Collection") +
  theme(text=element_text(size=23)) +
  theme(legend.position="bottom")
print(cazy_class_p)
ggsave("20190205_CAZyClass.pdf", width=18, height=9)


CAZy_sep <- separate(CAZy, taxonomy, c("domain", "phylum", "class", "order", "family", "genus", "species", "strain"),
                            sep=";", remove=TRUE)
CAZy_sep <- subset(CAZy_sep, select=-c(phylum, class, order, family, genus, species, strain))
head(CAZy_sep)
CAZy_domain <- aggregate(CAZy_sep$GPM, by=list(CAZy_sep$type, CAZy_sep$TimeCC, CAZy_sep$domain, CAZy_sep$Depth), FUN=sum)
head(CAZy_domain)
tail(CAZy_domain)
CAZy_domain <- rename(CAZy_domain, Type=Group.1, Time=Group.2, Domain=Group.3, Depth=Group.4, Count=x)
CAZy_domain_family <- aggregate(CAZy_sep$GPM, by=list(CAZy_sep$type, CAZy$TimeCC, CAZy_sep$domain, CAZy$family, CAZy$Depth), FUN=sum)
head(CAZy_domain_family)
CAZy_domain_family <- rename(CAZy_domain_family, Type=Group.1, Time=Group.2, Domain=Group.3, CAZy_Family=Group.4, Depth=Group.5, Count=x)
CAZy_domain_family <- subset(CAZy_domain_family, CAZy_Family!="PL0" & CAZy_Family!="PL11" & CAZy_Family!="PL1" & CAZy_Family!="AA3" & CAZy_Family!="AA4"
                             & CAZy_Family!="GT0" & CAZy_Family!="CE0" & CAZy_Family!="GH0")
CAZy_domain$Depth <- CAZy_domain$Depth*333.333
head(CAZy_domain)
CAZy_domain_depth <- subset(CAZy_domain, Domain=="Bacteria")

cazy_domain_p <- ggplot(CAZy_domain, aes(Time, Count, fill=Domain)) +
  geom_area() +
  geom_point(data=CAZy_domain, aes(x=Time, y=Depth)) +
  geom_line(data=CAZy_domain_depth, aes(x=Time, y=Depth)) +
  facet_wrap(~Type) +
  theme_classic() +
  scale_x_datetime() +
  scale_y_continuous(sec.axis = sec_axis(~./333.333, name="Depth (m)")) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  scale_fill_manual(values=c("coral", "springgreen3", "turquoise", "violet")) +
  theme(text = element_text(size=20)) +
  ylab("Genes or Transcripts per Million (GPM or TPM)") +
  theme(text=element_text(size=23)) +
  xlab("Time of Sample Collection") +
  theme(legend.position="bottom")
print(cazy_domain_p)
ggsave("20190205_CAZyDomain.pdf", width=18, height=9)


Aux <- subset(CAZy, class=="Auxiliary Activities")
head(Aux)
tail(Aux)
Aux_by_activity <- aggregate(Aux$GPM, by=list(Aux$type, Aux$Time, Aux$family, Aux$Depth, Aux$time), FUN=sum)
head(Aux_by_activity)
Aux_by_activity <- rename(Aux_by_activity, Type=Group.1, Time=Group.2, Family=Group.3, Depth=Group.4, Timepoint=Group.5, GPM=x)
Aux_by_activity <- subset(Aux_by_acitivity, Family!="AA3_2")

Aux_by_activity$Depth[Aux_by_activity$Family=="AA10"] <- Aux_by_activity$Depth[Aux_by_activity$Family=="AA10"]*88.889
Aux_by_activity$Depth[Aux_by_activity$Family=="AA2"] <- Aux_by_activity$Depth[Aux_by_activity$Family=="AA2"]*11.111
Aux_by_activity$Depth[Aux_by_activity$Family=="AA3"] <- Aux_by_activity$Depth[Aux_by_activity$Family=="AA3"]*66.667
Aux_by_activity$Depth[Aux_by_activity$Family=="AA6"] <- Aux_by_activity$Depth[Aux_by_activity$Family=="AA6"]*6.667

Aux_by_activity$Family <- recode_factor(Aux_by_activity$Family, AA6="1,4-benzoquinone reductases", AA2="class II lignin-modifying peroxidases", 
                                 AA3="glucose-methanol-choline oxidases", AA10="lytic polysaccharide monooxygenases (LPMOs)", AA4="vanillyl-alcohol oxidases")

head(Aux_by_activity)

oxo_p <- ggplot(Aux_by_activity, aes(Time, GPM)) +
  geom_point(aes(shape=Type, colour=Type), size=8) +
  geom_point(aes(x=Time, y=Depth), shape=15, size=4) +
  geom_line(aes(x=Time, y=Depth)) +
  facet_wrap(~ Family, scales="free_y") +
  theme_classic() +
  scale_colour_manual(values=c("springgreen", "darkgreen")) +
  scale_x_datetime() +
  scale_y_continuous(sec.axis = dup_axis(name="Depth (m)", breaks=c(0, 2, 4))) +
  theme(text = element_text(size=24)) +
  xlab("Time of Sample Collection") +
  ylab("Genes or Transcripts per Million (GPM or TPM)") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  theme(text=element_text(size=29)) +
  theme(legend.position="bottom")
print(oxo_p)
ggsave("20190205_AuxilaryActivities.pdf", height=16, width=24)

Auxcommcomp <- subset(Aux, family=="AA10" | family=="AA2" | family=="AA6")
Auxcommcomp_sep <- separate(Auxcommcomp, taxonomy, c("domain", "phylum", "class", "order", "family", "genus", "species", "strain"),
                         sep=";", remove=TRUE)
Auxcommcomp_sep <- subset(Auxcommcomp_sep, select=-c(genus, species, strain))
Auxcommcomp_sep$taxonomy <- paste(Auxcommcomp_sep$domain, Auxcommcomp_sep$phylum, Auxcommcomp_sep$class, Auxcommcomp_sep$order,
                               Auxcommcomp_sep$family, sep=";")
Auxcommcomp_set <- subset(Auxcommcomp_sep, select=-c(domain, phylum, class, order, family))
head(Auxcommcomp_set)
Aux_by_family <- aggregate(Auxcommcomp_sep$GPM, by=list(Auxcommcomp_sep$taxonomy, Auxcommcomp_sep$activity, Auxcommcomp_sep$time, Auxcommcomp_sep$type), FUN=sum)
head(Aux_by_family)
Aux_by_family <- rename(Aux_by_family, Taxonomy=Group.1, Activity=Group.2, Time=Group.3, Type=Group.4, GPM=x)

Aux_by_family_pad <- expand(Aux_by_family, nesting(Taxonomy, Activity, Time, Type), Time)
head(Aux_by_family_pad)
head(Aux_by_family)
Aux_by_family <- rename(Aux_by_family, Time1=Time)
Aux_by_family_pad <- subset(Aux_by_family_pad, select=-c(Time))

Aux_by_family_padded <- merge(Aux_by_family_pad, Aux_by_family, by=c("Taxonomy", "Activity", "Type", "Time1"), all=TRUE)
head(Aux_by_family_padded)
tail(Aux_by_family_padded)
Aux_by_family_padded[is.na(Aux_by_family_padded)] <- 0
Aux_by_family_padded <- unique(Aux_by_family_padded)

write.csv(Aux_by_family_padded, "dbCAN_oxidases_commcomp.csv", row.names = FALSE)

AA <- read.csv("dbCAN_oxidases_commcomp_under2.csv")
head(AA)
tail(AA)
tm1 <- as.POSIXct("2014-07-16 11:00")
tm2 <- as.POSIXct("2014-07-16 13:00")
tm3 <- as.POSIXct("2014-07-16 15:00")
tm4 <- as.POSIXct("2014-07-16 17:00")
tm5 <- as.POSIXct("2014-07-16 19:00")
tm5.5 <- as.POSIXct("2014-07-16 20:00")
tm6 <- as.POSIXct("2014-07-16 21:15")
tm7 <- as.POSIXct("2014-07-16 23:15")
tm8 <- as.POSIXct("2014-07-17 1:15")
tm9 <- as.POSIXct("2014-07-17 3:30")
tm9.5 <- as.POSIXct("2014-07-17 4:30")
tm10 <- as.POSIXct("2014-07-17 5:30")
tm11 <- as.POSIXct("2014-07-17 7:30")
tm12 <- as.POSIXct("2014-07-17 9:30")
tm12.5 <- as.POSIXct("2014-07-17 10:30")
tm13 <- as.POSIXct("2014-07-17 11:45")
tm13.5 <- as.POSIXct("2014-07-17 12:45")

AA$SampleTime[AA$Time==1] <- tm1
AA$SampleTime[AA$Time==2] <- tm2
AA$SampleTime[AA$Time==3] <- tm3
AA$SampleTime[AA$Time==4] <- tm4
AA$SampleTime[AA$Time==5] <- tm5
AA$SampleTime[AA$Time==5.5] <- tm5.5
AA$SampleTime[AA$Time==6] <- tm6
AA$SampleTime[AA$Time==7] <- tm7
AA$SampleTime[AA$Time==8] <- tm8
AA$SampleTime[AA$Time==9] <- tm9
AA$SampleTime[AA$Time==9.5] <- tm9.5
AA$SampleTime[AA$Time==10] <- tm10
AA$SampleTime[AA$Time==11] <- tm11
AA$SampleTime[AA$Time==12] <- tm12
AA$SampleTime[AA$Time==12.5] <- tm12.5
AA$SampleTime[AA$Time==13] <- tm13
AA$SampleTime[AA$Time==13.5] <- tm13.5
head(AA)
tail(AA)
AA$SampleTime <- as.POSIXct(AA$SampleTime, origin = "1970-12-30")

LPMO <- subset(AA, Activity=="lytic polysaccharide monooxygenases (LPMO)")
per <- subset(AA, Activity=="class II lignin-modifying peroxidases")
bq <- subset(AA, Activity=="1,4-benzoquinone reductases")

LPMO <- aggregate(LPMO$GPM, by=list(LPMO$Taxonomy, LPMO$SampleTime, LPMO$Type, LPMO$Depth), FUN=sum)
head(LPMO)
LPMO <- rename(LPMO, Taxonomy=Group.1, Time=Group.2, Type=Group.3, Depth=Group.4, Count=x)
LPMO <- separate(LPMO, Taxonomy, c("domain", "phylum", "class", "order", "family"),
                            sep=";", remove=TRUE)
head(LPMO)
LPMO <- subset(LPMO, select=-c(class, order))
LPMO$Taxonomy <- paste(LPMO$domain, LPMO$phylum, LPMO$family, sep=";")

LPMO$Depth <- LPMO$Depth*44.444

LPMO_p <- ggplot(LPMO, aes(Time, Count, fill=Taxonomy)) +
  geom_area() +
  geom_point(data=LPMO, aes(Time, Depth)) +
  geom_line(data=LPMO, aes(Time, Depth)) +
  facet_grid(~Type) +
  scale_x_datetime() +
  scale_y_continuous(sec.axis = sec_axis(~./44.444, name="Depth (m)", breaks=c(0,2,4))) +
  scale_fill_manual(values=c("pink","#EE3E80", "red", "#FF8200", "tomato", 
                             "gold2", "yellow", "lawngreen", 
                             "springgreen3", "darkgreen", "navyblue", "royalblue2",
                             "turquoise", "powderblue", "thistle", "purple",
                             "darkmagenta", "violetred4", "deeppink", "palevioletred", "rosybrown4",
                             "mistyrose4", "snow3")) +
  theme_classic() +
  guides(fill=guide_legend(ncol=2)) +
  theme(text = element_text(size=17.5)) +
  xlab("Time of Sample Collection") +
  ylab("Genes or Transcripts per Million (GPM or TPM)") +
  theme(legend.position="bottom") +
  theme(text=element_text(size=35)) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
print(LPMO_p)
ggsave("20190207_LPMO.pdf", height=16, width=24)

per <- aggregate(per$GPM, by=list(per$Taxonomy, per$SampleTime, per$Type, per$Depth), FUN=sum)
head(per)
per <- rename(per, Taxonomy=Group.1, Time=Group.2, Type=Group.3, Depth=Group.4, Count=x)
per <- separate(per, Taxonomy, c("domain", "phylum", "class", "order", "family"),
                 sep=";", remove=TRUE)
head(per)
per <- subset(per, select=-c(class, order))
per$Taxonomy <- paste(per$domain, per$phylum, per$family, sep=";")

per$Depth <- per$Depth*6.667

per_p <- ggplot(per, aes(Time, Count, fill=Taxonomy)) +
  geom_area() +
  facet_grid(~Type) +
  scale_x_datetime() +
  scale_y_continuous(sec.axis = sec_axis(~./44.444, name="Depth (m)", breaks=c(0,2,4))) +
  scale_fill_manual(values=c("pink", "palevioletred", "#EE3E80", "red", "#FF8200", "tomato", 
                             "gold2", "yellow", "lawngreen", 
                             "darkgreen", "navyblue", "royalblue2",
                             "turquoise", "thistle", "purple",
                             "violetred4", "deeppink", "rosybrown4")) +
  geom_point(data=per, aes(Time, Depth)) +
  geom_line(data=per, aes(Time, Depth)) +
  theme_classic() +
  xlab("Time of Sample Collection") +
  ylab("Genes or Transcripts per Million (GPM or TPM)") +
  theme(text=element_text(size=35)) +
  guides(fill=guide_legend(ncol=2)) +
  theme(text = element_text(size=35)) +
  theme(legend.position="bottom") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
print(per_p)
ggsave("20190207_peroxidase.pdf", height = 16, width=24)

bq <- aggregate(bq$GPM, by=list(bq$Taxonomy, bq$Time, bq$Type), FUN=sum)
head(bq)
bq <- rename(bq, Taxonomy=Group.1, Time=Group.2, Type=Group.3, Count=x)
bq <- separate(bq, Taxonomy, c("domain", "phylum", "class", "order", "family"),
                 sep=";", remove=TRUE)
head(bq)
bq <- subset(bq, select=-c(class, order))
bq$Taxonomy <- paste(bq$domain, bq$phylum, bq$family, sep=";")

bq_p <- ggplot(bq, aes(Time, Count, fill=Taxonomy)) +
  geom_area() +
  facet_grid(~Type) +
  theme_classic() +
  scale_x_continuous(breaks=c(4,8,12)) +
  scale_fill_manual(values=c("#EE3E80", "#FF9966",
                             "gold2", "yellow", "lawngreen",
                             "darkgreen", "navyblue",
                             "darkturquoise", "darkmagenta", #"deeppink4",
                             "rosybrown4")) +
  xlab("Time Point") +
  ylab("Genes or Transcripts per Million") +
  guides(fill=guide_legend(ncol=2)) +
  theme(legend.position="bottom") +
  theme(text = element_text(size=20))
print(bq_p)

plantderived <- subset(CAZy, family=="GH19" | family=="GH23" | family=="GH29" | family=="GH2" | family=="GH51" |
                         family=="GH43" | family=="GT2" | family=="GT4" | family=="CE4" | family=="CBM48")
head(plantderived)
plantderived <- aggregate(plantderived$GPM, by=list(plantderived$type, plantderived$time, plantderived$family), FUN=sum)
plantderived <- rename(plantderived, Type=Group.1, time=Group.2, family=Group.3, GPM=x)

pd_p <- ggplot(plantderived, aes(time, GPM)) +
  geom_point(aes(shape=Type, colour=Type), size=8) +
  facet_wrap(~family, scales="free_y", ncol=2) +
  theme_classic() +
  scale_colour_manual(values=c("springgreen", "darkgreen")) +
  scale_x_continuous(breaks=c(4,8,12)) +
  theme(text = element_text(size=24)) +
  xlab("Time Point") +
  ylab("Genes or Transcripts per Million") +
  theme(legend.position="bottom")
print(pd_p)

chitinase <- subset(CAZy, family=="GH19")
chitinase <- aggregate(chitinase$GPM, by=list(chitinase$taxonomy, chitinase$time, chitinase$type), FUN=sum)
head(chitinase)
tail(chitinase)
chitinase <- rename(chitinase, Taxonomy=Group.1, Time=Group.2, Type=Group.3, Count=x)
chitinase <- separate(chitinase, Taxonomy, c("domain", "phylum", "class", "order", "family"),
               sep=";", remove=TRUE)
head(chitinase)
chitinase <- subset(chitinase, select=-c(class, order))
chitinase$Taxonomy <- paste(chitinase$domain, chitinase$phylum, chitinase$family, sep=";")
chitinase <- subset(chitinase, select=-c(domain, phylum, family))

chitinase_by_family_pad <- expand(chitinase, nesting(Taxonomy, Time, Type), Time)
head(chitinase_by_family_pad)
chitinase <- rename(chitinase, Time1=Time)
chitinase_by_family_pad <- subset(chitinase_by_family_pad, select=-c(Time))

chitinase_by_family_padded <- merge(chitinase_by_family_pad, chitinase, by=c("Taxonomy", "Type", "Time1"), all=TRUE)
head(chitinase_by_family_padded)
tail(chitinase_by_family_padded)
chitinase_by_family_padded[is.na(chitinase_by_family_padded)] <- 0
chitinase_by_family_padded <- unique(chitinase_by_family_padded)
write.csv(chitinase_by_family_padded, "chitinase.csv", row.names=FALSE)

