lig <- read.csv("lignintide.csv")
head(lig)
lig$Lignin <- lig$Lignin*12.5

tm1 <- as.POSIXct("2014-07-16 11:00")
tm2 <- as.POSIXct("2014-07-16 13:00")
tm3 <- as.POSIXct("2014-07-16 15:00")
tm4 <- as.POSIXct("2014-07-16 17:00")
tm5 <- as.POSIXct("2014-07-16 19:00")
tm6 <- as.POSIXct("2014-07-16 21:15")
tm7 <- as.POSIXct("2014-07-16 23:15")
tm8 <- as.POSIXct("2014-07-17 1:15")
tm9 <- as.POSIXct("2014-07-17 3:30")
tm10 <- as.POSIXct("2014-07-17 5:30")
tm11 <- as.POSIXct("2014-07-17 7:30")
tm12 <- as.POSIXct("2014-07-17 9:30")
tm13 <- as.POSIXct("2014-07-17 11:45")


lig$Time[lig$Timepoint==1] <- tm1
lig$Time[lig$Timepoint==2] <- tm2
lig$Time[lig$Timepoint==3] <- tm3
lig$Time[lig$Timepoint==4] <- tm4
lig$Time[lig$Timepoint==5] <- tm5
lig$Time[lig$Timepoint==6] <- tm6
lig$Time[lig$Timepoint==7] <- tm7
lig$Time[lig$Timepoint==8] <- tm8
lig$Time[lig$Timepoint==9] <- tm9
lig$Time[lig$Timepoint==10] <- tm10
lig$Time[lig$Timepoint==11] <- tm11
lig$Time[lig$Timepoint==12] <- tm12
lig$Time[lig$Timepoint==13] <- tm13

lig$Time <- as.POSIXct(lig$Time, origin = "1970-01-01")


head(lig)
require(ggplot2)

tide_p <- ggplot(lig, aes(Time, Depth)) +
  geom_point(aes(x=Time, y=Depth), shape=15, size=4) +
  geom_point(aes(x=Time, y=Lignin), size=8, colour="darkgreen") +
  geom_line(aes(x=Time, y=Depth)) +
  theme_classic() +
  scale_x_datetime() +
  scale_y_continuous(sec.axis = sec_axis(~./12.5, name="Lignin Concentration (mg/100 mg OC)")) +
  theme(text = element_text(size=24)) +
  xlab("Time of Sample Collection") +
  ylab("Depth (m)") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
print(tide_p)
ggsave("lignin_tide.pdf")

