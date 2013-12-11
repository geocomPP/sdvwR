Introduction
============

What is R?
----------

R is a free and open source computer program that runs on all major
operating systems. R relies primarily on the *command line* for data
input: instead of interacting with the program by moving your mouse
around clicking on different parts of the screen, users enter commands
via the keyboard. This will seem to strange to people accustomed to
relying on a graphical user interface (GUI) for most of their computing,
e.g. via popular programs such as Microsoft Excel or SPSS, yet the
approach has a number of benefits, as highlighted by Gary Sherman (2008,
p. 283), developer of the popular GIS program QGIS:

> With the advent of “modern” GIS software, most people want to point
> and click their way through life. That’s good, but there is a
> tremendous amount of flexibility and power waiting for you with the
> command line. Many times you can do something on the command line in a
> fraction of the time you can do it with a GUI.

The joy of this, when you get accustomed to it, is that any command is
only ever a few keystrokes away, and the order of the commands sent to R
can be stored and repeated in scripts, saving even more time in the
long-term (more on this in section ...).

Another important attribute of R, related to its command line interface,
is that it is a fully fledged *programming language*. Other GIS programs
are written in lower level languages such as C++ which are kept at a
safe distance from the users by the GUI. In R, by contrast, the user is
'close to the metal' in the sense that what he or she inputs is the same
as what R sees when it processes the request. This 'openness' can seem
raw and daunting to beginners, but it is vital to R's success. Access to
R's source code and openness about how it works has enabled a veritable
army of programmers to improve R over time and add an incredible number
of extensions to its base capabilities. Consider for a moment that there
are now more than 4000 official packages for R, allowing it to tackle
almost any computational or numerical problem one could image, and many
more that one could not!

Although writing R source code and creating new packages will not appeal
to most R users, it inspires confidence to know that there is a strong
and highly skilled community of R developers. If there is a useful
spatial function that R cannot currently perform, there is a reasonable
chance that someone is working on a solution that will become available
at a later date. This constant evolution and improvement is a feature of
open source software projects not limited to R, but the range and
diversity of extensions is certainly one of its strong points. One area
where extension of R's basic capabilities has been particularly
successful is the addition of a wide variety of spatial tools.

The rise of R's spatial capabilities
------------------------------------

!!! Quick history of R's spatial packages emphasizing current growth and
heavy dependence on sp.

Mention exciting and recently added packages.

Why R for spatial data visualisation?
-------------------------------------

Aside from confusion surrounding its one character name - "what kind of
a name is R?" [1] and "how can you possibly find resources for R
online?" [2] - R may also seem a strange choice for a chapter on
*spatial* data visualisation specifically. "I thought R was just for
statistics?" and "Why not use a proper GIS package like QGIS?" are valid
questions.

The first question arises because R was traditionally conceived - and is
still primarily known - as a "statistical programming language" (Bivand
and Gebhardt 2000). Although R does have cutting edge statistical
capabilities, this definition does not do justice to its power and
flexibility. Thus, a more accurate albeit longer definition of R is "an
integrated suite of software facilities for data manipulation,
calculation and graphical display" (Venables et al. 2013). It is
important to consider this wider definition before diving into R: it is
a fully fledged programming language meaning that it is highly
extensible but also that the same result can often be generated in
different ways. This can be confusing.

The second question is based on the premise that all 'proper' Geographic
Information Systems need to operate in the same way, with primacy
allocated to a mapping window and a mouse-driven GUI interface. But when
we look back at the history of GIS and its definitions, it becomes clear
that R *is* fully fledged GIS, when it is set up correctly. All early
GIS programs used a command-line interface; GUIs were only developed
later as a way to run commands without needing to remember all the
command names (although this is largely overcome by good 'help' options
and auto-completion). A concise definition of a GIS is "a computerized
tool for solving geographic problems" (Longley et al. 2005, p. 16) and R
certainly enables this. A more expansive definition of GIS is "a
powerful set of tools for collecting, storing, retrieving at will,
transforming, and displaying spatial data from the real world for a
particular set of purposes" (Burrough and McDonnell, 1998, from Bivand
et al. 2013, p. 5); R excels at each of these tasks.

