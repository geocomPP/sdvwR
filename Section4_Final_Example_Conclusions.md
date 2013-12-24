A Final Example
===============




  
  Here we present a final example that draws upon the many advanced concepts discussed in this chapter to produce a map of 18th Century Shipping flows. 


```r
library(ggplot2)
library(png)
wrld <- readOGR(".", "ne_110m_admin_0_countries")
```

```
## Error: Cannot open file
```

```r
btitle <- readPNG("figure/brit_titles.png")
compass <- readPNG("figure/windrose.png")
earth <- readPNG("figure/earth_raster.png")
bdata <- read.csv("data/british_shipping_example.csv")
```



```r
xquiet <- scale_x_continuous("", breaks = NULL)
yquiet <- scale_y_continuous("", breaks = NULL)
quiet <- list(xquiet, yquiet)
```



```r
wrld.pop.f <- fortify(wrld, region = "sov_a3")
```

```
## Error: object 'wrld' not found
```

```r
base <- ggplot(wrld.pop.f, aes(x = long, y = lat))
```

```
## Error: object 'wrld.pop.f' not found
```



```r
route <- c(geom_path(aes(long, lat, group = paste(bdata$trp, bdata$group.regroup, 
    sep = ".")), colour = "#0F3B5F", size = 0.2, data = bdata, alpha = 0.5, 
    lineend = "round"))
```



```r
wrld <- c(geom_polygon(aes(group = group), size = 0.1, colour = "black", fill = "#D6BF86", 
    data = wrld.pop.f, alpha = 1))
```

```
## Error: object 'wrld.pop.f' not found
```



```r
base + route + wrld + theme(panel.background = element_rect(fill = "#BAC4B9", 
    colour = "black")) + annotation_raster(btitle, xmin = 30, xmax = 140, ymin = 51, 
    ymax = 87) + annotation_raster(compass, xmin = 65, xmax = 105, ymin = 25, 
    ymax = 65) + coord_equal() + quiet
```

```
## Error: object 'base' not found
```




```r
base + annotation_raster(earth, xmin = -180, xmax = 180, ymin = -90, ymax = 90) + 
    route + theme(panel.background = element_rect(fill = "#BAC4B9", colour = "black")) + 
    annotation_raster(btitle, xmin = 30, xmax = 140, ymin = 51, ymax = 87) + 
    annotation_raster(compass, xmin = 65, xmax = 105, ymin = 25, ymax = 65) + 
    coord_equal() + quiet
```

```
## Error: object 'base' not found
```

!!!change the colour of the routes to make them stand out more.

Recap and Conclusions
=====================
