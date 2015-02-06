##@author: Victor Valdevite Pinto
##objective: plot a histogram graphic with the data provided by Coursera's Project scope

##required packages: dplyr, lubridate

run <- function(){
    library(dplyr)
    library(lubridate)
    
    ##read the full data
    print("Reading data...")
    filepath <- "Course4_Week1_Project\\household_power_consumption.txt"
    data <- read.table(filepath, header=TRUE, sep = ";")
    
    ##filter for 2007/02/01 and 2007/02/02
    data <- filter(data, Date == "1/2/2007" | Date == "2/2/2007")
    
    ##create the Date + Time variable
    date <- dmy_hms(paste(as.character(data$Date),as.character(data$Time)))
    
    ##turn Global_active_power into numeric
    data$Global_active_power <- as.character(data$Global_active_power)
    data$Global_active_power <- as.numeric(data$Global_active_power)
    
    ##turn Sub_metering_1 into numeric
    data$Sub_metering_1 <- as.character(data$Sub_metering_1)
    data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
    
    ##turn Sub_metering_2 into numeric
    data$Sub_metering_2 <- as.character(data$Sub_metering_2)
    data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
    
    ##turn Sub_metering_3 into numeric
    data$Sub_metering_3 <- as.character(data$Sub_metering_3)
    data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)
    
    ##turn Voltage into numeric
    data$Voltage <- as.character(data$Voltage)
    data$Voltage <- as.numeric(data$Voltage)
    
    ##turn Global_reactive_power into numeric
    data$Global_reactive_power <- as.character(data$Global_reactive_power)
    data$Global_reactive_power <- as.numeric(data$Global_reactive_power)
    
    ##open fie
    outpath <- "Course4_Week1_Project\\plot4.png"
    png(file=outpath,width=480,height=480)
    
    ##split screen into 4 pieces
    par(mfrow = c(2,2))
    
    ##plot graph 1
    plot(date,data$Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")
    
    ##plot graph 2
    plot(date,data$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")
    
    ##plot graph 3
    plot(date,data$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "", col="black")
    lines(date,data$Sub_metering_2, col = "red")
    lines(date,data$Sub_metering_3, col = "blue")
    legend("topright", col=c("black","red","blue"), lty=1, bty = "n",
           legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    
    ##plot graph 4
    plot(date,data$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime")
    
    ##close file
    dev.off()
    sprintf("File saved in WD as: %s", outpath)
}