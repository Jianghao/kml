## -------------- SpatialPointsDataFrame --------- ##
library(sp)
library(rgdal)
library(plotKML)

city <- read.csv("G:/AQI/pm25in/location/station_location.csv")
data <- read.csv(file="D:/Documents/GitHub/H7N9/table/h7n9_data_loc.csv", header=T, stringsAsFactors=F)

data.sp <- SpatialPointsDataFrame(coords=city[c("lon","lat")], 
                                  data=city,
                                  proj4string = CRS("+proj=longlat +datum=WGS84")) 

plotKML(data.sp["aqi"], folder.name="China main city AQI",file.name="aqi.kml", points_name=iconv(data.sp$aqi, from = "gb2312", to = "UTF-8"))