That being said, there are a few major differences between R and
conventional GIS programs in terms of spatial data visualisation: R is
more suited to creating one-off graphics than exploring spatial data
through repeated zooming, panning and spatial sub-setting using
custom-drawn polygons, compared with conventional GIS programs. Although
interactive maps in R can be created (e.g. using the web interface
`shiny`), it is recommended that R is used *in addition to* rather than
as a direct replacement of dedicated GIS programs, especially now that
there are myriad free options to try (Sherman 2008). An additional point
is that while dedicated GIS programs handle spatial data by default and
display the results in a single way, there are various options in R that
must be decided by the user, for example whether to use R's base
graphics or a dedicated graphics package such as ggplot2. On the other
hand, the main benefits of R for spatial data visualisation lie in the
*reproducibility* of its outputs, a feature that we will be using to
great effect in this chapter.

R for Reproducible research
---------------------------

!!! Are all the examples going to be reproducible?

All these components - scripting, stability and the ability to embed
'live' code in documents - make R an excellent tool for transparent
research. By using R and carefully documenting what has been done, one
ensures that the methods used to reach a certain result can be
reproduced by anyone anywhere in the world, provided they have access to
the input dataset. The RStudio graphical interface with R encourages
good documentation. RStudio enables presentations to be created and
professional-quality pdf documents to be produced using the custom file
formats `.Rpres` and `.rnw`. In fact, this chapter was written in
RMarkdown and converted into a pdf document using only RStudio editor!

R in the wild
-------------

Examples of where R has had an important visual impact.

Might be good to mention New York Times etc here as key users of R.

An introductory session
-----------------------

The best way to learn to use a new tool is by using it. The metaphor of
craft skills is appropriate here: if you wanted to become skilled at
scything, for example, you would not spend your time reading about
scythes. The same is true of R: the best way to learn how it works is to
'get your hands dirty' and try it out on your own computer. This
introductory session will therefore serve as an introduction to R's
unque *syntax*, as well an illustration of how other visualisations
presented in this chapter can be reproduced.

Chapter overview
----------------

including of example dataset used.

Endnotes
--------

1.  R's name originates from the creators of R, Ross Ihaka and Robert
    Gentleman. R is an open source implementation of the statistical
    programming language S, so its name is also a play on words that
    makes implicit reference to this.

