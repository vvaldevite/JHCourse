pollutantmean <- function(directory, pollutant, id = 1:332){
    files_names <- c("a","b")
    numbers <- numeric()
    i <- 1
    while(i <= length(id)){
        ##create the string to the file names
        files_names[i] <- paste(directory, "\\", formatC(id[i], width=3, flag="0"), ".csv", sep="")
        
        ##read the files
        file = read.csv(files_names[i])
        
        ##append all the numbers in a vector
        numbers <- c(numbers,file[,pollutant])
        i <- i+1
    }
    ##return the mean
    mean(numbers, na.rm=TRUE)
}