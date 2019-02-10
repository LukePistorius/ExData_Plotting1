# reading in the data

HPC<-read.table("household_power_consumption.txt",header=TRUE,sep=";")

# subsetting the 2 dates

sHPC <- subset(HPC,Date == "1/2/2007"| Date =="2/2/2007")

# changing the class from Global Active power form product to numeric

sHPC$Global_active_power <- as.numeric(as.character(sHPC$Global_active_power))

# creating the histogram

hist(sHPC$Global_active_power,col="red",main="Global Active Power",xlab="Globa Active Power (kW)")

# creating the png file

dev.copy(png,file="plot1.png")
dev.off