# EM-algorithm - Academic project

An academic research and implementation of the expectation–maximization algorithm, with PYTHON and R.

To start off, clone the project: 
```shell
git clone https://github.com/Samashi47/EM-algorithm.git
```

Then:
```shell
cd EM-algorithm
```

# R implementation

> [!NOTE]
>
> Here we suppose that R is fully installed and configured on your computer.
>
> R-markdownn doesn't require any further configuration to run on Rstudio or VSCode, but for a more rich experience on VSCode (live preview, generate HTML, LaTeX and pdf files) you need a TeX distribution, and pandoc on your computer. You can install pandoc from https://pandoc.org/installing.html

To start with the R implementation, you should install the required packages first, go to the R console, then: 
```R
install.packages(c("base", "methods", "datasets", "utils", "grDevices", "graphics", "stats", "plyr", "mvtnorm", "ggplot2"))
```
Then you are ready to run the implementations in the .rmd files chunk by chunk.

# References

Martin Haugh. The EM Algorithm. Published 2015. https://www.columbia.edu/~mh2078/MachineLearningORFE/EM_Algorithm.pdf

Henrik Hult. Lecture 8. https://www.math.kth.se/matstat/gru/Statistical%20inference/Lecture8.pdf

Sean Borman. The Expectation Maximization Algorithm, A short tutorial. Published July 18, 2004. https://www.lri.fr/~sebag/COURS/EM_algorithm.pdf

Tengyu Ma. and Andrew Ng. CS229 Lecture notes. Published May 13, 2019. https://cs229.stanford.edu/notes2020spring/cs229-notes8.pdf

Keng B. The Expectation-Maximization Algorithm. Bounded Rationality. Published October 7, 2016. https://bjlkeng.io/posts/the-expectation-maximization-algorithm/