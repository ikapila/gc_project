run_analysis <- function(){
        
        X_train <- read.table("UCI HAR Dataset/train/X_train.txt", quote="\"")
        y_train <- read.table("UCI HAR Dataset/train/y_train.txt", quote="\"")
        X_test <- read.table("UCI HAR Dataset/test/X_test.txt", quote="\"")
        y_test <- read.table("UCI HAR Dataset/test/y_test.txt", quote="\"")        
        activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", quote="\"")
        features <- read.table("UCI HAR Dataset/features.txt", quote="\"", stringsAsFactors=FALSE)
        
        df <- rbind(X_train, X_test)
        
        columnsInclude<-grep("((mean|std){1}(freq){0,}[(][)])",features$V2)
        colnas <- features[columnsInclude, 2]
        df <- df[,columnsInclude]
        colnames(df) <- colnas
        
        act1 <- merge(y_train, activity_labels, by="V1")
        act2 <- merge(y_test, activity_labels, by="V1")       
        act <- rbind(act1, act2)
        activity <- act[,2]
  
        df <- cbind(activity, df)
        
        subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", quote="\"", stringsAsFactors=FALSE)
        subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", quote="\"", stringsAsFactors=FALSE)
        subject <- rbind(subject_train, subject_test)
        colnames(subject) <- "subject"
        
        dset <- cbind(subject, df)
        tidy_df <- group_by(dset, subject, activity) %>% summarise_each(funs(mean))
        
        tidy_df
}