###
### Programming assignment 1
###

labels<-read.delim("./features.txt",sep="",header=F)
colnames(labels)<-c("index","label")
#head(labels)

## TEST DATA SET -->

test_data<-read.delim("./test/X_test.txt",sep="",header=F)
colnames(test_data)<-labels$label
#head(test_data)

test_act_type<-read.delim("./test/y_test.txt",sep="",header=F)
test_act_type$act_txt="NA"
colnames(test_act_type)<-c("act_num","act_txt")
#head(test_act_type)

act_type_label<-read.delim("./activity_labels.txt",sep="",header=F)
colnames(act_type_label)<-c("index","label")
#head(act_type_label)

for (i in 1:nrow(test_act_type)){
  test_act_type$act_txt[i]<-as.character(act_type_label[act_type_label$index==test_act_type$act_num[i],]$label)
}
#head(test_act_type)
#tail(test_act_type)

test_subjects<-read.delim("./test/subject_test.txt",sep="",header=F)
colnames(test_subjects)<-c("subject")
#head(test_subjects)

#nrow(test_act_type)
#nrow(test_data)
test_data<-cbind(test_data,test_act_type,test_subjects)
#head(test_data)
test_data$set="test"

## TRAIN DATA SET -->

train_data<-read.delim("./train/X_train.txt",sep="",header=F)
colnames(train_data)<-labels$label
head(train_data)

train_act_type<-read.delim("./train/y_train.txt",sep="",header=F)
train_act_type$act_txt="NA"
colnames(train_act_type)<-c("act_num","act_txt")
head(train_act_type)


for (i in 1:nrow(train_act_type)){
  train_act_type$act_txt[i]=as.character(act_type_label[act_type_label$index==train_act_type$act_num[i],]$label)
}
#head(train_act_type)
#tail(train_act_type)

train_subjects<-read.delim("./train/subject_train.txt",sep="",header=F)
colnames(train_subjects)<-c("subject")
#head(train_subjects)

#nrow(train_act_type)
#nrow(train_data)
train_data<-cbind(train_data,train_act_type,train_subjects)
#head(train_data)

train_data$set="train"

## COMBINE TEST AND TRAIN SET -->

c_data<-rbind(train_data,test_data)
#head(c_data)
#tail(c_data)

## Extract data that contains mean or std
subset1_c_data<-c_data[names(c_data)[grep("mean|std|act_num|act_txt|subject|set",names(c_data),ignore.case=T)]]
#names(subset1_c_data)

## SAVE subset1

write.table(subset1_c_data,"./subset1.txt", sep="",row.names = F)

## average of each variable for each activity and each subject

melt_c_data<-melt(c_data,id=c("act_txt","subject","set"))
dcast_c_data<-dcast(melt_c_data,subject + act_txt ~ variable,mean)
write.table(dcast_c_data,"./reshape1.txt", sep="",row.names = F)

