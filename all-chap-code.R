## All code used in the chapter

library(rgdal) # load the package (this needs to have been installed)
wrld <- readOGR("data/", "world")
plot(wrld)

wrld@data[1:2, 1:5]

library(ggplot2)
wrld.rob <- spTransform(wrld, CRS( " +proj=robin " ))
# '+proj=robin' refers to the Robinson projection
plot(wrld.rob)

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

# Produce a map of continents
map.cont <- ggplot(wrld.pop.f,
  aes(long, lat, group = group, fill = continent)) +
  geom_polygon() + coord_equal() +
  labs(x = " Longitude " , y = " Latitude " ,
    fill = " World Continents " ) +
  ggtitle( " World Continents " )
# To see the default colours
map.cont

map.cont + scale_fill_manual(values = c("yellow", "red", "purple",
  "white", "orange", "blue", "green", "black"))

# Note the use of the 'map' object created earler
map + scale_fill_continuous(low = "white", high = "black")
library(RColorBrewer)

# Note the use of the scale_fill_gradientn() instead of
# scale_fill_continuous() used above
map + scale_fill_gradientn(colours = brewer.pal(7, "YlGn"))

library(classInt)
library(gridExtra)
# Specify the number of breaks - usually less than 7
nbrks <- 6

# Quantiles set the breaks. Note we are using the
# original 'wrld.rob' object and not the 'wrld.rob@data$pop_est.f 
# help files (by typing ?classIntervals) to see the full range of options
brks <- classIntervals(wrld.rob@data$pop_est, n = nbrks, style = "quantile")
print(brks)
# Now the breaks can be easily inserted into the code above for a range of
# colour palettes
YlGn <- map + scale_fill_gradientn(colours = brewer.pal(nbrks,"YlGn"),
  breaks = c(brks$brks))
PuBu <- map + scale_fill_gradientn(colours = brewer.pal(nbrks, "PuBu"), breaks = c(brks$brks))
grid.arrange(YlGn, PuBu, ncol = 2)
nbrks <- 4
brks <- c(1e+08, 2.5e+08, 5e+07, 1e+09)
map + scale_fill_gradientn(colours = brewer.pal(nbrks,
"PuBu"), breaks = c(brks))

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

library(grid) # needed for arrow
ggplot() + geom_polygon(data = wrld.pop.f,
  aes(long, lat, group = group, fill = pop_est)) +
  geom_line(aes(x = c(-1.3e+07, -1.3e+07),
    y = c(0, 5e+06)), arrow = arrow()) +
  coord_fixed() # correct aspect ratio

load("data/lnd.wgs84.RData") # load lnd spatial object
load("data/lnd.f.RData")
ggplot() + geom_polygon(data = lnd.f,
  aes(long, lat, hgroup = group)) +
  geom_line(aes(x = c(505000, 515000),
    y = c(158000, 158000)), lwd = 2) +
  annotate("text", label = "10km", 510000, 160000) +
  coord_fixed()

# Title
map + theme(legend.title = element_text(colour = "Red",
  size = 16, face = "bold"))
# Label font size and colour
map + theme(legend.text = element_text(colour = "blue",
  size = 16, face = "italic"))
# Border and background box
map + theme(legend.background = element_rect(fill = "gray90",
  size = 0.5, linetype = "dotted"))

b <- bbox(lnd.wgs84)
b[1, ] <- (b[1, ] - mean(b[1, ])) * 1.05 + mean(b[1, ])
b[2, ] <- (b[2, ] - mean(b[2, ])) * 1.05 + mean(b[2, ])

library(ggmap)
lnd.b1 <- ggmap(get_map(location = b))
lnd.wgs84.f <- fortify(lnd.wgs84, region = "ons_label")
lnd.wgs84.f <- merge(lnd.wgs84.f, lnd.wgs84@data, by.x =
    "id", by.y = "ons_label")
# Overlay on base map using the geom_polygon()
lnd.b1 + geom_polygon(data = lnd.wgs84.f,
  aes(x = long, y = lat, group = group,
    fill = Partic_Per), alpha = 0.5)

lnd.b2 <- ggmap(get_map(location = b, source = "stamen",
  maptype = "toner",
  crop = T)) # note the addition of the maptype parameter.

lnd.b2 <- ggmap(get_map(location = b, source = "stamen",
  maptype = "toner", crop = T)) # note addition of maptype

# We can then produce the plot as before
lnd.b2 + geom_polygon(data = lnd.wgs84.f,
  aes(long, lat, group = group, fill = Partic_Per), alpha = 0.5)

library(rgdal)
library(ggplot2)
library(png)
wrld <- readOGR("data/" , "ne_110m_admin_0_countries")
btitle <- readPNG("figure/brit_titles.png")
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

earth <- readPNG("figure/earth_raster.png")
base + annotation_raster(earth, -180, 180, -90, 90) +
  route + theme(panel.background = element_rect(
    fill = "#BAC4B9", colour = "black")) +
  annotation_raster(btitle, 30, 140, 51, 87) +
  annotation_raster(compass, 65, 105, 25, 65) +
  coord_equal() + quiet

# knitr::spin(hair = "all-chap-code.R")
# knitr::spin(hair = "all-chap-code.R", format = "Rhtml")
