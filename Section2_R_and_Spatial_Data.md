R and Spatial Data
==================

## Preliminaries

R has a unique syntax that is worth learning in basic terms before 
loading spatial data: to R spatial and non-spatial data are 
treated in the same way, although they have different underlying data structures. 

The first step is to ensure that you are in the correct working directory. 
Use `setwd` to select the correct folder. Assuming the folder has been downloaded
from GitHub and unpacked into the desktop on a Windows computer, you would type the
following:


```r
setwd("C:/Users/Uname/Desktop/sdvwR-master")
```


In RStudio, it is recommended to work from *script files*. To open a new
R script, click `File > New File` (see the 
[RStudio website](http://www.rstudio.com/ide/docs/using/keyboard_shortcuts) for shortcuts.)
Try typing and running (by pressing `ctl-Enter` in an RStudio script)
the following calculations to see how R works and plot the result.


```r
t <- seq(from = 0, to = 20, by = 0.1)
x <- sin(t) * exp(-0.2 * t)
plot(t, x)
```

![plot of chunk A preliminary plot](figure/A_preliminary_plot.png) 


R code consists of *functions*, usually proceeded by brackets (e.g. `seq`)
and *objects* (`d`, `t` and `x`). Each function contains *arguments*,
the names of which often do not need to be stated: the function `seq(0, 20, 0.1)`, for example,
would also work because `from`, `to` and `by` are the *default* arguments.
Knowing this is important as it can save typing. In this tutorial, however, 
we generally spell out each of the argument names, for clarity. 

Note the use of the assignment arrow `<-` to create new objects. 
Objects are entities that can be called to by name in R 
and can be renamed through additional assignements (e.g `y <- x` if y seems 
a more appropriate name). This is an efficient way of referring to large data objects or sets of commands.

Spatial Data in R
-----------------

In any data analysis project, spatial or otherwise, it is important to
have a strong understanding of the dataset before progressing. This
section will therefore begin with a description of the input data. 
We will see how data can be loaded into R and exported
to other formats, before going into more detail about the underlying
structure of spatial data in R.

### Loading spatial data in R

In most situations, the starting point of a spatial analysis project is to
load in the datasets. These may originate from government
agencies, remote sensing devices or 'volunteered geographical
information' (Goodchild 2007). R is able to import a very wide range of spatial data formats thanks to
its interface with the Geospatial Data Abstraction Library (GDAL), which
is enabled by the package `rgdal`. Below we will install the rgdal package
using the function `install.packages` (this can be used to install any packages) and then load
data from two spatial data formats: GPS eXchange (`.gpx`) and ESRI's
Shapefile.

`readOGR` is in fact capable of loading dozens more file formats, so the
focus is on the *method* rather than the specific formats. 
Let's start with a `.gpx` file, a tracklog recording a bicycle
ride from Sheffield to Wakefield uploaded OpenStreetMap [3].


```r
install.packages("rgdal")
```

```
## Error: trying to use CRAN without setting a mirror
```

```r
library(rgdal)  # load the gdal package
ogrListLayers(dsn = "data/gps-trace.gpx")
shf2lds <- readOGR(dsn = "data/gps-trace.gpx", layer = "tracks")  # load track
plot(shf2lds)
shf2lds.p <- readOGR(dsn = "data/gps-trace.gpx", layer = "track_points")  # load points
points(shf2lds.p[seq(1, 3000, 100), ])
```


![plot of chunk Leeds to Sheffield GPS data](figure/Leeds_to_Sheffield_GPS_data.png) 


In the code above we first used R to *download* a file from the internet, using the
function `download.file` (note this has been *commented out* using the `#` symbol). 
The two essential arguments of this function
are `url` (we could have typed `url =` before the link) and `destfile`,
the destination file. As with any function, more optional
arguments can be viewed by by typing `?download.file`.

When `rgdal` has successfully loaded, the next task is not to import the
file directly, but to find out which *layers* are available to import, 
with `ogrListLayers`. The output from this command tells us
that various layers are available, including `tracks` and
`track_points`. These are imported into R's *workspace* using `readOGR`. 

Finally, the basic
`plot` function is used to visualize the newly imported objects, ensuring
they make sense. In the second plot function (`points`), we 
add points for a subset of the object. There will be no axes in the plot;
to see how to add them, enter `?axis`

Try discovering more about the function by typing `?readOGR`.
The documentation explains that the `dsn =` argument is 
interpreted differently depending on the type of
file used. In the above example, the `dsn` was set to as the name of the file.
To load Shapefiles, by contrast, the *folder* containing the data is
used:


```r
lnd <- readOGR(dsn = "data/", "london_sport")
```


Here, the files reside in a folder entitled `data`, which is in
R's current working directory (you can check this using `getwd()`).
If the files were stored in the working directory, one would use
`dsn = "."` instead. Again, it may be wise to plot the data that
results, to ensure that it has worked correctly. Now that the data has
been loaded into R's own `sp` format, try interrogating and plotting it,
using functions such as `summary` and `plot`.

The london_sport file contains data pertaining to the percentage of people within each London Borough who regularly undertake physical activity and also the 2001 population of each Borough. 

### The size of spatial datasets in R

Any datasets that have been read into R's *workspace*, which constitutes all
objects that can be accessed by name and can be listed using the `ls()`
function, can be saved in R's own data storage file type `.RData`.
Spatial datasets can get quite large and this can cause problems on
computers by consuming all available memory (RAM) or hard
disk space. It is therefore wise to understand
roughly how large spatial objects are, providing insight
into how long certain functions will take to run.

In the absence of prior knowledge, which of the two objects loaded in
the previous section would one expect to be larger? One could
hypothesize that the London dataset
would be larger based on its greater spatial extent, but how much larger? 
The answer in R is found in the function `object.size`:


```r
object.size(shf2lds)
```

```
## 107464 bytes
```

```r
object.size(lnd)
```

```
## 125544 bytes
```


In fact, the objects have similar sizes: the GPS dataset is surprisingly large.
To see why, we can find out how
many *vertices* (points connected by lines) are contained in each
dataset. To do this we use `fortify` from the ggplot2 package
(use the same method used for rgdal, described above, to install it).


```r
shf2lds.f <- fortify(shf2lds)
nrow(shf2lds.f)
```

```
## [1] 6085
```

```r

lnd.f <- fortify(lnd)
```

```
## Regions defined for each Polygons
```

```r
nrow(lnd.f)
```

```
## [1] 1102
```


In the above block of code we performed two
functions for each object: 1) *flatten* the dataset so that 
each vertice is allocated a unique row  2) use
`nrow` to count the result. 