2.  R is notoriously difficult to search for on major search engines, as
    it is such a common letter with many other uses beyond the name of a
    statistical programming language. This should not be a deterrent, as
    R has a wealth of excellent online resources. To overcome the issue,
    you can either be more specific with the search term (e.g. "R
    spatial statistics") or use an R specific search engine such as
    [rseek.org](http://www.rseek.org/). You can also search of online
    help *from within R* using the command `RSiteSearch`. E.g.
    `RSiteSearch("spatial statistics")`. Experiment and see which you
    prefer!

~~~~ {.r}
# Packages we'll be using for this session
library(rgdal)
library(ggplot2)
library(grid)
# setwd('/Users/james/Dropbox/Abstracts_Papers_Reviews/Geocomp_Chapter')
~~~~

get data- map of the world
==========================

To download data of the world the block of code below was used. It is
commented out because the data may already be on your system. Uncomment
each new line (by deleting the `#` symbol) if you need to download and
extract the data.

~~~~ {.r}
# download.file(url='http://www.naturalearthdata.com/http//www.naturalearthdata.com/download/110m/cultural/ne_110m_admin_0_countries.zip',
# 'ne_110m_admin_0_countries.zip', 'auto')
# unzip('ne_110m_admin_0_countries.zip', exdir = 'data/')
# file.remove('ne_110m_admin_0_countries.zip')
~~~~

read shape file using rgdal library
===================================

~~~~ {.r}
wrld <- readOGR("data/", "ne_110m_admin_0_countries")
~~~~

    ## OGR data source with driver: ESRI Shapefile 
    ## Source: "data/", layer: "ne_110m_admin_0_countries"
    ## with 177 features and 63 fields
    ## Feature type: wkbPolygon with 2 dimensions

transform this to the robinson projection- this is much better for showing population datasets
==============================================================================================

~~~~ {.r}
wrld.rob <- spTransform(wrld, CRS("+init=ESRI:54030"))
~~~~

    ## Error: error in evaluating the argument 'CRSobj' in selecting a method for function 'spTransform': Error in CRS("+init=ESRI:54030") : no system list, errno: 2

~~~~ {.r}

wrld.rob.f <- fortify(wrld, region = "sov_a3")
~~~~

    ## Loading required package: rgeos
    ## rgeos version: 0.3-2, (SVN revision 413M)
    ##  GEOS runtime version: 3.3.9-CAPI-1.7.9 
    ##  Polygon checking: TRUE

~~~~ {.r}

wrld.pop.f <- merge(wrld.rob.f, wrld@data, by.x = "id", by.y = "sov_a3")
~~~~

continuous colour ramp
======================

~~~~ {.r}
ggplot(wrld.pop.f, aes(long, lat, group = group, fill = pop_est)) + geom_polygon() + 
    coord_equal() + labs(x = "Longitude", y = "Latitude", fill = "World Population") + 
    ggtitle("World Population")
~~~~

![plot of chunk World map with continuous colour ramp
fill](figure/World_map_with_continuous_colour_ramp_fill.png)

better colours with more breaks- to finish
==========================================

map+ scale\_fill\_continuous(breaks=)

categorical variables
=====================

Conforming to colour conventions
================================

map2\<- ggplot(wrld.pop.f, aes(long, lat, group = group)) +
coord\_equal()

blue\<-map2+ geom\_polygon(fill="light blue") + theme(panel.background =
element\_rect(fill = "dark green"))

green\<-map2 + geom\_polygon(fill="dark green") + theme(panel.background
= element\_rect(fill = "light blue"))

grid.arrange(green, blue, ncol=2)

Experimenting with line colour and line widths
==============================================

map3\<-map2+theme(panel.background = element\_rect(fill = "light blue"))

yellow\<-map3+ geom\_polygon(fill="dark green", colour="yellow")

black\<-map3+geom\_polygon(fill="dark green", colour="black")

thin\<-map3+ geom\_polygon(fill="dark green", colour="black", lwd=0.1)

thick\<-map3+ geom\_polygon(fill="dark green", colour="black", lwd=1.5)

grid.arrange(yellow, black,thick, thin, ncol=2)

Annotations
===========

North arrow
===========

In the maps created so far, we have defined the *aesthetics* of the map
in the foundation function `ggplot`. The result of this is that all
subsequent layers are expected to have the same variables and
essentially contain data with the same dimensions as original dataset.
But what if we want to add a new layer from a completely different
dataset, e.g. to add an arrow? To do this, we must not add any arguments
to the `ggplot` function, only adding data sources one layer at a time:

~~~~ {.r}
arrow <- data.frame(c(2.97, 2.97, 2.9, 3, 3.1, 3.03, 3.03, 2.97), c(1, 4, 4, 
    5.5, 4, 4, 1, 1))
names(arrow) <- c("x", "y")
qplot(data = arrow, x = x, y = y)
~~~~

![plot of chunk World map with custom lines
added](figure/World_map_with_custom_lines_added1.png)

~~~~ {.r}
qplot(data = arrow, x = x, y = y) + geom_line()
~~~~

![plot of chunk World map with custom lines
added](figure/World_map_with_custom_lines_added2.png)

~~~~ {.r}
arrow <- arrow * 5 - 40

ggplot() + geom_polygon(data = wrld.pop.f, aes(long, lat, group = group, fill = pop_est)) + 
    geom_line(data = arrow, aes(x, y))
~~~~

![plot of chunk World map with custom lines
added](figure/World_map_with_custom_lines_added3.png)

Here we created an empty plot, meaning that each new layer must be given
its own dataset. While more code is needed in this example, it enables
much greater flexibility with regards to what can be included in new
layer contents. Another possibility is to use the `segment` geom to add
a pre-made arrow:

~~~~ {.r}
ggplot() + geom_polygon(data = wrld.pop.f, aes(long, lat, group = group, fill = pop_est)) + 
    geom_line(aes(x = c(-160, -160), y = c(0, 25)), arrow = arrow())
~~~~

![plot of chunk World map with a North
arrow](figure/World_map_with_a_North_arrow.png)

scale bar- found this function
==============================

hscale\_segment = function(breaks, ...) { y =
unique(breaks$y) stopifnot(length(y) == 1) dx = max(breaks$x) -
min(breaks$x) dy = 1/30 * dx hscale = data.frame(ix=min(breaks$x), iy=y,
jx=max(breaks$x), jy=y) vticks = data.frame(ix=breaks$x, iy=(y - dy),
jx=breaks\$x, jy=(y + dy)) df = rbind(hscale, vticks)
return(geom\_segment(data=df, aes(x=ix, xend=jx, y=iy, yend=jy), ...))

}

hscale\_text = function(breaks, ...) { dx =
max(breaks$x) - min(breaks$x) dy = 2/30 \* dx breaks$y = breaks$y + dy
return(geom\_text(data=breaks, aes(x=x, y=y, label=label), hjust=0.5,
vjust=0, ...))

}

R and Spatial Data
==================

Spatial Data in R
-----------------

In any data analysis project, spatial or otherwise, it is important to
have a strong understanding of the dataset before progressing. This
section will therefore begin with a description of the input data used
in this section. We will see how data can be loaded into R and exported
to other formats, before going into more detail about the underlying
structure of spatial data in R: how it 'sees' spatial data is quite
unique.

### Loading spatial data in R

In most situations, the starting point of spatial analysis tasks is
loading in pre-existing datasets. These may originate from government
agencies, remote sensing devices or 'volunteered geographical
information' from GPS devices, online databases such as Open Street Map
or geo-tagged social media (Goodchild 2007). The diversity of
geographical data formats is large.

R is able to import a very wide range of spatial data formats thanks to
its interface with the Geospatial Data Abstraction Library (GDAL), which
is enabled by loading the package `rgdal` into R. Below we will load
data from two spatial data formats: GPS eXchange (`.gpx`) and an ESRI
Shapefile (consisting of at least files with `.shp`, `.shx` and `.dbf`
extensions).

`readOGR` is in fact cabable of loading dozens more file formats, so the
focus is on the *method* rather than the specific formats. The 'take
home message' is that the `readOGR` function is capable of loading most
common spatial file formats, but behaves differently depending on file
type. Let's start with a `.gpx` file, a tracklog recording a bicycle
ride from Sheffield to Wakefield which was uploaded Open Street Map.
[!!! more detail?]

~~~~ {.r}
# download.file('http://www.openstreetmap.org/trace/1619756/data', destfile
# = 'data/gps-trace.gpx')
library(rgdal)  # load the gdal package
~~~~

    ## Loading required package: sp
    ## rgdal: version: 0.8-11, (SVN revision 479M)
    ## Geospatial Data Abstraction Library extensions to R successfully loaded
    ## Loaded GDAL runtime: GDAL 1.9.2, released 2012/10/08
    ## Path to GDAL shared files: /usr/share/gdal
    ## Loaded PROJ.4 runtime: Rel. 4.8.0, 6 March 2012, [PJ_VERSION: 480]
    ## Path to PROJ.4 shared files: (autodetected)

~~~~ {.r}
ogrListLayers(dsn = "data/gps-trace.gpx")  # which layers are available?
~~~~

    ## [1] "waypoints"    "routes"       "tracks"       "route_points"
    ## [5] "track_points"

~~~~ {.r}
shf2lds <- readOGR(dsn = "data/gps-trace.gpx", layer = "tracks")  # load track
~~~~

    ## OGR data source with driver: GPX 
    ## Source: "data/gps-trace.gpx", layer: "tracks"
    ## with 1 features and 12 fields
    ## Feature type: wkbMultiLineString with 2 dimensions

~~~~ {.r}
plot(shf2lds)
shf2lds.p <- readOGR(dsn = "data/gps-trace.gpx", layer = "track_points")  # load points
~~~~

    ## OGR data source with driver: GPX 
    ## Source: "data/gps-trace.gpx", layer: "track_points"
    ## with 6085 features and 26 fields
    ## Feature type: wkbPoint with 2 dimensions

~~~~ {.r}
points(shf2lds.p[seq(1, 3000, 100), ])
~~~~

![plot of chunk Leeds to Sheffield GPS
data](figure/Leeds_to_Sheffield_GPS_data.png)

There is a lot going on in the preceding 7 lines of code, including
functions that you are unlikely to have encountered before. Let us think
about what has happened, line-by-line.

First, we used R to *download* a file from the internet, using the
function `download.file`. The two essential arguments of this function
are `url` (we could have typed`url =` before the link) and `destfile`
(which means destination file). As with any function, more optional
arguments can be viewed by typing `?download.file`.

When `rgdal` has succesfully loaded, the next task is not to import the
file directly, but to find out which *layers* are available to import,
with the function `ogrListLayers`. The output from this command tells us
that various layers are available, including `tracks` and
`track_points`, which we subsequently load using `readOGR`. The basic
`plot` function is used to plot the newly imported objects, ensuring
they make sense. In the second `plot` function, we take a subset of the
object (see section ... for more on this).

As stated in the help documentation (accessed by entering `?readOGR`),
the `dsn =` argument is interpreted differently depending on the type of
file used. In the above example, the filename was the data source name.
To load Shapefiles, by contrast, the *folder* containing the data is
used:

~~~~ {.r}
lnd <- readOGR(dsn = "data/", "london_sport")
~~~~

Here, the data is assumed to reside in a folder entitled `data` which in
R's current working directory (remember to check this using `getwd()`).
If the files were stored in the working directory, one would use
`dsn = "."` instead. Again, it may be wise to plot the data that
results, to ensure that it has worked correctly. Now that the data has
been loaded into R's own `sp` format, try interogating and plotting it,
using functions such as `summary` and `plot`.

### The size of spatial datasets in R

Any data that has been read into R's *workspace*, which constitutes all
objects that can be accessed by name and can be listed using the `ls()`
function, can be saved in R's own data storage file type, `.RData`.
Spatial datasets can get quite large and this can cause problems on
computers by consuming all available random access memory (RAM) or hard
disk space available to the computer. It is therefore wise to understand
roughly how large spatial objects are; this will also provide insight
into how long certain functions will take to run.

In the absence of prior knowledge, which of the two objects loaded in
the previous section would be expected to take up more memory. One could
hypothesise that the London boroughs represented by the object `lnd`
would be larger, but how much larger? We could simply look at the size
of the associated files, but R also provides a function (`object.size`)
for discovering how large objects loaded into its workspace are:

~~~~ {.r}
object.size(shf2lds)
~~~~

    ## 107464 bytes

~~~~ {.r}
object.size(lnd)
~~~~

    ## 125544 bytes

Surprisingly, the GPS data is larger. To see why, we can find out how
many *vertices* (points connected by lines) are contained in each
dataset:

~~~~ {.r}
sapply(lnd@polygons, function(x) length(x))
~~~~

    ##  [1] 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1

~~~~ {.r}
x <- sapply(lnd@polygons, function(x) nrow(x@Polygons[[1]]@coords))
sum(x)
~~~~

    ## [1] 1102

~~~~ {.r}

sapply(shf2lds@lines, function(x) length(x))
~~~~

    ## [1] 1

~~~~ {.r}
sapply(shf2lds@lines, function(x) nrow(x@Lines[[1]]@coords))
~~~~

    ## [1] 6085

It is quite likely that the above code little sense at first; the
important thing to remember is that for each object we performed two
functions: 1) a check that each line or polygon consists only of a
single *part* (that can be joined to attribut data) and 2) the use of
`nrow` to count the number of vertices. The use of the `@` symbol should
seem strange - its meaning will become clear in the section !!!. (Note
also that the function `fortify`, discussed in section !!!, can also be
used to extract the vertice count of spatial objects in R.)

