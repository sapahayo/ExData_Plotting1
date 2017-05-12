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

############### 
#Plot 1
###############
hist(Power_dat$Global_active_power, 
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", 
     ylab="Frequency", 
     col="Red")
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()