It is clear that the GPS data has almost 6 times the number
of vertices compared to the London data, explaining its large size. Yet
when plotted, the GPS data does not seem more detailed, implying that
some of the vertices in the object are not needed for effective visualisation since the nodes of the line are imperceptible. 

### Simplifying geometries

Simplifcation can help to make a graphic more readable and less cluttered. Within the 'rgeos' package it is possible to use the `gSimplify` function to simplify spatial R objects:


```r
library(rgeos)
shf2lds.simple <- gSimplify(shf2lds, tol = 0.001)
(object.size(shf2lds.simple)/object.size(shf2lds))[1]
```

```
## [1] 0.04608
```

```r
plot(shf2lds.simple)
plot(shf2lds, col = "red", add = T)
```


In the above block of code, `gSimplify` is given the object `shf2lds`
and the `tol` argument of 0.001 (much
larger tolerance values may be needed, for data that is *projected*). 
Next, we divide the size of the simplified object by the original 
(note the use of the `/` symbol). The output  of `0.04...` 
tells us that the new object is only around
4% of its original size. We can see how this has happened
by again counting the number of vertices. This time we use the 
`coordinates` and `nrow` functions together:


```r
nrow(coordinates(shf2lds.simple)[[1]][[1]])
```

```
## [1] 44
```


The syntax of the double square brackets will seem strange, 
providing a taster of how R 'sees' spatial data. 
Do not worry about this for now. 
Of interest here is that the number of vertices has shrunk, from over 6,000 to 
only 44, without losing much information about the shape of the line.
To test this, try plotting the original and simplified tracks
on your computer: when visualized using the `plot` function, 
object `shf2lds.simple` retains the overall shape of the
line and is virtually indistinguishable from the original object.

This example is rather contrived because even the larger object
`shf2lds` is only a tenth of a megabyte, negligible compared with the gigabytes of
memory available to modern computers. However, it underlines a wider point:
for visualizing *small scale* maps, spatial data *geometries*
can often be simplified to reduce processing time and
use of memory.

### Saving and exporting spatial objects

A typical R workflow involves loading the data, processing/analysing the data
and finally exporting the data in a new form. 
`writeOGR`, the 
logical counterpart of `readOGR` is ideal for this task. This is performed using
the following command (in this case we are exporting to an ESRI Shapefile):


```r
shf2lds.simple <- SpatialLinesDataFrame(shf2lds.simple, data.frame(row.names = "0", 
    a = 1))
writeOGR(shf2lds.simple, layer = "shf2lds", dsn = "data/", driver = "ESRI Shapefile")
```





