###Reading the table from the dataset


table<-read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors = FALSE)

###Subsetting the table and converting the dates into class date and converting the time into class time
table$Time<-paste(table$Date,table$Time)

table$Time<-strptime(table$Time,format="%d/%m/%Y %H:%M:%S")

table$Date<-dmy(table$Date)

table2<-table[table$Date==ymd("2007-02-02") | table$Date==ymd("2007-02-01"),]

###Converting Sub metering values into numerical values
table2$Sub_metering_1<-as.numeric(table2$Sub_metering_1)
table2$Sub_metering_2<-as.numeric(table2$Sub_metering_2)
table2$Sub_metering_3<-as.numeric(table2$Sub_metering_3)
table2$Voltage<-as.numeric(table2$Voltage)
table2$Global_reactive_power<-as.numeric(table2$Global_reactive_power)

###Making way for 4 plots

par(mfrow=c(2,2))

###Starting the plot 1
###Making the histogram
with(table2,plot(as.numeric(Time),Global_active_power,xlab="",ylab="Global Active Power",type="n",xaxt="n"))

xtick<-c(min(as.numeric(table2$Time)),median(as.numeric(table2$Time)),max(as.numeric(table2$Time)))

### Setting up the position of ticks at the x axis

axis(side=1,at=xtick,labels=FALSE)

###Labeling the ticks with their labels

text(x=xtick, par("usr")[3],labels=c("Thu","Fri","Sat"), pos = 1, xpd = TRUE)
###Plotting the lines

lines(as.numeric(table2$Time),table2$Global_active_power,col="Black")


###Starting the plot 2

with(table2,plot(as.numeric(Time),Voltage,type="n",xaxt="n",ylab="Voltage",xlab="datetime"))

xtick<-c(min(as.numeric(table2$Time)),median(as.numeric(table2$Time)),max(as.numeric(table2$Time)))

### Setting up the position of ticks at the x axis

axis(side=1,at=xtick,labels=FALSE)

###Labeling the ticks with their labels

text(x=xtick, par("usr")[3],labels=c("Thu","Fri","Sat"), pos = 1, xpd = TRUE)
###Plotting the lines

lines(as.numeric(table2$Time),table2$Voltage,col="Black")



###Starting with plot 3

with(table2,plot(as.numeric(Time),Sub_metering_1,type="n",xaxt="n",ylab="Energy sub metering",xlab=""))


xtick<-c(min(as.numeric(table2$Time)),median(as.numeric(table2$Time)),max(as.numeric(table2$Time)))

### Setting up the position of ticks at the x axis

axis(side=1,at=xtick,labels=FALSE)

###Labeling the ticks with their labels

text(x=xtick, par("usr")[3],labels=c("Thu","Fri","Sat"), pos = 1, xpd = TRUE)

###Plotting the lines

lines(as.numeric(table2$Time),table2$Sub_metering_1,col="Black")
lines(as.numeric(table2$Time),table2$Sub_metering_2,col="red")
lines(as.numeric(table2$Time),table2$Sub_metering_3,col="blue")

###Plotting the legend
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=c(1,1,1))


###Starting the plot 4

###Starting the plot


with(table2,plot(as.numeric(Time),Sub_metering_1,type="n",xaxt="n",ylab="Global_reactive_power",xlab="datetime"))


xtick<-c(min(as.numeric(table2$Time)),median(as.numeric(table2$Time)),max(as.numeric(table2$Time)))

### Setting up the position of ticks at the x axis

axis(side=1,at=xtick,labels=FALSE)

###Labeling the ticks with their labels

text(x=xtick, par("usr")[3],labels=c("Thu","Fri","Sat"), pos = 1, xpd = TRUE)

###Plotting the lines

lines(as.numeric(table2$Time),table2$Global_reactive_power,col="black")

###Plotting the legend
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=c(1,1,1))
