#set working directory
setwd("C:/Users/Mei/Documents/Exploratory DA")

# read data from the files

library(dplyr)
electric <- read.table("household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE, header = TRUE)
#subset data 
subelectric <- filter(electric, Date == "1/2/2007" | Date == "2/2/2007")   
str(subelectric)

#convert Date and Time variables to Date/Time classes in R
datetime <- strptime(paste(subelectric$Date, subelectric$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

# convert class of Sub_meterings
Submetering <- as.numeric(c(subelectric$Sub_metering_1, subelectric$Sub_metering_2, subelectric$Sub_metering_3))

#create a png file with specific width and height, plot a scatterplot and save it as png file.
png(file = "plot3.png", width = 480, height = 480)
with(subelectric, plot(datetime, Sub_metering_1, ylab = "Energy sub metering", type = "n"))
with(subelectric, lines(datetime, Sub_metering_1, col = "black"))
with(subelectric, lines(datetime, Sub_metering_2, col = "red"))
with(subelectric, lines(datetime, Sub_metering_3, col = "blue"))
legend("topright", lty = 1, lwd = 2, col = c("black", "red", "blue"), 
      legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()