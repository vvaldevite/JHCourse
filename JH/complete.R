complete <- function(directory, id = 1:332) {
    files_names <- c("a")
    df <- data.frame(id = numeric(), nobs = numeric())

    i <- 1
    while(i <= length(id)){
        ##create the string to the file names
        files_names[i] <- paste(directory, "\\", formatC(id[i], width=3, flag="0"), ".csv", sep="")

        ##read the files
        file = read.csv(files_names[i])
        
        df[i,] <- c(id[i],nrow(file[complete.cases(file),]))

        i <- i + 1
    }
    df
}