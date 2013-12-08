Introduction
========================================================

## What is R?

R is a free and open source computer program that runs on 
all major operating systems. R relies primarily 
on the *command line* for data input: instead of 
interacting with the program by
moving your mouse around clicking on different parts of the screen, users
enter commands via the keyboard. This will seem to strange to people 
accustomed to relying on a graphical user interface (GUI) for most of their 
computing, e.g. via popular programs such as Microsoft Excel or SPSS, 
yet the approach has a number of benefits, as highlighted by Gary Sherman
(2008, p. 283), developer of the popular GIS program QGIS:

> With the advent of
“modern” GIS software, most people want to point and click their way
through life. That’s good, but there is a tremendous amount of flexibil-
ity and power waiting for you with the command line. Many times you
can do something on the command line in a fraction of the time you can
do it with a GUI.

The joy of this, when you get used to it, is that any
command is only ever a few keystrokes
away, and the order of the commands sent to R can be stored and repeated in 
scripts, saving even more time in the long-term (more on this in section ...).

Another important attribute of R, related to its command line interface, 
is that it is a fully fledged *programming language*. Other 
GIS programs are written in lower level languages such as C++ but 
the never needs to know this and can be kept at a safe distance from 
the internal workings of the program by the user interface. In R, by contrast, 
the user is 'close to the metal' in the sense that what he or she inputs 
is the same as what R sees when it processes the request. This 'openness' 
can seem raw and daunting to beginners, but it is vital to R's success. 
Access to R's source code and openness about how it works has enabled 
a veritable army of programmers to improve R over time and add 
an incredible number of extensions to its base capabilities. 
Consider for a moment that there are now more than 4000 official packages
for R, allowing it to tackle almost any computational or numerical problem one could image, 
and many more that one could not!

Although writing R source code and creating new packages will not
appeal to most R users, it inspires confidence to know that there is 
a strong and highly skilled community of R developers. If there is a 
useful spatial function that R cannot currently perform, there 
is a reasonable chance that someone is working on a solution that will become 
available at a later date. This constant evolution and improvement is 
a feature of open source software projects not limited to R, but the 
range and diversity of extensions is certainly one of its strong points. 
One area where extension of R's basic capabilities has been particularly 
successful is the addition of a wide variety of spatial tools. 

## The rise of R's spatial capabilities

!!! Quick history of R's spatial packages emphasizing current growth and heavy dependence on sp.

Mention exciting and recently added packages.

## Why R for spatial data visualisation?

Aside from confusion surrounding its one character name - "what kind of a name is R?" [1] and 
"how can you possibly find resources for R online?" [2] -
R may also seem a strange choice for a chapter on *spatial* data visualisation specifically.
"I thought R was just for statistics?" and "Why not use a proper GIS package 
like QGIS?" are valid questions.

The first question arises because R was traditionally
conceived - and is still primarily known - as a
"statistical programming language" (Bivand and Gebhardt 2000). Although R does have cutting 
edge statistical capabilities, this definition does not do justice to its power and 
flexibility. 
Thus, a more accurate albeit longer definition of R
is "an integrated suite of software facilities for data manipulation, calculation and graphical
display" (Venables et al. 2013). It is important to consider this 
wider definition before diving into R: it is a fully fledged programming language
meaning that it is highly extensible but also that the same result can 
often be generated in different ways. This can be confusing. 

The second question is based on the premise that all 'proper' Geographic Information Systems
need to operate in the same way, with primacy allocated to a mapping window and a 
mouse-driven GUI interface. But when we look back at the history of GIS and its definitions, 
it becomes clear that R *is* fully fledged GIS, when it is set up correctly. 
All early GIS programs used a command-line interface; GUIs were only developed 
later as a way to run commands without needing to remember all the command names
(although this is largely overcome by good 'help' options and auto-completion).
A concise definition of a GIS is "a computerized tool for solving
geographic problems" (Longley et al. 2005, p. 16) and R certainly enables this. 
A more expansive definition of GIS is "a powerful set of tools
for collecting, storing, retrieving at will, transforming, and displaying spatial
data from the real world for a particular set of purposes" (Burrough and McDonnell, 1998, 
from Bivand et al. 2013, p. 5); R excels at each of these tasks.

That being said, there are a few major differences between R and conventional GIS programs
in terms of spatial data visualisation:
R is more suited to creating one-off graphics than exploring spatial data through 
repeated zooming, panning and spatial sub-setting using custom-drawn polygons, 
compared with conventional GIS programs. Although interactive maps in R can 
be created (e.g. using the web interface `shiny`), it is recommended that R
is used *in addition to* rather than as a direct replacement of dedicated GIS
programs, especially now that there are myriad free options to try (Sherman 2008).
An additional point is that while dedicated GIS programs handle spatial data by 
default and display the results in a single way, there are various options in R
that must be decided by the user, for example whether to use R's base graphics 
or a dedicated graphics package such as ggplot2. On the other hand, the main 
benefits of R for spatial data visualisation lie in the *reproducibility* of 
its outputs, a feature that we will be using to great effect in this chapter.

## R for Reproducible research

!!! Are all the examples going to be reproducible?

All these components - scripting, stability and the ability to 
embed 'live' code in documents - make R an excellent tool for 
transparent research. By using R and carefully documenting what has been done, 
one ensures that the methods used to reach a certain result can be reproduced 
by anyone anywhere in the world, provided they have access to the input dataset.
The RStudio graphical interface with R encourages good documentation.
RStudio enables presentations to be created and professional-quality 
pdf documents to be produced using the custom file formats `.Rpres` and `.rnw`.
In fact, this chapter was written in RMarkdown and 
converted into a pdf document using only RStudio editor!

## R in the wild

Examples of where R has had an important visual impact.

Might be good to mention New York Times etc here as key users of R.

## An introductory session

The best way to learn to use a new tool is by using it. 
The metaphor of craft skills is appropriate here: if you wanted to 
become skilled at scything, for example, you would not spend 
your time reading about scythes. The same is true of R: the best 
way to learn how it works is to 'get your hands dirty' and try it 
out on your own computer. This introductory session will therefore serve 
as an introduction to R's unque *syntax*, as well an illustration of 
how other visualisations presented in this chapter can be reproduced. 

## Chapter overview

including of example dataset used.

## Endnotes

1. R's name originates from the creators of R, Ross Ihaka and Robert Gentleman.
R is an open source implementation of the statistical programming language S, 
so its name is also a play on words that makes implicit reference to this.

2. R is notoriously difficult to search for on major search 
engines, as it is such a common letter with many other uses beyond the name
of a statistical programming language. This should not be a deterrent, as 
R has a wealth of excellent online resources. To overcome the issue, 
you can either be more specific with the search term (e.g. "R spatial statistics")
or use an R specific search engine such as [rseek.org](http://www.rseek.org/).
You can also search of online help *from within R* using the command `RSiteSearch`.
E.g. `RSiteSearch("spatial statistics")`. Experiment and see which you prefer!
