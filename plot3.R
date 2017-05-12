#######################
# load source dataset
#######################

filename <- "household_power_consumption.txt"
Power_dat_all <- read.csv(filename , sep=";",colClasses=c(rep("character",2), rep("numeric",7)), na.strings="?", check.names=F)


#####################################################
#Subsetting from the dates 2007-02-01 and 2007-02-02
#####################################################

Power_dat_all$Date <- as.Date(Power_dat_all$Date, format="%d/%m/%Y")
Power_dat <- subset(Power_dat_all, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

##########################################
#release variable to get back some memory
##########################################
rm(Power_dat_all)

################################################
#   Create datetime column for plotting
#################################################

Date_time <- paste(as.Date(Power_dat$Date), Power_dat$Time)
Power_dat$Datetime <- as.POSIXct(Date_time)

#Power_dat$Sub_metering_1 <- as.numeric(Power_dat$Sub_metering_1)
#Power_dat$Sub_metering_2 <- as.numeric(Power_dat$Sub_metering_2)
#Power_dat$Sub_metering_3 <- as.numeric(Power_dat$Sub_metering_3)



############### 
#Plot 3
###############
#par(cex = 0.5)
plot(x = Power_dat$Datetime
     , y = Power_dat$Sub_metering_1
     , ylab = "Energy sub metering"
     , xlab = ""
     , type = "l")
lines(x=Power_dat$Datetime
      , y = Power_dat$Sub_metering_2
      , type = "l"
      , col = "red")
lines(x=Power_dat$Datetime
      , y = Power_dat$Sub_metering_3
      , type = "l"
      , col = "blue")
legend("topright"
       , cex = 1
   #    , pt.cex = 1
       , lty = 1
       , col = c("black", "red", "blue")
     , legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
      )
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
