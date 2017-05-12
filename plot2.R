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
#   Create R.date.time column for plotting
#################################################

Date_time <- paste(as.Date(Power_dat$Date), Power_dat$Time)
Power_dat$Datetime <- as.POSIXct(Date_time)


############### 
#Plot 2
###############

plot(  x=Power_dat$Datetime
       , y=Power_dat$Global_active_power
       , ylab="Global Active Power (kilowatts)"
       , xlab=""
       , type="l")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()


