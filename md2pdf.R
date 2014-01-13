# Compiling the chapter
# This code compiles the .md files into a single document:

system("pandoc -f markdown -t markdown S*.md > sdv-tutorial.md")
mess <- paste('pandoc -f markdown -t latex -s -o', "sdv-tutorial.tex",
              "sdv-tutorial.md")
system(mess) # create latex file

mess <- paste("sed -i -e 's/plot of.chunk.//g' sdv-tutorial.tex")
system(mess) # replace "plot of chunk " text with nowt

mess <- paste("sed -i -e 's/width=\\\\maxwidth/width=10cm/g' sdv-tutorial.tex")
system(mess) # reduce plot size

# mess <- paste("sed -i -e 's/\\\\section{References}/\\\\newpage \\\\section{References}/g' sdv-tutorial.tex")
# system(mess) # Put refs on new page

mess <- "sed -i -e '71i\\\\\\maketitle' sdv-tutorial.tex"
system(mess) # make title, after \begin{document}

mess <- "sed -i -e '68i\\\\\\usepackage[margin=1.8cm]{geometry}' sdv-tutorial.tex"
system(mess) # shrink margins

idx <- 69
# open the file and read in all the lines
conn <- file("sdv-tutorial.tex")
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