Without worrying, for now, about how these vertice counts were
performed, it is clear that the GPS data has almost 6 times the number
of vertices as does the London data, explaining its larger size. Yet
when plotted, the GPS data does not seem more detailed, implying that
some of the vertices in the object are not needed for visualisation at
the scale of the objects *bounding box*.

### Simplifying geometries

The wastefulness of the GPS data for visualisation (the full dataset may
be useful for other types of analysis) raises the question following
question: can the object be simplified such that its key features
features remain while substantially reducing its size? The answer is
yes. In the code below, we harness the power of the `rgeos` package and
its `gSimplify` function to simplify spatial R objects (the code can
also be used to simplify polygon geometries):

~~~~ {.r}
library(rgeos)
~~~~

    ## rgeos version: 0.3-2, (SVN revision 413M)
    ##  GEOS runtime version: 3.3.9-CAPI-1.7.9 
    ##  Polygon checking: TRUE

~~~~ {.r}
shf2lds.simple <- gSimplify(shf2lds, tol = 0.001)
(object.size(shf2lds.simple)/object.size(shf2lds))[1]
~~~~

    ## [1] 0.04608

~~~~ {.r}
plot(shf2lds.simple)
plot(shf2lds, col = "red", add = T)
~~~~

In the above block of code, `gSimplify` is given the object `shf2lds`
and the `tol` argument, short for "tolerance", is set at 0.001 (much
larger values may be needed, for data that use is *projected* - does not
use latitude and longitude). Comparison between the sizes of the
simplified object and the orginal shows that the new object is less than
3% of its original size. Try plotting the orginal and simplified tracks
on your computer: when visualised using the `plot` function, it becomes
clear that the object `shf2lds.simple` retains the overall shape of the
line and is virtually indistinguishable from the orginal object.

