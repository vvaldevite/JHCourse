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
    
    ##turn Sub_metering_1 into numeric
    data$Sub_metering_1 <- as.character(data$Sub_metering_1)
    data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
    
    ##turn Sub_metering_2 into numeric
    data$Sub_metering_2 <- as.character(data$Sub_metering_2)
    data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
    
    ##turn Sub_metering_3 into numeric
    data$Sub_metering_3 <- as.character(data$Sub_metering_3)
    data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)
    
    ##plot a graph
    outpath <- "Course4_Week1_Project\\plot3.png"
    png(file=outpath,width=480,height=480)
    plot(date,data$Sub_metering_1, type = "l", ylab = "Energy sub metering", col="black")
    lines(date,data$Sub_metering_2, col = "red")
    lines(date,data$Sub_metering_3, col = "blue")
    legend("topright", col=c("black","red","blue"), lty=1, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    dev.off()
    sprintf("File saved in WD as: %s", outpath)
}