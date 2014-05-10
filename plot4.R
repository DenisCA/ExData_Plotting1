print ("Process start ...")
hp <- read.table ("household_power_consumption.txt", header=TRUE, sep=";")
hps <- subset(hp, hp[, 1] == "1/2/2007" | hp[, 1] == "2/2/2007")
hps [, 3] <- as.numeric (as.character (hps[, 3]))
hps [, 7] <- as.numeric (as.character (hps[, 7]))
hps [, 8] <- as.numeric (as.character (hps[, 8]))
hps [, 9] <- as.numeric (as.character (hps[, 9]))
hps [, 5] <- as.numeric (as.character (hps[, 5]))
hps [, 4] <- as.numeric (as.character (hps[, 4]))

png (filename ="Plot4.png",  width = 480 , height = 480, units = "px")

with (hps, {
par (mfrow=c(2, 2))
## Graph 1
plot (as.numeric (strptime(paste (hps [, 1], hps [, 2]), "%d/%m/%Y %H:%M:%S")), hps [, 3], type="l", ylab="Global Active Power", xlab=" ", main="", axes=FALSE, frame=TRUE)## Date and Time by X
axis(1, at=seq(1170277200,1170449940,by=86370), labels=c("Thue","Fri","Sat"))
axis (2)

## Graph 2
plot (as.numeric (strptime(paste (hps [, 1], hps [, 2]), "%d/%m/%Y %H:%M:%S")), hps [, 5], type="l", ylab="Voltage", xlab="datetime", main="", axes=FALSE, frame=TRUE)
axis(1, at=seq(1170277200,1170449940,by=86370), labels=c("Thu","Fri","Sat"))
axis (2)

## Graph 3
plot (as.numeric (strptime(paste (hps [, 1], hps [, 2]), "%d/%m/%Y %H:%M:%S")), hps [, 7], type="n", ylab="Energy sub metering", xlab=" ", main="", axes=FALSE, frame=TRUE)## Date and Time by X
axis(1, at=seq(1170277200,1170449940,by=86370), labels=c("Thu","Fri","Sat"))
axis (2)
points (as.numeric (strptime(paste (hps [, 1], hps [, 2]), "%d/%m/%Y %H:%M:%S")), hps [, 7], type="l")
points (as.numeric (strptime(paste (hps [, 1], hps [, 2]), "%d/%m/%Y %H:%M:%S")), hps [, 8], col="red", type="l")
points (as.numeric (strptime(paste (hps [, 1], hps [, 2]), "%d/%m/%Y %H:%M:%S")), hps [, 9], col="blue", type="l")
legend ("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1, 1, 1), lwd=c(2.5,2.5, 2.5), col = c("black", "red", "blue"))		

## Graph 4
plot (as.numeric (strptime(paste (hps [, 1], hps [, 2]), "%d/%m/%Y %H:%M:%S")), hps [, 4], type="l", ylab="Global_reactive_power", xlab="datetime", main="", axes=FALSE, frame=TRUE)## Date and Time by X
axis(1, at=seq(1170277200,1170449940,by=86370), labels=c("Thue","Fri","Sat"))
axis (2)

} )
dev.off ()
print ("File Plot4.png created in your working directory")