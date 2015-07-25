run_analysis<-function(){
       library(plyr)
        library(dplyr)
        library(reshape2)
        wd<-getwd()

##get and store and unzip data locally
        if (!file.exists("projectdata.zip")){
                ##d/l
                url="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
                download.file(url,"projectdata.zip",method="curl")
                ##unzip
                unzip("projectdata.zip")
        }
##read in the data for train and test groups and the headers
        ##header
        headerdat<-read.table(paste(wd,"/UCI HAR Dataset/features.txt",sep=""),sep=" ",check.names=FALSE)
        header<-headerdat[,2]
        header <- make.names(names=header, unique=TRUE, allow_ = TRUE)
        
        ##test
        stest<-read.table(paste(wd,"/UCI HAR Dataset/test/subject_test.txt",sep=""),col.name="Subject")
        xtest<-read.table(paste(wd,"/UCI HAR Dataset/test/X_test.txt",sep=""),col.names=header,check.names=FALSE)
        ytest<-read.table(paste(wd,"/UCI HAR Dataset/test/y_test.txt",sep=""),col.names="Activity")
        
        ##train
        strain<-read.table(paste(wd,"/UCI HAR Dataset/train/subject_train.txt",sep=""),col.name="Subject")
        xtrain<-read.table(paste(wd,"/UCI HAR Dataset/train/X_train.txt",sep=""),col.names=header)
        ytrain<-read.table(paste(wd,"/UCI HAR Dataset/train/y_train.txt",sep=""),col.names="Activity")

        
        
##merge the datas into one frame
        ##test
        testdata<-cbind(stest,ytest)
        testdata<-cbind(testdata,xtest)
         
        ##train
        traindata<-cbind(strain,ytrain)
        traindata<-cbind(traindata,xtrain)

##switch the cases activity labels to words
        ##test 
        testdata$Activity<-as.factor(testdata$Activity)
        testdata$Activity<-revalue(testdata$Activity,c("1"="WALKING","2"="WALKING_UPSTAIRS","3"="WALKING_DOWNSTAIRS","4"="SITTING","5"="STANDING","6"="LAYING"))
        ##train
        traindata$Activity<-as.factor(traindata$Activity)
        traindata$Activity<-revalue(traindata$Activity,c("1"="WALKING","2"="WALKING_UPSTAIRS","3"="WALKING_DOWNSTAIRS","4"="SITTING","5"="STANDING","6"="LAYING"))

## only interested in mean and std dev columns so select for these columns, so select for these (ones that  contain in std() or mean())

        ##test
        names(testdata)
        testcut <- select(testdata, Subject, Activity,  contains(".mean.."),contains(".std.."))
        
        ##train
        
        traincut <- select(traindata, Subject, Activity,   contains(".mean.."),contains(".std.."))
        
##add col to each data set describing which group the subject is apart of
       #test
        testcut<-mutate(testcut, Group="test")
        testcut<-testcut[,c(1,2,69,3:68)] #move value to col 3
       #train
        traincut<-mutate(traincut, Group="train")
        traincut<-traincut[,c(1,2,69,3:68)] #move value to col 3

##time to merge both the data sets.
        merged<-rbind(traincut,testcut)
##end part 1-4 of project

##ave of each activity with each varible and each subject
        melted<-melt(merged,id=c("Activity","Subject" ,"Group"), measure.vars=names(merged[4:68]))
        goal<-dcast(melted, Subject + Activity ~ variable, mean)
        head(goal,n=12)
        write.table(goal,"project3.txt",row.name=FALSE) 
        
}