This example is rather contrived because even the larger object
`shf2lds` is only 0.107 Mb, negligible compared with the gigabytes of
RAM available to modern computers. However, it underlines a wider point:
for *visualisation* purposes at small spatial scales (i.e. covering a
large area of the Earth on a small map), the *geometries* associated
with spatial data can often be simplified to reduce processing time and
usage of RAM. The other advantage of simplification is that it reduces
the size occupied by spatial datasets when they are saved.

### Saving and exporting spatial objects

The structure of spatial data in R
----------------------------------

### Spatial\* data

#### Points

#### Lines

#### Polygons

#### Grids and raster data

### 'Flattening' data with `fortify`

The main spatial packages
-------------------------

### sp

### rgdal

### rgeos

Maps with ggplot2
-----------------

### Adding base maps with ggmap

Manipulating spatial data
-------------------------

### Coordinate reference systems and transformations

### Attribute joins

### Spatial joins

A spatial join, like attribute joins, is used to transfer information
from one dataset to another. There is a clearly defined direction to
spatial joins, with the *target layer* receiving information from
another spatial layer based on the proximity of elements from both
layers to each other. There are three broad types of spatial join:
one-to-one, many-to-one and one-to-many. We will focus only the former
two as the third type is rarely used.

One-to-one spatial joins are by far the easiest to understand and
compute because they simply involve the transfer of attributes in one
layer to another, based on location. A one-to-one join is depicted in
figure x below.

