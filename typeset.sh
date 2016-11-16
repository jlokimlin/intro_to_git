#!/bin/bash
#
# Build script for TeX source

# Variables
src='main'
output='intro_to_git.pdf'

# Build source files thrice
for run in {1..3}; do
    pdflatex $src.tex
done

# Remove associated files
rm *.aux *.log *.nav *.out *.snm *.toc *.vrb

# Rename file
mv $src.pdf $output

# Open file using default document reader
if [ "$(uname)" == "Darwin" ]; then
    # macOS platform
    open $output
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    # GNU/Linux platform
    if which xdg-open &> /dev/null; then
	xdg-open $output
    fi
elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]; then
    # Windows NT platform
    :
fi
