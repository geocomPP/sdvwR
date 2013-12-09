R and Spatial Data
========================================================

## Spatial Data in R

In any data analysis project, spatial or otherwise, it is important to have a strong 
understanding of the dataset before progressing. This section will therefore begin with 
a description of the input data used in this section. We will see how data can 
be loaded into R and exported to other formats, before going into more detail about the 
underlying structure of spatial data in R: how it 'sees' spatial data is quite unique.

## Loading and saving data

In most situations, the starting point of spatial analysis tasks is 
loading in pre-existing datasets. These may originate from government agencies, 
remote sensing devices or 'volunteered geographical information' from GPS devices, 
online databases such as Open Street Map or geo-tagged social media (Goodchild 2007).
In any case, the diversity of geographical data formats is large. 

R is able to import a very wide range of spatial data formats thanks to its
interface with the Geospatial Data Abstraction Library (GDAL), which is 
enabled by loading the package `rgdal` into R. Below we will
load data from two spatial data formats: GPS eXchange (`.gpx`)
and an ESRI Shapefile (consisting of at least files 
with `.shp`, `.shx` and `.dbf` extensions).

`readOGR` is in fact cabable of loading dozens more file formats, 
so the focus is on the *method* rather than the specific formats. 
The 'take home message' is that the `readOGR` function is capable 
of loading most common spatial file formats, but behaves differently depending on file type.
Let's start with a `.gpx` file, a tracklog recording a bicycle ride from Sheffield
to Wakefield which was uploaded Open Street Map. [!!! more detail?]


```r
# download.file('http://www.openstreetmap.org/trace/1619756/data', destfile
# = 'gps-trace.gpx')
library(rgdal)  # load the gdal package
```

```
## Loading required package: sp
## rgdal: version: 0.8-10, (SVN revision 478)
## Geospatial Data Abstraction Library extensions to R successfully loaded
## Loaded GDAL runtime: GDAL 1.10.0, released 2013/04/24
## Path to GDAL shared files: /usr/share/gdal/1.10
## Loaded PROJ.4 runtime: Rel. 4.8.0, 6 March 2012, [PJ_VERSION: 480]
## Path to PROJ.4 shared files: (autodetected)
```

```r
ogrListLayers(dsn = "gps-trace.gpx")  # which layers are available?
```

```
## [1] "waypoints"    "routes"       "tracks"       "route_points"
## [5] "track_points"
```

```r
shf2lds <- readOGR(dsn = "gps-trace.gpx", layer = "tracks")  # load track
```

```
## OGR data source with driver: GPX 
## Source: "gps-trace.gpx", layer: "tracks"
## with 1 features and 12 fields
## Feature type: wkbMultiLineString with 2 dimensions
```

```r
plot(shf2lds)
shf2lds.p <- readOGR(dsn = "gps-trace.gpx", layer = "track_points")  # load points
```

```
## OGR data source with driver: GPX 
## Source: "gps-trace.gpx", layer: "track_points"
## with 6085 features and 26 fields
## Feature type: wkbPoint with 2 dimensions
```

```r
points(shf2lds.p[seq(1, 3000, 100), ])
```

![plot of chunk unnamed-chunk-1](figure/unnamed-chunk-1.png) 


There is a lot going on in the preceding 7 lines of code, including functions that 
you are unlikely to have encountered before. Let us think about what has happened, line-by-line.

First, we used R to *download* a file from the internet, using the function `download.file`.
The two essential arguments of this function are `url` (we could have typed`url =` before the link) 
and `destfile` (which means destination file). As with any function, more optional arguments 
can be viewed by typing `?download.file`. 

When `rgdal` has succesfully loaded, the next task is not to import the file directly, 
but to find out which *layers* are available to import, with the function `ogrListLayers`.
The output from this command tells us that various layers are available, including
`tracks` and `track_points`, which we subsequently load using `readOGR`.
The basic `plot` function is used to plot the newly imported objects, ensuring they make sense.
In the second `plot` function, we take a subset of the object (see section ... for more on this).

As stated in the help documentation (accessed by entering `?readOGR`), the `dsn =` argument 
is interpreted differently depending on the type of file used. 
In the above example, the filename was the data source name. 
To load Shapefiles, by contrast, the *folder* containing the data is used:


```r
lnd <- readOGR(dsn = "data/", "london_sport")
```


Here, the data is assumed to reside in a folder entitled `data` which in R's current 
working directory (remember to check this using `getwd()`). 
If the files were stored in the working 
directory, one would use `dsn = "."` instead. Again, it may be wise to plot the data that 
results, to ensure that it has worked correctly.
Now that the data has been loaded into R's own `sp` format, try interogating and 
plotting it, using functions such as `summary` and `plot`.

## The structure of spatial data in R

### Spatial* data

#### Points

#### Lines

#### Polygons

#### Grids and raster data

### Simplifying spatial data with `fortify`

## The main spatial packages

### sp

### rgdal

### rgeos

## Maps with ggplot2

### Adding base maps with ggmap

## Manipulating spatial data

### Coordinate reference systems and transformations

### Attribute joins

### Spatial joins

### Aggregation

### Clipping
