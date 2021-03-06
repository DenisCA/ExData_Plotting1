print ("Process start ...")
hp <- read.table ("household_power_consumption.txt", header=TRUE, sep=";")
hps <- subset(hp, hp[, 1] == "1/2/2007" | hp[, 1] == "2/2/2007")
hps [, 3] <- as.numeric (as.character (hps[, 3]))
png (filename ="Plot1.png",  width = 480 , height = 480, units = "px")
with (hps, hist (hps[, 3], col="red", main = "Global Active Power" , xlab="Global Active Power (kilowatts)"))
dev.off ()
print ("File Plot1.png created in your working directory")