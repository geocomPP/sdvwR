

```r
## All code used in the chapter

library(rgdal) # load the package (this needs to have been installed)
wrld <- readOGR("data/", "world")
```

```
## OGR data source with driver: ESRI Shapefile 
## Source: "data/", layer: "world"
## with 175 features and 63 fields
## Feature type: wkbPolygon with 2 dimensions
```

```r
plot(wrld)
```

![plot of chunk unnamed-chunk-1](figure/unnamed-chunk-1-1.png) 

```r
wrld@data[1:2, 1:5]
```

```
##   scalerank      featurecla labelrank  sovereignt sov_a3
## 0         1 Admin-0 country         3 Afghanistan    AFG
## 1         1 Admin-0 country         3      Angola    AGO
```

```r
library(ggplot2)
wrld.rob <- spTransform(wrld, CRS( " +proj=robin " ))
# '+proj=robin' refers to the Robinson projection
plot(wrld.rob)
```

![plot of chunk unnamed-chunk-1](figure/unnamed-chunk-1-2.png) 

```r
wrld.rob.f <- fortify(wrld.rob, region = "sov_a3" )
wrld.pop.f <- merge(wrld.rob.f, wrld.rob@data, by.x = "id" ,
  by.y = "sov_a3" )

map <- ggplot(wrld.pop.f,
  aes(long, lat, group = group, fill = pop_est/1e+06)) +
  geom_polygon() + coord_equal() +
  labs(x = "Longitude", y = "Latitude",
    fill = "World Population") +
  ggtitle("World Population") +
  scale_fill_continuous(name = "Population\n(millions)")
map
```

![plot of chunk unnamed-chunk-1](figure/unnamed-chunk-1-3.png) 

```r
# Produce a map of continents
map.cont <- ggplot(wrld.pop.f,
  aes(long, lat, group = group, fill = continent)) +
  geom_polygon() + coord_equal() +
  labs(x = " Longitude " , y = " Latitude " ,
    fill = " World Continents " ) +
  ggtitle( " World Continents " )
# To see the default colours
map.cont
```

![plot of chunk unnamed-chunk-1](figure/unnamed-chunk-1-4.png) 

```r
map.cont + scale_fill_manual(values = c("yellow", "red", "purple",
  "white", "orange", "blue", "green", "black"))
```

![plot of chunk unnamed-chunk-1](figure/unnamed-chunk-1-5.png) 

```r
# Note the use of the 'map' object created earler
map + scale_fill_continuous(low = "white", high = "black")
```

```
## Scale for 'fill' is already present. Adding another scale for 'fill', which will replace the existing scale.
```

![plot of chunk unnamed-chunk-1](figure/unnamed-chunk-1-6.png) 

```r
library(RColorBrewer)

# Note the use of the scale_fill_gradientn() instead of
# scale_fill_continuous() used above
map + scale_fill_gradientn(colours = brewer.pal(7, "YlGn"))
```

```
## Scale for 'fill' is already present. Adding another scale for 'fill', which will replace the existing scale.
```

![plot of chunk unnamed-chunk-1](figure/unnamed-chunk-1-7.png) 

```r
library(classInt)
library(gridExtra)
# Specify the number of breaks - usually less than 7
nbrks <- 6

# Quantiles set the breaks. Note we are using the
# original 'wrld.rob' object and not the 'wrld.rob@data$pop_est.f 
# help files (by typing ?classIntervals) to see the full range of options
brks <- classIntervals(wrld.rob@data$pop_est, n = nbrks, style = "quantile")
print(brks)
```

```
## style: quantile
##         [-99,1990876)     [1990876,4615807)     [4615807,9059651) 
##                    29                    29                    29 
##    [9059651,16715999)   [16715999,40913584) [40913584,1338612970] 
##                    29                    29                    30
```

```r
# Now the breaks can be easily inserted into the code above for a range of
# colour palettes
YlGn <- map + scale_fill_gradientn(colours = brewer.pal(nbrks,"YlGn"),
  breaks = c(brks$brks))
```

```
## Scale for 'fill' is already present. Adding another scale for 'fill', which will replace the existing scale.
```

```r
PuBu <- map + scale_fill_gradientn(colours = brewer.pal(nbrks, "PuBu"), breaks = c(brks$brks))
```

```
## Scale for 'fill' is already present. Adding another scale for 'fill', which will replace the existing scale.
```

```r
grid.arrange(YlGn, PuBu, ncol = 2)
```

![plot of chunk unnamed-chunk-1](figure/unnamed-chunk-1-8.png) 

```r
nbrks <- 4
brks <- c(1e+08, 2.5e+08, 5e+07, 1e+09)
map + scale_fill_gradientn(colours = brewer.pal(nbrks,
"PuBu"), breaks = c(brks))
```

```
## Scale for 'fill' is already present. Adding another scale for 'fill', which will replace the existing scale.
```

![plot of chunk unnamed-chunk-1](figure/unnamed-chunk-1-9.png) 

```r
map3 <- ggplot(wrld.pop.f,
  aes(long, lat, group = group)) + coord_equal() +
  theme(panel.background = element_rect(fill = "light blue"))

yellow <- map3 + geom_polygon(fill = "dark green",
  colour = "yellow")

black <- map3 + geom_polygon(fill = "dark green",
  colour = "black")

thin <- map3 + geom_polygon(fill = "dark green",
  colour = "black", lwd = 0.1)
thick <- map3 + geom_polygon(fill = "dark green",
  colour = "black", lwd = 1.5)
grid.arrange(yellow, black, thick, thin, ncol = 2)
```

![plot of chunk unnamed-chunk-1](figure/unnamed-chunk-1-10.png) 

