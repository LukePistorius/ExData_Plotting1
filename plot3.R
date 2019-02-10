# reading in the data

HPC<-read.table("household_power_consumption.txt",header=TRUE,sep=";")

# subsetting the 2 dates

sHPC <- subset(HPC,Date == "1/2/2007"| Date =="2/2/2007")

# changing the class for the sub_metering from product to numeric

sHPC$Sub_metering_1 <- as.numeric(as.character(sHPC$Sub_metering_1))
sHPC$Sub_metering_2 <- as.numeric(as.character(sHPC$Sub_metering_2))
sHPC$Sub_metering_3 <- as.numeric(as.character(sHPC$Sub_metering_3))


# Need to create a Date/time Column

sHPC$Date_Time <- paste(sHPC$Date,sHPC$Time, sep=" ")

# need to make it in POSIxlt format (keeps days)

sHPC$Date_Time <- strptime(sHPC$Date_Time, "%d/%m/%Y %H:%M:%S")

# plotting ( we use type = "n" to hide the points, as it's to messsy)

with(sHPC,{
     
        plot(Date_Time,Sub_metering_1,type="n",xlab="",ylab="Energy sub")
        lines(Date_Time,Sub_metering_2,col="red")
        lines(Date_Time,Sub_metering_1)
        lines(Date_Time,Sub_metering_3,col="blue")
        legend("topright",lty =1,legend = c("sub1","sub2","sub3"),col=c("Black","red","blue"))
})

# creating the png file

dev.copy(png,file="plot3.png")
dev.off