Introduction
============

What is R?
----------

R is a free and open source computer program that runs on all major
operating systems. R relies primarily on the *command line* for data
input: instead of interacting with the program by moving your mouse
around clicking on different parts of the screen, users enter commands
via the keyboard. This will seem to strange to people accustomed to
relying on a graphical user interface (GUI) for most of their computing, yet the
approach has a number of benefits, as highlighted by Gary Sherman (2008,
p. 283), developer of the popular Geographical Informations System QGIS:

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
of extensions to its capabilities. There
are now more than 4000 official packages for R, allowing it to tackle
almost any computational or numerical problem one could imagine.

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


Why R for spatial data visualisation?
-------------------------------------

Aside from confusion surrounding its one character name [1] and 
uncertainty about how to search for help [2],
R may also seem a strange choice for a chapter on
*spatial* data visualisation specifically. "I thought R was just for
statistics?" and "Why not use a proper GIS package like ArcGIS?" are valid
questions.

R was conceived - and is
still primarily known - for its capabilities as a "statistical programming language" (Bivand
and Gebhardt 2000). 
Statistical analysis functions remain core to the package but there is a
broadening of functionality to reflect a growing user base across disciplines.
R has become "an integrated suite of software facilities for data manipulation,
calculation and graphical display" (Venables et al. 2013). 
Spatial data analysis and visualisation is an important growth area within this 
increased functionality to the extent that R can almost entirely replace major 
GIS packages for a whole host of spatial analysis workflows. 
That said, it will never be a complete replacement for those seeking a user interface 
that enables panning and zooming, or for those seeking to manually digitise spatial data. 
We therefore suggest using R *in addition to* GIS packages where required.
In fact, R's spatial capabilities have already been integrated in conventional GIS packages
ArcGIS (via its R [toolbox](http://www.arcgis.com/home/item.html?id=a5736544d97a4544aa47d06baf910f6d)
and the [Geospatial Modelling Environment](http://www.spatialecology.com/gme/)) and QGIS
(via the [*Processing* framework](http://qgis.org/en/docs/user_manual/processing/3rdParty.html)).

### R and conventional GIS programs

There are a few major differences between R and
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

### R and reproducible research

Finally, there is a drive towards transparency in data and methods datasets in academic publishing. 
R encourages truly transparent and reproducible research by enabling anyone with an 
R installation reproduce results described in previous paper. 
This process is eased by the RStudio integrated development environment (IDE) 
that allows 'live' R code and results to be embedded in documents. 
In fact, this tutorial was written in RStudio and can be recompiled on 
any computer by downloading the project's GitHub repository.

## Getting started with the tutorial

The first stage with this tutorial is to download the data from GitHub, 
where an updated version is stored: [github.com/geocomPP/sdvwR](https://github.com/geocomPP/sdvwR). 
Click on the "Download ZIP" button on the right, and unpack the folder to a sensible place
on your computer (e.g. the Desktop). Explore the folder and try opening some of the files, 
especially those from the sub-folder entitled "data": these are the input datasets we'll be using.

Now open up a version of RStudio on your own computer (or on-line) and we are ready to go.




