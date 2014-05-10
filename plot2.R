print ("Process start ...")
hp <- read.table ("household_power_consumption.txt", header=TRUE, sep=";")
hps <- subset(hp, hp[, 1] == "1/2/2007" | hp[, 1] == "2/2/2007")
hps [, 3] <- as.numeric (as.character (hps[, 3]))
##hps [, 1] <- as.Date (hps[, 1], "%d/%m/%Y")) ## Convert to Date format

png (filename ="Plot2.png",  width = 480 , height = 480, units = "px")

with (hps, {
plot (as.numeric (strptime(paste (hps [, 1], hps [, 2]), "%d/%m/%Y %H:%M:%S")), hps [, 3], type="l", ylab="Global Active Power (kilowatts)", xlab=" ", main="", axes=FALSE, frame=TRUE)## Date and Time by X
axis(1, at=seq(1170277200,1170449940,by=86370), labels=c("Thue","Fri","Sat"))
axis (2)		
} )
dev.off ()
print ("File Plot2.png created in your working directory")