![plot of chunk Illustration of a one-to-one spatial
join](figure/Illustration_of_a_one-to-one_spatial_join_.png)

Many-to-one spatial joins involve taking a spatial layer with many
elements and allocating the attributes associated with these elements to
relatively few elements in the target spatial layer. A common type of
many-to-one spatial join is the allocation of data collected at many
point sources unevenly scattered over space to polygons representing
administrative boundaries, as represented in Fig. x.

~~~~ {.r}
lnd.stations <- readOGR("data/", "lnd-stns", p4s = "+init=epsg:27700")
~~~~

    ## OGR data source with driver: ESRI Shapefile 
    ## Source: "data/", layer: "lnd-stns"
    ## with 2532 features and 6 fields
    ## Feature type: wkbPoint with 2 dimensions

~~~~ {.r}
plot(lnd)
plot(lnd.stations[round(runif(n = 500, min = 1, max = nrow(lnd.stations))), 
    ], add = T)
~~~~

![plot of chunk Input data for a spatial
join](figure/Input_data_for_a_spatial_join.png)

The above code reads in a `SpatialPointsDataFrame` consisting of 2532
transport nodes in and surrounding London and then plots a random sample
of 500 of these over the previously loaded borough level adminsitrative
boundaries. The reason for ploting a sample of the points rather than
all of them is that the boundary data becomes difficult to see if all of
the points are ploted. It is also useful to see and practice sampling
techniques in practice; try to plot only the first 500 points, rather
than a random selection, and describe the difference.