In the above code, the object was first converted into a spatial dataframe class required
by the `writeOGR` command, before 
being exported as a shapefile entitled shf2lds. Unlike with `readOGR`, the driver must 
be specified, in this case with "ESRI Shapefile" [4]. The simplified GPS data are now available
to other GIS programs for further analysis. Alternatively, 
`save(shf2lds.simple, file = "data/shf2lds.RData")`
will save the object in R's own spatial data format, which is described in the next section.

### The structure of spatial data in R

Spatial datasets in R are saved in their own format, defined as 
`Spatial...` classes within the `sp` package. For this reason, 
`sp` is the basic spatial package in R, upon which the others depend. 
Spatial classes range from the basic `Spatial` class to the complex
`SpatialPolygonsDataFrame`: the `Spatial` class contains only two required *slots* [5]:


```r
getSlots("Spatial")
```

```
##        bbox proj4string 
##    "matrix"       "CRS"
```


This tells us that `Spatial` objects must contain a bounding box (`bbox`) and 
a coordinate reference system (CRS) accessed via the function `proj4string`. 
Further details on these can be found by typing `?bbox` and `?proj4string`. 
All other spatial classes in R build on 
this foundation of a bounding box and a projection system (which 
is set automatically to `NA` if it is not known). However, more complex 
classes contain more slots, some of which are lists which contain additional 
lists. To find out the slots of `shf2lds.simple`, for example, we would first 
ascertain its class and then use the `getSlots` command:


```r
class(shf2lds.simple)  # identify the object's class
```

```
## [1] "SpatialLinesDataFrame"
## attr(,"package")
## [1] "sp"
```

```r
getSlots("SpatialLinesDataFrame")  # find the associated slots
```

```
##         data        lines         bbox  proj4string 
## "data.frame"       "list"     "matrix"        "CRS"
```


The same principles apply to all spatial classes including 
`Spatial* Points`, `Polygons` `Grids` and `Pixels`
as well as associated `*DataFrame` classes. For more information on 
this, see the `sp` documentation: `?Spatial`.

To flatten a `Spatial*` object in R, so it becomes a simple
data frame, the `fortify` function can be used (more on this later).
For most spatial data handling tasks the `Spatial*` object classes are idea, 
as illustrated below.

Manipulating spatial data
-------------------------

### Coordinate reference systems

As mentioned in the previous section, all `Spatial` objects in R
are allocated a coordinate reference system (CRS).
The CRS of any spatial object can be found using the command 
`proj4string`. In some cases the CRS is not known: in this case 
the result will simply be `NA`.
To discover the CRS of the `lnd` object for example, 
type the following: 


```r
proj4string(lnd)
```



```
## [1] "+proj=tmerc +lat_0=49 +lon_0=-2 +k=0.9996012717 +x_0=400000 +y_0=-100000 +ellps=airy "
```



