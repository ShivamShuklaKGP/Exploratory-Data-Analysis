###Reading the table from the dataset


table<-read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors = FALSE)

###Subsetting the table and converting the dates into class date and converting the time into class time
table$Time<-paste(table$Date,table$Time)

table$Date<-dmy(table$Date)

table2<-table[table$Date==ymd("2007-02-02") | table$Date==ymd("2007-02-01"),]

table2$Time<-strptime(table2$Time,format="%H:%M:%S")

table2[,3]<-as.numeric(table2[,3])

###Making the histogram
with(table2,hist(Global_active_power,xlab="Global Active Power (kilowatts)",main="Global Active Power",col="red"))

###Copying to the PNG File to be created

dev.copy(png,file="plot1.png")

###Changing the Graphics Device back to the original.

dev.off()