The most obvious issue with the point data from the perspective of a
spatial join with the borough data is that many of the points in the
dataset are in fact located outside the region of interest. Thus, the
first stage in the analysis is to filter the point data such that only
those that lie within London's administrative zones are selected. This
in itself is a kind of spatial join, and can be accomplished with the
following code.

~~~~ {.r}
proj4string(lnd) <- proj4string(lnd.stations)
~~~~

    ## Warning: A new CRS was assigned to an object with an existing CRS:
    ## +proj=tmerc +lat_0=49 +lon_0=-2 +k=0.9996012717 +x_0=400000 +y_0=-100000 +ellps=airy +units=m +no_defs
    ## without reprojecting.
    ## For reprojection, use function spTransform in package rgdal

~~~~ {.r}
lnd.stations <- lnd.stations[lnd, ]  # select only points within lnd
plot(lnd.stations)  # check the result
~~~~

![plot of chunk A spatial subset of the
points](figure/A_spatial_subset_of_the_points.png)

The station points now clearly follow the form of the `lnd` shape,
indicating that the procedure worked. Let's review the code that allowed
this to happen: the first line ensured that the CRS associated with each
layer is *exactly* the same: this step should not be required in most
cases, but it is worth knowing about. Of course, if the coordinate
systems are *actually* different in each layer, the function
`spTransform` will be needed to make them compatible. This procedure is
discussed in section !!!. In this case, only the name was slightly
different hence direct alteration of the CRS name via the function
`proj4string`.

The second line of code is where the magic happens and the brilliance of
R's sp package becomes clear: all that was needed was to place another
spatial object in the row index of the points (`[lnd, ]`) and R
automatically understood that a subset based on location should be
produced. This line of code is an example of R's 'terseness' - only a
single line of code is needed to perform what is in fact quite a complex
operation.

Spatial aggregation
-------------------

Now that only stations which *intersect* with the `lnd` polygon have
been selected, the next stage is to extract information about the points
within each zone. This many-to-one spatial join is also known as
*spatial aggregation*. To do this there are a couple of approaches: one
using the `sp` package and the other using `rgeos` (see Bivand et al.
2013, 5.3).

As with the *spatial subest* method described above, the developers of R
have been very clever in their implementation of spatial aggregations
methods. To minimise typing and ensure consistency with R's base
functions, `sp` extends the capabilities of the `aggregate` function to
automatically detect whether the user is asking for a spatial or a
non-spatial aggregation (they are, in essence, the same thing - we
recommend learning about the non-spatial use of `aggregate` in R for
comparison).

