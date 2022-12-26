setwd("C:/Users/m236315/Desktop")
df <-read.csv("household_power_consumption.csv")
df$Date <- as.Date(df$Date, "%m/%d/%Y")
df2 = df[df$Date > "2007-1-31" & df$Date < "2007-2-3",]
df2$m = as.POSIXct(paste(df2$Date, df2$Time), tz = "GMT", tryFormats = c("%Y-%m-%d %H:%M:%OS"))
head(df2)
df2$Global_active_power = as.numeric(df2$Global_active_power)
df2$Global_reactive_power =  as.numeric(df2$Global_reactive_power)
df2$Voltage = as.numeric(df2$Voltage)
df2$Global_intensity   = as.numeric(df2$Global_intensity     )
df2$Sub_metering_2               = as.numeric(df2$Sub_metering_2              )
df2$Sub_metering_1 = as.numeric(df2$Sub_metering_1)
str(df2)
library(ggplot2)


p3 <- ggplot(df2, aes(x=m)) +
  geom_line( aes(y=Sub_metering_1)) + 
  geom_line( aes(y=Sub_metering_2), colour="red")+
  geom_line( aes(y=Sub_metering_3), colour="blue")+xlab("Day")+
  ylab("Energy sub metering")+ scale_x_datetime(breaks = "1 day", date_labels = '%a')
p3