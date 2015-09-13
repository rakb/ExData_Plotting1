#Assumes the file household_power_consumption.txt is there in current working directory 
epcFullData <- read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE,na.strings=c(" ","?"))
epcFullData$Time <- strptime(paste(epcFullData$Date,epcFullData$Time),"%d/%m/%Y %H:%M:%S")
epcFullData$Date <- as.Date(epcFullData$Date,"%d/%m/%Y")
d1<-as.Date("2007-02-01")
d2<-as.Date("2007-02-02")
epcSubData <- epcFullData[epcFullData$Date==d1 | epcFullData$Date==d2,]
rm(epcFullData)
png("plot1.png",width=480,height=480,units="px",bg="white")
hist(epcSubData$Global_active_power,main="Global Active Power",xlab="Global Active Power (kilowatts)", ylab="Frequency",col="red")
dev.off()
