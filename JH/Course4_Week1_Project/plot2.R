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
    
    ##plot a histogram
    outpath <- "Course4_Week1_Project\\plot2.png"
    png(file=outpath,width=480,height=480)
    plot(date,data$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)")
    dev.off()
    sprintf("File saved in WD as: %s", outpath)
}