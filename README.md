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

**Use**

To use the implementation, first you got to initiate starting values for the mean, cov, and probabilities.

1. The mean is a matrix, of dimensions (nbr of wanted clusters, nbr of used columns to generate clusters), of means of every column, for the number of wanted clusters.
2. The cov is a tensor, of dimensions (nbr of used columns to generate clusters, nbr of used columns to generate clusters, nbr of wanted clusters), of covariance between the datasets columns, for the number of wanted clusters.
3. The probs is a list, of dimensions (nbr of wanted clusters), of probabilities that a given data point belongs to a cluster.

To do that in code, we first generate a list of means for each column, and a covariance matrix between columns:
```R
library(plyr)

# Create starting values
Mu = daply(iris2, NULL, function(x) colMeans(x)) + runif(4, 0, 0.5)
Cov = dlply(iris2, NULL, function(x) var(x) + diag(runif(4, 0, 0.5)))
```

```R
column.names <- colnames(iris2)
row.names <- c("Cluster 1", "Cluster 2", "Cluster 3")
```

Then we create a 2D array of means for the number of wanted clusters with a noise to not have indentical rows, and a tensor of covariance matrices for the number of wanted clusters:
```R
initMu = array(c(Mu[1] + 0.1, Mu[1] + 0.2, Mu[1] + 0.3, Mu[2] + 0.1, Mu[2] + 0.2, Mu[2] + 0.3, Mu[3] + 0.1, Mu[3] + 0.2, Mu[3] + 0.3, Mu[4] + 0.1, Mu[4] + 0.2, Mu[4] + 0.4) , dim = c(3, 4),dimnames = list(row.names,column.names))
initCov <- list('Cluster 1' = Cov[[1]], 'Cluster 2' = Cov[[1]], 'Cluster 3' = Cov[[1]])
```

For probabilities, we can initiate them manually:
```R
initProbs = c(.1, .2, .7)
```

Or, randomly:
```R
initProbs = sort(runif(3, min=0.1, max=0.9))
```

Finally, we encapsulate the initiated params in a variable called `initParams`:
```R
initParams <- list(mu = initMu, var = initCov, probs = initProbs)
```

And run the algorithm with:
```R
results = gaussmixEM(params=initParams, X=as.matrix(MallCustomers), clusters = 4, tol=1e-10, maxits=1500, showits=T)
print(results)
```

# References

Martin Haugh. The EM Algorithm. Published 2015. https://www.columbia.edu/~mh2078/MachineLearningORFE/EM_Algorithm.pdf

Henrik Hult. Lecture 8. https://www.math.kth.se/matstat/gru/Statistical%20inference/Lecture8.pdf

Sean Borman. The Expectation Maximization Algorithm, A short tutorial. Published July 18, 2004. https://www.lri.fr/~sebag/COURS/EM_algorithm.pdf

Tengyu Ma. and Andrew Ng. CS229 Lecture notes. Published May 13, 2019. https://cs229.stanford.edu/notes2020spring/cs229-notes8.pdf

Keng B. The Expectation-Maximization Algorithm. Bounded Rationality. Published October 7, 2016. https://bjlkeng.io/posts/the-expectation-maximization-algorithm/