# Compiling the chapter
# The following can be used to compile the chapter into a single document:

system("pandoc -f markdown -t markdown S*.md >  chapter.md")
mess <- paste('pandoc -f markdown -t latex -s -o', "chapter.tex", 
              "chapter.md")
system(mess) # create latex file

mess <- paste("sed -i -e 's/plot of.chunk.//g' chapter.tex")
system(mess) # replace "plot of chunk " text with nowth