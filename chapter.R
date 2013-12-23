# Compiling the book
# The following can be used to compile the book into a single document:

```{r}
system("pandoc -f markdown -t markdown introduction.md basic_carto.md R+sd.md refs.md >  chapter.md")
mess <- paste('pandoc -f markdown -t latex -s -o', "chapter.tex", 
              "chapter.md")
system(mess) # create latex file

mess <- paste("sed -i -e 's/plot of.chunk.//g' chapter.tex")
system(mess) # replace "plot of chunk " text with nowth
```