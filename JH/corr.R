corr <- function(directory, threshold = 0) {
    correlations <- numeric()

    file_id <- list.files(directory)
    i <- 1
    j <- 1
    while(i <= length(file_id)){
        ##read the files
        file = read.csv(paste(directory, "\\", file_id[i], sep=""))
        
        completedcases <- file[complete.cases(file),]
        
        if(nrow(completedcases) > threshold){
            correlations[j] <- cor(completedcases[,2],completedcases[,3])
            j <- j + 1
        }

        i <- i + 1
    }
    correlations
}