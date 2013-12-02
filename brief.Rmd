Brief (for authors only)
========================================================

This is the master document that will eventually be used to tie
all the sections together for the final book chapter.
"to do" lists, ideas and conventions can be written here, 
but it's main purpose is to provide an up-to-date structure on the final chapter.

The sections are preliminary; it is recommended that the sections are 
written as separate .Rmd files before merging them all into one master document
to reduce complexity and time taken to compile. 

6000 words – including figures, references and tables

We therefore need to include some introductory material. The key to fitting all this in will be to keep it applied – we can assume some prior knowledge of spatial data.

# Introduction

The rise of R in spatial data analysis 

(Analysis can include visualisation)

Include examples of where R has had an important visual impact.

Might be good to mention New York Times etc here as key users of R.

Chapter overview, including of example dataset used.

#Components of a Good Map

Krygier and Wood 2005's checklist

What makes for a good map and why R is a valuable tool for making them.

# R and Spatial Data

Basic R syntax
Key spatial packages and the roles they play- rgdal, sp, maptools(?)
Key visualisation packages: ggplot2 and ggmap. Base plots may also be worth a mention, I don’t want to go near lattice or anything like that.

How spatial data are stored and how their elements (attribute table, coordinates, bbox etc) can be accessed. 

Rasters vs Vectors

Common types of plot –choropleth, points, lines, basemaps.

Concept of layering.

Key parameters to consider- colour, transparency, line width, background.

Adornments: title, north arrow? Scale?

Exporting graphics for publication.

# A detailed worked example

# Conclusion

# Taking spatial analysis in R further

# References

Bivand, R. S., Pebesma, E. J., & Rubio, V. G. (2008). Applied spatial data: analysis with R. Springer.

Harris, R. (2012). A Short Introduction to R. 
[social-statistics.org](http://www.social-statistics.org/).

Kabacoff, R. (2011). R in Action. Manning Publications Co.

Ramsey, P., & Dubovsky, D. (2013). Geospatial Software's Open Future. 
GeoInformatics, 16(4). 

Torfs and Brauer (2012). A (very) short Introduction to R. The Comprehensive R Archive Network.

Wickham, H. (2009). ggplot2: elegant graphics for data analysis. Springer.
