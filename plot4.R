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

############### 
#Plot 4
###############


par(mfrow = c(2,2))
with(Power_dat, {
  ####  Plot 1
  plot(x=Power_dat$Datetime 
       , y=Power_dat$Global_active_power       
       , xlab=""
       , ylab="Global Active Power"
       , type="l")
  ####   Plot 2
  plot(x=Power_dat$Datetime 
       , y=Power_dat$Voltage
       , xlab="datetime"
       , ylab="Voltage"
       , type="l")
  ####   Plot 3
  plot(x=Power_dat$Datetime
       , y=Power_dat$Sub_metering_1
       , xlab=""
       , ylab="Energy sub metering"
       , type="l")
  lines(x=Power_dat$Datetime
        , y=Power_dat$Sub_metering_2
        , type="l"
        , col="red")
  lines(x=Power_dat$Datetime
        , y=Power_dat$Sub_metering_3
        , type="l"
        , col="blue")
  legend("topright"
         , lwd=c(1, 1, 1)
         , y.intersp=0.75
         , cex=0.9
         , col=c("black", "red", "blue")
         , legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
         , bty="n")
  ####   Plot 4
  plot(x=Power_dat$Datetime
       , y=Power_dat$Global_reactive_power
       , xlab="datetime"
       , ylab="Global_reactive_power"
       , type="l")
})
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()