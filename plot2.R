# reading in the data

HPC<-read.table("household_power_consumption.txt",header=TRUE,sep=";")

# subsetting the 2 dates

sHPC <- subset(HPC,Date == "1/2/2007"| Date =="2/2/2007")

# changing the class from Global Active power form product to numeric

sHPC$Global_active_power <- as.numeric(as.character(sHPC$Global_active_power))

# Need to create a Date/time Column

sHPC$Date_Time <- paste(sHPC$Date,sHPC$Time, sep=" ")

# need to make it in POSIxlt format (keeps days)

sHPC$Date_Time <- strptime(sHPC$Date_Time, "%d/%m/%Y %H:%M:%S")

# plotting ( we use type = "n" to hide the points, as it's to messsy)

plot(sHPC$Date_Time,sHPC$Global_active_power,type = "n",xlab = "",ylab = "Global Active Power (kW)")
lines(sHPC$Date_Time,sHPC$Global_active_power)

# creating the png file

dev.copy(png,file="plot2.png")
dev.off