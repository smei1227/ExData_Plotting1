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

# convert class of Global_active_power to numberic
GlobalActivePower <- as.numeric(subelectric$Global_active_power)

#create a png file with specific width and height, plot a scatterplot and save it as png file.
png(file = "plot2.png", width = 480, height = 480)
plot(datetime, GlobalActivePower, type = "l", ylab = "Global Active Power (killowatts)")
dev.off()