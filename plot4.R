# reading in the data

HPC<-read.table("household_power_consumption.txt",header=TRUE,sep=";")

# subsetting the 2 dates

sHPC <- subset(HPC,Date == "1/2/2007"| Date =="2/2/2007")

# changing the class  form product to numeric

sHPC$Global_active_power <- as.numeric(as.character(sHPC$Global_active_power))
sHPC$Global_reactive_power <- as.numeric(as.character(sHPC$Global_reactive_power))
sHPC$Voltage <- as.numeric(as.character(sHPC$Voltage))

sHPC$Sub_metering_1 <- as.numeric(as.character(sHPC$Sub_metering_1))
sHPC$Sub_metering_2 <- as.numeric(as.character(sHPC$Sub_metering_2))
sHPC$Sub_metering_3 <- as.numeric(as.character(sHPC$Sub_metering_3))


# Need to create a Date/time Column

sHPC$Date_Time <- paste(sHPC$Date,sHPC$Time, sep=" ")

# need to make it in POSIxlt format (keeps days)

sHPC$Date_Time <- strptime(sHPC$Date_Time, "%d/%m/%Y %H:%M:%S")


# plotting 

par(mfrow=c(2,2), mar= c(2,4,4,1))

with(sHPC, {
        plot(Date_Time,Global_active_power,type="n",xlab="",ylab="Global Active Power (Kw)")
        lines(Date_Time,Global_active_power)
       
        plot(Date_Time,Voltage,type="n",xlab="",ylab="Voltage")
        lines(Date_Time,Voltage)
        
        plot(Date_Time,Sub_metering_1,type="n",xlab="",ylab="Energy sub")
        lines(Date_Time,Sub_metering_2,col="red")
        lines(Date_Time,Sub_metering_1)
        lines(Date_Time,Sub_metering_3,col="blue")
        legend("topright",lty =1,legend = c("sub1","sub2","sub3"),col=c("Black","red","blue"),horiz = TRUE)

        plot(Date_Time,Global_reactive_power,type="n",xlab = "",ylab="Global reactive Power")
        lines(Date_Time,Global_reactive_power)
        
        })


# creating the png file

dev.copy(png,file="plot4.png")
dev.off