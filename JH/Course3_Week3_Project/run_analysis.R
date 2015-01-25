##@author: Victor Valdevite Pinto
##@date: 25-Jan-2015

##Program reads lots of files, merge them and creates a tidy date about a Samsung's devices readings.
##for more information about the data, read XXXX.md


##Main function that must be called to run the project
run_analysis <- function(){
    
    ##read all files that will be used
    act_labels <- read.table("UCI HAR Dataset\\activity_labels.txt", sep=" ")
    feat <- read.table("UCI HAR Dataset\\features.txt", sep=" ")
    test_x <- read.table("UCI HAR Dataset\\test\\X_test.txt")
    test_y <- read.table("UCI HAR Dataset\\test\\Y_test.txt")
    test_sub <- read.table("UCI HAR Dataset\\test\\subject_test.txt")
    train_x <- read.table("UCI HAR Dataset\\train\\X_train.txt")
    train_y <- read.table("UCI HAR Dataset\\train\\Y_train.txt")
    train_sub <- read.table("UCI HAR Dataset\\train\\subject_train.txt")
    
    ##merge the test dataset into 1 data set
    test_x <- cbind(test_y, test_x)
    test_x <- cbind(test_sub, test_x)
    
    ##merge the train dataset into 1 data set
    train_x <- cbind(train_y, train_x)
    train_x <- cbind(train_sub, train_x)
    
    ##merge the test and train datasets
    tdata <- rbind(test_x, train_x)
    
    ##extract only the mean and std measurments
    tdata <- tdata[,1:8]
    
    ##naming the columns
    colnames(tdata) <- c("subject_id", "activity_id", "tBodyAcc.mean.X", "tBodyAcc.mean.Y", "tBodyAcc.mean.Z", 
                         "tBodyAcc.std.X", "tBodyAcc.std.Y", "tBodyAcc.std.Z")
    
    ##add the corresponding activity names
    colnames(act_labels) <- c("act_id","act_name")
    tdata <- merge(tdata, act_labels, by.x = "activity_id", by.y = "act_id", all=TRUE)
    
    ##averaging each value grouped by activity and subject
    tdata <- as.data.table(tdata)
    
    ##for tBodyAcc.mean.X
    final <- tdata[,tBodyAcc.mean.X:ave(tBodyAcc.mean.X), by=list(act_name, subject_id)]
    
    ##tBodyAcc.mean.Y
    temp <- tdata[,tBodyAcc.mean.Y:ave(tBodyAcc.mean.Y), by=list(act_name, subject_id)]
    final <- merge(final, temp, by=c("act_name","subject_id"), all=TRUE)
    colnames(final) <- c("act_name", "subject_id", "ave.tBodyAcc.mean.X", "ave.tBodyAcc.mean.Y")
    
    ##tBodyAcc.mean.Z
    temp <- tdata[,tBodyAcc.mean.Z:ave(tBodyAcc.mean.Z), by=list(act_name, subject_id)]
    final <- merge(final, temp, by=c("act_name","subject_id"), all=TRUE)
    colnames(final) <- c("act_name", "subject_id", "ave.tBodyAcc.mean.X", "ave.tBodyAcc.mean.Y",
                         "ave.tBodyAcc.mean.Z")
    
    ##tBodyAcc.std.X
    temp <- tdata[,tBodyAcc.std.X:ave(tBodyAcc.std.X), by=list(act_name, subject_id)]
    final <- merge(final, temp, by=c("act_name","subject_id"), all=TRUE)
    colnames(final) <- c("act_name", "subject_id", "ave.tBodyAcc.mean.X", "ave.tBodyAcc.mean.Y",
                         "ave.tBodyAcc.mean.Z", "ave.tBodyAcc.std.X")
    
    ##tBodyAcc.std.Y
    temp <- tdata[,tBodyAcc.std.Y:ave(tBodyAcc.std.Y), by=list(act_name, subject_id)]
    final <- merge(final, temp, by=c("act_name","subject_id"), all=TRUE)
    colnames(final) <- c("act_name", "subject_id", "ave.tBodyAcc.mean.X", "ave.tBodyAcc.mean.Y",
                         "ave.tBodyAcc.mean.Z", "ave.tBodyAcc.std.X", "ave.tBodyAcc.std.Y")
    
    ##tBodyAcc.std.Z
    temp <- tdata[,tBodyAcc.std.Z:ave(tBodyAcc.std.Z), by=list(act_name, subject_id)]
    final <- merge(final, temp, by=c("act_name","subject_id"), all=TRUE)
    colnames(final) <- c("act_name", "subject_id", "ave.tBodyAcc.mean.X", "ave.tBodyAcc.mean.Y",
                         "ave.tBodyAcc.mean.Z", "ave.tBodyAcc.std.X", "ave.tBodyAcc.std.Y", "ave.tBodyAcc.std.Z")
    
    ##write the data to disk
    write.table(final, "UCI HAR Dataset\\tidy_data.txt", sep=",", quote=FALSE, row.names = FALSE)

}