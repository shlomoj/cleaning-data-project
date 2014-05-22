## Reads in original data. Activities are read in as factors and labeled accordingly
features <- read.table("features.txt", colClasses="character")
factor_lab <- c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING")

testdata <- read.table("./test/x_test.txt")
test_subj <- read.table("./test/subject_test.txt")
act_test <- read.table("./test/y_test.txt")
act_test <- factor(act_test[[1]], levels=1:6, labels=factor_lab)
test_comb <- cbind("subject"=test_subj, "activity" = act_test, testdata)

traindata <- read.table("./train/x_train.txt")
train_subj <- read.table("./train/subject_train.txt")
act_train <- read.table("./train/y_train.txt")
act_train <- factor(act_train[[1]], levels=1:6, labels=factor_lab)
train_comb <- cbind("subject" = train_subj, "activity" = act_train, traindata)

## Merges training and testing data
cleandata <- rbind(train_comb, test_comb)
names(cleandata)[1:563] <- c("subject", "activity", features[,2])
cleandata[,1] <- as.factor(cleandata[,1])

## Relevant columns are extrated from complete data set
data_mini <- cleandata[,grep("mean\\(|std|subject|activity",names(cleandata))]

## Data are summarized and variable names are made more tidy
tidy <- aggregate(. ~activity + subject, data=data_mini, mean)
tidy<- tidy[order(tidy$activity, tidy$subject),]
names(tidy) <- sub("^f","frequency",names(tidy))
names(tidy) <- sub("^t","time",names(tidy))
names(tidy)<-gsub("\\(\\)","",names(tidy))
names(tidy) <- gsub('([[:upper:]])','.\\1', names(tidy))
names(tidy) <- tolower(names(tidy))
names(tidy) <- gsub("-",".",names(tidy))
names(tidy) <- gsub("\\.\\.","\\.",names(tidy))

## Output
write.table(x=tidy,file="tidy.txt", row.names=F, sep="\t")



