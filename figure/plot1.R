#set working directory
setwd("C:/Users/Mei/Documents/Exploratory DA")

# read data from the files

library(dplyr)
electric <- read.table("household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE, header = TRUE)
#subset data 
subelectric <- filter(electric, Date == "1/2/2007" | Date == "2/2/2007")   
str(subelectric)

# convert class of Global_active_power to numberic
GlobalActivePower <- as.numeric(subelectric$Global_active_power)
#create a png file with specific width and height, plot a histogram and save it as png file.
png(file = "plot1.png", width = 480, height = 480)
hist(GlobalActivePower, col = "RED",
     main = "Global Active Power", xlab = "Global Active Power (killowatts)")
dev.off()