The output may seem cryptic, but is in fact highly informative: `lnd` has *projected*
coordinates, based on the 
[*Transverse Mercator*](http://en.wikipedia.org/wiki/Transverse_Mercator_projection)
system (hence `"+proj=tmerc"` in the output) and its origin is at latitude 49N, -2E.

If we *know* that the CRS is incorrectly specified, it can be re-set.
In this case, for example we know that `lnd` actually has a CRS of OSGB1936.
Knowing also that the code for this is 27700, it can be updated as follows:


```r
proj4string(lnd) <- CRS("+init=epsg:27700")
proj4string(lnd)
```

```
## [1] "+init=epsg:27700 +proj=tmerc +lat_0=49 +lon_0=-2 +k=0.9996012717 +x_0=400000 +y_0=-100000 +datum=OSGB36 +units=m +no_defs +ellps=airy +towgs84=446.448,-125.157,542.060,0.1502,0.2470,0.8421,-20.4894"
```


The CRS has now been updated - note that the key details are all the same as before. 
Note: this method should **never** be used as an attempt to *reproject* data from
one CRS to another. 

### Reprojecting data

Transforming the coordinates of spatial data from one CRS to another (reprojection)
is a common task in GIS. This is because data
from national sources are generally provided in *projected* coordinates
(the location on the cartesian coordinates of a map) whereas data from GPSs and the internet 
are generally provided in *geographic* coordinates, with
latitude and longitude measured in degrees to locate points on the surface of the globe.

Reprojecting data in R is quite simple: all you need is a spatial object with a known
CRS and knowledge of the CRS you wish to transform it to. To illustrate why that is necessary, 
try to plot the objects `lnd` and `shf2lnd.simple` on the same map:


```r
combined <- rbind(fortify(shf2lds.simple)[, 1:2], fortify(lnd)[, 1:2])
plot(combined)
```

![plot of chunk Plot of spatial objects with different CRS](figure/Plot_of_spatial_objects_with_different_CRS.png) 


In the above code we first extracted the coordinates of the vertices of each line and polygon 
using `fortify` and then plotted them using `plot`. The image shows why 
reprojection is necessary: the `.gpx` data are on a totally different scale
than the shapefile of London. Hence the tiny dot at the bottom left of the graph.
We will now reproject the data, allowing `lnd` and `shf2lds.simple` to be
usefully plotted on the same graphic:


```r
lnd.wgs84 <- spTransform(lnd, CRSobj = CRS("+init=epsg:4326"))
```


The above code created a new object,`lnd.wgs84`, that contains the 
same geometries as the original but in a new CRS using the 
`spTransform` function. The `CRS` argument was set to 
`"+init=epsg:4326"`, which represents the WGS84 CRS via an 
EPSG code [6]. Now `lnd` has been reprojected we can plot it 
next to the GPS data:


```r
combined <- rbind(fortify(shf2lds.simple)[, 1:2], fortify(lnd.wgs84)[, 1:2])
plot(combined)
```

![plot of chunk Plot of spatial objects sharing the same CRS](figure/Plot_of_spatial_objects_sharing_the_same_CRS.png) 


Although the plot of the reprojected data is squashed because the axis scales are not fixed
and distorted (*geographic* coordinates such as WGS84 distort space close to the poles), but
at least the relative position and shape of both objects can now be seen
(making visualisations attractive is covered in the next major section). The presence of the 
dotted line in the top left of the plot confirms our assumption that the GPS data is 
from around Sheffield, which is northwest of London.

### Attribute joins

London Boroughs are official administrative
zones so we can easily join a range of other datasets 
to the polygons in the `lnd` object. We will use the example 
of crime data to illustrate this data availability, which is 
stored in the `data` folder available from this project's github page.


```r
load("data/crimeAg.Rdata")  # load the crime dataset from an R dataset
```


After the dataset has been explored (e.g. using the `summary` and `head` functions)
to ensure compatibility, it can be joined to `lnd`. We will use the
the `join` function in the `plyr` package but the `merge` function 
could equally be used (remember to type `library(plyr)` if needed).




`join` requires all joining variables to have the 
same name, which has already been done [7].


```r
lnd@data <- join(lnd@data, crimeAg)
```


Take a look at the `lnd@data` object. You should 
see new variables added, meaning the attribute join 
was successful. 

## Spatial joins

A spatial join, like an attribute join, is used to transfer information
from one dataset to another. There is a clearly defined direction to
spatial joins, with the *target layer* receiving information from
another spatial layer based on the proximity of elements from both
layers to each other. There are three broad types of spatial join:
one-to-one, many-to-one and one-to-many. We will focus only the former
two as the third type is rarely used.

### One-to-one spatial joins

One-to-one spatial joins are by far the easiest to understand and
compute because they simply involve the transfer of attributes in one
layer to another, based on location. A one-to-one join is depicted in
Figure 6 below, and can performed using the same technique 
as described in the section on spatial aggregation.

![plot of chunk Illustration of a one-to-one spatial
join](figure/Illustration_of_a_one-to-one_spatial_join_.png)

### Many-to-one spatial joins

Many-to-one spatial joins involve taking a spatial layer with many
elements and allocating the attributes associated with these elements to
relatively few elements in the target spatial layer. A common type of
many-to-one spatial join is the allocation of data collected at many
point sources unevenly scattered over space to polygons representing
administrative boundaries, as represented in Fig. x.


```r
lnd.stations <- readOGR("data/", "lnd-stns", p4s = "+init=epsg:27700")
```

```
## OGR data source with driver: ESRI Shapefile 
## Source: "data/", layer: "lnd-stns"
## with 2532 features and 6 fields
## Feature type: wkbPoint with 2 dimensions
```

```r
plot(lnd)
plot(lnd.stations[round(runif(500, 1, nrow(lnd.stations))), ], add = T)
```

![plot of chunk Input data for a spatial join](figure/Input_data_for_a_spatial_join.png) 


The above code reads in a `SpatialPointsDataFrame` consisting of 2532
transport nodes in and surrounding London and then plots a random sample
of 500 of these over the previously loaded borough level administrative
boundaries. The reason for plotting a sample of the points rather than
all of them is that the boundary data becomes difficult to see if all of
the points are plotted. It is also useful to see and practice sampling
techniques; try to plot only the first 500 points, rather
than a random selection, and spot the difference.

The most obvious issue with the point data from the perspective of a
spatial join with the borough data we have is that many of the points in the
dataset are in fact located outside the region of interest. Thus, the
first stage in the analysis is to filter the point data such that only
those that lie within London's administrative zones are selected. This
in itself is a kind of spatial join, and can be accomplished with the
following code.


```r
proj4string(lnd) <- proj4string(lnd.stations)
lnd.stations <- lnd.stations[lnd, ]  # select only points within lnd
plot(lnd.stations)  # check the result
```

![plot of chunk A spatial subset of the points](figure/A_spatial_subset_of_the_points.png) 


The station points now clearly follow the form of the `lnd` shape,
indicating that the procedure worked. Let's review the code that allowed
this to happen: the first line ensured that the CRS associated with each
layer is *exactly* the same: this step should not be required in most
cases, but it is worth knowing about. Of course, if the coordinate
systems are *actually* different in each layer, the function
`spTransform` will be needed to make them compatible. In this case, only the name was slightly
different hence direct alteration of the CRS name via the function
`proj4string`.

The second line of code is where power of
R's sp package becomes clear: all that was needed was to place another
spatial object in the row index of the points (`[lnd, ]`) and R
automatically understood that a subset based on location should be
produced. This line of code is an example of R's 'terseness' - only a
single line of code is needed to perform what is in fact quite a complex
operation.

### Spatial aggregation

Now that only stations which *intersect* with the `lnd` polygon have
been selected, the next stage is to extract information about the points
within each zone. This many-to-one spatial join is also known as
*spatial aggregation*. To do this there are a couple of approaches: one
using the `sp` package and the other using `rgeos` (see Bivand et al.
2013, 5.3).

As with the *spatial subest* method described above, the developers of R
have been very clever in their implementation of spatial aggregation
methods. To minimise typing and ensure consistency with R's base
functions, `sp` extends the capabilities of the `aggregate` function to
automatically detect whether the user is asking for a spatial or a
non-spatial aggregation (they are, in essence, the same thing - we
recommend learning about the non-spatial use of `aggregate` in R for
comparison).

Continuing with the example of station points in London polygons, let us
use the spatial extension of `aggregate` to count how many points are in
each borough:


```r
lndStC <- aggregate(lnd.stations, by = lnd, FUN = length)
summary(lndStC)
plot(lndStC)
```


As with the spatial subset function, the above code is extremely terse.
The aggregate function here does three things: 1) identifies which
stations are in which London borough; 2) uses this information to
perform a function on the output, in this case `length`, which simply
means "count" in this context; and 3) creates a new spatial object
equivalent to `lnd` but with updated attribute data to reflect the
results of the spatial aggregation. The results, with a legend and
colours added, are presented in Figure 9 below. 
The code used to create this plot is rather long; it can be 
viewed online: http://rpubs.com/RobinLovelace/11738 . 




