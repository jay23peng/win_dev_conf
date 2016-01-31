@ECHO OFF
pandoc -f markdown -t html -s --mathjax --highlight-style pygments %*
