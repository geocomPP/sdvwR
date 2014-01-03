A Final Example
===============
Here we present a final example that draws upon the many advanced concepts discussed in this chapter to produce a map of 18th Century Shipping flows. 


```r
library(rgdal)
library(ggplot2)
library(png)
wrld <- readOGR("data/", "ne_110m_admin_0_countries")
```

```
## OGR data source with driver: ESRI Shapefile 
## Source: "data/", layer: "ne_110m_admin_0_countries"
## with 177 features and 63 fields
## Feature type: wkbPolygon with 2 dimensions
```

```r
btitle <- readPNG("figure/brit_titles.png")
compass <- readPNG("figure/windrose.png")
bdata <- read.csv("data/british_shipping_example.csv")
```



```r
xquiet <- scale_x_continuous("", breaks = NULL)
yquiet <- scale_y_continuous("", breaks = NULL)
quiet <- list(xquiet, yquiet)
```



```r
wrld.f <- fortify(wrld, region = "sov_a3")
```

```
## Loading required package: rgeos
## rgeos version: 0.2-19, (SVN revision 394)
##  GEOS runtime version: 3.3.8-CAPI-1.7.8 
##  Polygon checking: TRUE
```

```r
base <- ggplot(wrld.f, aes(x = long, y = lat))
```



```r
route <- c(geom_path(aes(long, lat, group = paste(bdata$trp, bdata$group.regroup, 
    sep = ".")), colour = "#0F3B5F", size = 0.2, data = bdata, alpha = 0.5, 
    lineend = "round"))
```



```r
wrld <- c(geom_polygon(aes(group = group), size = 0.1, colour = "black", fill = "#D6BF86", 
    data = wrld.f, alpha = 1))
```



```r
base + route + wrld + theme(panel.background = element_rect(fill = "#BAC4B9", 
    colour = "black")) + annotation_raster(btitle, xmin = 30, xmax = 140, ymin = 51, 
    ymax = 87) + annotation_raster(compass, xmin = 65, xmax = 105, ymin = 25, 
    ymax = 65) + coord_equal() + quiet
```

![plot of chunk unnamed-chunk-6](figure/unnamed-chunk-6.png) 


It is possible to use the readPNG function to import NASA's "Blue Marble" image for use as a basemap in your plot. Given that the route information is the same projection as the image - latitude and longitude (WGS84) - it is very straightforward to set the image extent to span -180 to 180 degrees and -90 to 90 degrees and have it align with the shipping data. Producing the plot is accomplished using the code below. This offers a good example of where functionality designed without spatial data in mind can be harnessed for the purposes of producing interesting maps. Once you have produced the plot, alter the code to recolour the shipping routes to make them appear more clearly against the blue marble background. 


```r
earth <- readPNG("figure/earth_raster.png")

base + annotation_raster(earth, xmin = -180, xmax = 180, ymin = -90, ymax = 90) + 
    route + theme(panel.background = element_rect(fill = "#BAC4B9", colour = "black")) + 
    annotation_raster(btitle, xmin = 30, xmax = 140, ymin = 51, ymax = 87) + 
    annotation_raster(compass, xmin = 65, xmax = 105, ymin = 25, ymax = 65) + 
    coord_equal() + quiet
```

![plot of chunk unnamed-chunk-7](figure/unnamed-chunk-7.png) 


Animating your plots

R is not designed to produce animated graphics and as such it has very few functions that enable straightforward animation. To produce animated graphics users can use a loop to plot and then export a series of images that can then be stitched together into a video. There are two approaches to this; the first is to create a loop that fills a folder with the desired images and then utilise third party software to stitch the images together, whilst the second uses R's own animation package. The latter option still requires the installation of an additional software package called ImageMagick but it has the benefit of creating the animation for you within R and faciliting the export to a range of formats, not least HTML and GIF. Here we demonstrate the use of the package to produce an HTML animation of the shipping tracks completed in each year of the bdata object. The code snippet below appears extremely dense, but it only contains a few addtions to the plot code utilised above.

First load the package:


```r
library(animation)
```


Then clear any previous animation. Obviously the first time you run this it is unnecessary, but it is a good habit to get into.

```r
ani.record(reset = TRUE)
```

We then initiate the "for loop". In this case we are using the unique() function to list the unique years within the bdata object. The loop will take the first year, in this case 1791, and assign it to the object i. The code inside the {} brackets will then run with i=1791. You will spot that i is used in a number of places- first to subset the data when creating the route plot and then as the title in the ggtitle() function. We need to force ggplot to create the graphic within the loop so the entire plot call is wrapped in the print() function. Once the plot is called anin.record() is used to save the plot still and dev.off() used to clear the plot window ready for the next iteration. i is then assigned the next year in the list and the code runs again until all years are plotted.


```r
  for (i in order(unique(bdata$year))
    {
    route<-c(geom_path(aes(long,lat,group=paste(trp, group.regroup, sep=".")), colour="#0F3B5F", size=0.2, data= bdata[which(bdata$year==i),], alpha=0.5, lineend="round"))
    print(base+route+wrld + theme(panel.background = element_rect(fill='#BAC4B9',colour='black')) +annotation_raster(btitle, xmin = 30, xmax = 140, ymin = 51, ymax = 87)+annotation_raster(compass, xmin = 65, xmax = 105, ymin = 25, ymax = 65)+ coord_equal()+quiet+ggtitle(i))
ani.record()
    dev.off()
    }  
```

       
The final step in the process is to save the animation to HTML and view it in your web browser. ani.replay() retrievesanimation stored by the ani.record() function and outdir=getwd() ensures the final file is stored in your working directory.



```r
saveHTML(ani.replay(), img.name = "record_plot", outdir = getwd())
```

```
## HTML file created at: /home/robin/repos/sdvwR/index.html
```

You will note that there is something a little odd about the order in which the years appear. This can be solved by an additional step before the loop code above. Add this in and then regenerate the animation.  
Recap and Conclusions
=====================