```r
library(grid) # needed for arrow
ggplot() + geom_polygon(data = wrld.pop.f,
  aes(long, lat, group = group, fill = pop_est)) +
  geom_line(aes(x = c(-1.3e+07, -1.3e+07),
    y = c(0, 5e+06)), arrow = arrow()) +
  coord_fixed() # correct aspect ratio
```

![plot of chunk unnamed-chunk-1](figure/unnamed-chunk-1-11.png) 

```r
load("data/lnd.wgs84.RData") # load lnd spatial object
load("data/lnd.f.RData")
ggplot() + geom_polygon(data = lnd.f,
  aes(long, lat, hgroup = group)) +
  geom_line(aes(x = c(505000, 515000),
    y = c(158000, 158000)), lwd = 2) +
  annotate("text", label = "10km", 510000, 160000) +
  coord_fixed()
```

![plot of chunk unnamed-chunk-1](figure/unnamed-chunk-1-12.png) 

```r
# Title
map + theme(legend.title = element_text(colour = "Red",
  size = 16, face = "bold"))
```

![plot of chunk unnamed-chunk-1](figure/unnamed-chunk-1-13.png) 

```r
# Label font size and colour
map + theme(legend.text = element_text(colour = "blue",
  size = 16, face = "italic"))
```

![plot of chunk unnamed-chunk-1](figure/unnamed-chunk-1-14.png) 

```r
# Border and background box
map + theme(legend.background = element_rect(fill = "gray90",
  size = 0.5, linetype = "dotted"))
```

![plot of chunk unnamed-chunk-1](figure/unnamed-chunk-1-15.png) 

```r
b <- bbox(lnd.wgs84)
b[1, ] <- (b[1, ] - mean(b[1, ])) * 1.05 + mean(b[1, ])
b[2, ] <- (b[2, ] - mean(b[2, ])) * 1.05 + mean(b[2, ])

library(ggmap)
lnd.b1 <- ggmap(get_map(location = b))
```

```
## Warning: bounding box given to google - spatial extent only approximate.
```

```
## converting bounding box to center/zoom specification. (experimental)
## Map from URL : http://maps.googleapis.com/maps/api/staticmap?center=51.489304,-0.088233&zoom=10&size=%20640x640&scale=%202&maptype=terrain&sensor=false
## Google Maps API Terms of Service : http://developers.google.com/maps/terms
```

```r
lnd.wgs84.f <- fortify(lnd.wgs84, region = "ons_label")
lnd.wgs84.f <- merge(lnd.wgs84.f, lnd.wgs84@data, by.x =
    "id", by.y = "ons_label")
# Overlay on base map using the geom_polygon()
lnd.b1 + geom_polygon(data = lnd.wgs84.f,
  aes(x = long, y = lat, group = group,
    fill = Partic_Per), alpha = 0.5)
```

![plot of chunk unnamed-chunk-1](figure/unnamed-chunk-1-16.png) 

```r
lnd.b2 <- ggmap(get_map(location = b, source = "stamen",
  maptype = "toner",
  crop = T)) # note the addition of the maptype parameter.

lnd.b2 <- ggmap(get_map(location = b, source = "stamen",
  maptype = "toner", crop = T)) # note addition of maptype

# We can then produce the plot as before
lnd.b2 + geom_polygon(data = lnd.wgs84.f,
  aes(long, lat, group = group, fill = Partic_Per), alpha = 0.5)
```

![plot of chunk unnamed-chunk-1](figure/unnamed-chunk-1-17.png) 

```r
library(rgdal)
library(ggplot2)
library(png)
wrld <- readOGR("data/" , "ne_110m_admin_0_countries")
```

```
## OGR data source with driver: ESRI Shapefile 
## Source: "data/", layer: "ne_110m_admin_0_countries"
## with 177 features and 63 fields
## Feature type: wkbPolygon with 2 dimensions
```

```r
btitle <- readPNG("figure//brit_titles.png")
compass <- readPNG("figure/windrose.png")
bdata <- read.csv("data/british_shipping_example.csv")

xquiet <- scale_x_continuous( "" , breaks = NULL)
yquiet <- scale_y_continuous( "" , breaks = NULL)
quiet <- list(xquiet, yquiet)

wrld.f <- fortify(wrld, region = "sov_a3")
base <- ggplot(wrld.f, aes(x = long, y = lat))
wrld <- c(geom_polygon(aes(group = group), size = 0.1,
  colour = "black", fill = "#D6BF86", d = wrld.f, alpha = 1))

base + wrld + coord_fixed()
```

![plot of chunk unnamed-chunk-1](figure/unnamed-chunk-1-18.png) 

```r
route <- c(geom_path(aes(long, lat, group = paste(bdata$trp,
  bdata$group.regroup,
  sep = ".")), colour = "#0F3B5F", size = 0.2, data =
    bdata, alpha = 0.5,
  lineend = "round"))

base + route + wrld +
  theme(panel.background = element_rect(fill = "#BAC4B9",
    colour = "black")) +
  annotation_raster(btitle, 30, 140, 51, 87) +
  annotation_raster(compass, 65, 105, 25, 65) +
  coord_equal() + quiet
```

![plot of chunk unnamed-chunk-1](figure/unnamed-chunk-1-19.png) 

```r
earth <- readPNG("figure/earth_raster.png")
base + annotation_raster(earth, -180, 180, -90, 90) +
  route + theme(panel.background = element_rect(
    fill = "#BAC4B9", colour = "black")) +
  annotation_raster(btitle, 30, 140, 51, 87) +
  annotation_raster(compass, 65, 105, 25, 65) +
  coord_equal() + quiet
```

![plot of chunk unnamed-chunk-1](figure/unnamed-chunk-1-20.png) 