![Number of stations in London boroughs](figure/nStations.png)

As with any spatial attribute data stored as an `sp` object, we can look
at the attributes of the point data using the `@` symbol:


```r
head(lnd.stations@data, n = 2)
```

```
##    CODE          LEGEND FILE_NAME NUMBER                  NAME MICE
## 91 5520 Railway Station  gb_south  17607       Belmont Station   19
## 92 5520 Railway Station  gb_south  17608 Woodmansterne Station    5
```


In this case we have three potentially interesting variables: "LEGEND",
telling us what the point is, "NAME", and "MICE", which represents the
number of mice sightings reported by the public at that point (this is a
fictional variable!). To illustrate the power of the `aggregate`
function, let us use it to find the average number of mice spotted in
transport points in each London borough, and the standard deviation:


```r
lndAvMice <- aggregate(lnd.stations["MICE"], by = lnd, FUN = mean)
summary(lndAvMice)
lndSdMice <- aggregate(lnd.stations["MICE"], by = lnd, FUN = sd)
summary(lndSdMice)
```


In the above code, `aggregate` was used to create entirely new spatial objects 
that are exactly the same as `lnd`, except with new attribute data.
To add the mean mice count to the original object, the following code can be 
used: 


```r
lnd$av.mice <- lndAvMice$MICE
```


The above code creates a new variable in the `lnd@data` object
entitled "av.mice" and populates it with desired values. Thus
`Spatial` objects can behave in the same way as data.frames when 
refering to attribute variables.

## Summary

To summarise this section, we have taken a look inside R's representation 
of spatial data, learned how to manipulate these datasets in terms of 
CRS transformations and attribute data and finally explored spatial joins and aggregation. 