Continuing with the example of station points in London polygons, let us
use the spatial extension of `aggregate` to count how many points are in
each borough:

~~~~ {.r}
lndStC <- aggregate(lnd.stations, by = lnd, FUN = length)
summary(lndStC)
plot(lndStC)
~~~~

As with the spatial subset function, the above code is extremely terse.
The aggregate function here does three things: 1) identifies which
stations are in which London borough; 2) uses this information to
perform a function on the output, in this case `length`, which simply
means "count" in this context; and 3) creates a new spatial object
equivalent to `lnd` but with updated attribute data to reflect the
results of the spatial aggregation. The results, with a legend and
colours added, are presented in Fig !!! below.

![Number of stations in London boroughs](figure/nStations.png)

As with any spatial attribute data stored as an `sp` object, we can look
at the attributes of the point data using the `@` symbol:

~~~~ {.r}
head(lnd.stations@data)
~~~~

    ##    CODE          LEGEND FILE_NAME NUMBER                   NAME MICE
    ## 91 5520 Railway Station  gb_south  17607        Belmont Station   19
    ## 92 5520 Railway Station  gb_south  17608  Woodmansterne Station    5
    ## 93 5520 Railway Station  gb_south  17609 Coulsdon South Station   11
    ## 94 5520 Railway Station  gb_south  17610        Smitham Station   14
    ## 95 5520 Railway Station  gb_south  17611         Kenley Station   11
    ## 96 5520 Railway Station  gb_south  17612        Reedham Station    8

In this case we have three potentially interesting variables: "LEGEND",
telling us what the point is, "NAME", and "MICE", which represents the
number of mice sightings reported by the public at that point (this is a
fictional variable). To illustrate the power of the `aggregate`
function, let us use it to find the average number of mices spotted in
transport points in each London borough, and the standard deviation:

~~~~ {.r}
lndAvMice <- aggregate(lnd.stations["MICE"], by = lnd, FUN = mean)
summary(lndAvMice)
lndSdMice <- aggregate(lnd.stations["MICE"], by = lnd, FUN = sd)
summary(lndSdMice)
~~~~

### Clipping

References
==========

Bivand, R., & Gebhardt, A. (2000). Implementing functions for spatial
statistical analysis using the language. Journal of Geographical
Systems, 2(3), 307–317.

Bivand, R. S., Pebesma, E. J., & Rubio, V. G. (2008). Applied spatial
data: analysis with R. Springer.

Burrough, P. A. & McDonnell, R. A. (1998). Principals of Geographic
Information Systems (revised edition). Clarendon Press, Oxford.

Goodchild, M. F. (2007). Citizens as sensors: the world of volunteered
geography. GeoJournal, 69(4), 211–221.

Harris, R. (2012). A Short Introduction to R.
[social-statistics.org](http://www.social-statistics.org/).

Kabacoff, R. (2011). R in Action. Manning Publications Co.

Krygier, J. Wood, D. 2011. Making Maps: A Visual Guide to Map Design for
GIS (2nd Ed.). New York: The Guildford Press.

Longley, P., Goodchild, M. F., Maguire, D. J., & Rhind, D. W. (2005).
Geographic information systems and science. John Wiley & Sons.

Ramsey, P., & Dubovsky, D. (2013). Geospatial Software's Open Future.
GeoInformatics, 16(4).

Sherman, G. (2008). Desktop GIS: Mapping the Planet with Open Source
Tools. Pragmatic Bookshelf.

Torfs and Brauer (2012). A (very) short Introduction to R. The
Comprehensive R Archive Network.

Venables, W. N., Smith, D. M., & Team, R. D. C. (2013). An introduction
to R. The Comprehensive R Archive Network (CRAN). Retrieved from
http://cran.ma.imperial.ac.uk/doc/manuals/r-devel/R-intro.pdf .

Wickham, H. (2009). ggplot2: elegant graphics for data analysis.
Springer.
