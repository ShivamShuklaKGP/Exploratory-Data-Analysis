###Reading the table from the dataset


table<-read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors = FALSE)

###Subsetting the table and converting the dates into class date and converting the time into class time
table$Time<-paste(table$Date,table$Time)

table$Time<-strptime(table$Time,format="%d/%m/%Y %H:%M:%S")

table$Date<-dmy(table$Date)

table2<-table[table$Date==ymd("2007-02-02") | table$Date==ymd("2007-02-01"),]

table2[,3]<-as.numeric(table2[,3])

###Creating a plot first without x axis ticks and labels
plot(as.numeric(table2$Time),table2$Global_active_power,data=table2,type="n",xaxt="n",ylab="Global Active Power (kilowatts)",xlab="")

###Position of X axis ticks

xtick<-c(min(as.numeric(table2$Time)),median(as.numeric(table2$Time)),max(as.numeric(table2$Time)))

### Setting up the position of ticks at the x axis

axis(side=1,at=xtick,labels=FALSE)

###Labeling the ticks with their labels

text(x=xtick, par("usr")[3],labels=c("Thu","Fri","Sat"), pos = 1, xpd = TRUE)

###Adding the required lines to the plot

lines(as.numeric(table2$Time),table2$Global_active_power)
