# Compiling the chapter
# The following can be used to compile the chapter into a single document:

system("pandoc -f markdown -t markdown S*.md > chapter.md")
mess <- paste('pandoc -f markdown -t latex -s -o', "chapter.tex",
              "chapter.md")
system(mess) # create latex file

mess <- paste("sed -i -e 's/plot of.chunk.//g' chapter.tex")
system(mess) # replace "plot of chunk " text with nowt

mess <- paste("sed -i -e 's/width=\\\\maxwidth/width=10cm/g' chapter.tex")
system(mess) # reduce plot size

# mess <- paste("sed -i -e 's/\\\\section{References}/\\\\newpage \\\\section{References}/g' chapter.tex")
# system(mess) # Put refs on new page

mess <- "sed -i -e '71i\\\\\\maketitle' chapter.tex"
system(mess) # make title, after \begin{document}

mess <- "sed -i -e '68i\\\\\\usepackage[margin=1.8cm]{geometry}' chapter.tex"
system(mess) # shrink margins

idx <- 69
# open the file and read in all the lines
conn <- file("chapter.tex")
text <- readLines(conn)
block <- "\\author{
Cheshire, James\\\\
\\texttt{james.cheshire@ucl.ac.uk}
\\and
Lovelace, Robin\\\\
\\texttt{r.lovelace@leeds.ac.uk}
}
\\title{Manipulating and visualizing spatial data with R}"
text_block <- unlist(strsplit(block, split='\n'))
# concatenate the old file with the new text
mytext <- c(text[1:idx],text_block,text[(idx+1):length(text)])
writeLines(mytext, conn, sep="\n")
close(conn)