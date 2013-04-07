## -------------- SpatialPointsDataFrame --------- ##
library(sp)
library(rgdal)
library(plotKML)

city <- read.csv("G:/AQI/pm25in/location/station_location.csv")

data.sp <- SpatialPointsDataFrame(coords=city[c("lon","lat")], 
                                  data=city,
                                  proj4string = CRS("+proj=longlat +datum=WGS84")) 

plotKML(data.sp["aqi"], folder.name="China main city AQI",file.name="aqi.kml", points_name=iconv(data.sp$location, from = "gb2312", to = "UTF-8"))