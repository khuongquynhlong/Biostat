rm(list=ls())

### HISTOGRAM

# DISTRIBUSI NORMAL
set.seed(10^6)

x = rnorm(1000, 0, 1)
par(mfrow = c(2, 2))

for (i in c(4, 10, 30, 50)) {
  tot_bins = i
  hist(x, breaks = seq(min(x), max(x), l = tot_bins + 1),
       freq = FALSE, col = "orange",
       main = paste0("n bins = ", i), xlab = "x", ylab = "f(x)", yaxs = "i", xaxs = "i",
       ylim = c(0, 0.5))
  curve(dnorm(x, mean = 0, sd = 1), add = TRUE, col = "blue", lwd = 2)
  curve(dnorm(x, mean = mean(x), sd = sd(x)), add = TRUE, col = "brown",
        lwd = 2, lty = 2)
}

par(mfrow = c(1, 1))


# ukuran sampel meningkat
set.seed(10^6)
par(mfrow = c(2,2))

n <- c(10, 100, 1000, 10000)
for (i in n) {
  x = rnorm(i, 0, 1)
  hist(x, breaks = seq(min(x),max(x), l = tot_bins + 1), 
       freq = FALSE, col = "orange",
       main = paste0("Sample size = ", i), xlab = "x", ylab = "f(x)", yaxs = "i", xaxs = "i", 
       ylim = c(0,0.5))
  curve(dnorm(x, mean = 0, sd = 1), add = TRUE, col = "blue", lwd = 2)
  curve(dnorm(x, mean = mean(x), sd = sd(x)), add = TRUE, col = "brown", lwd = 2, lty = 2)
}

#####################
## PLOT DENSITAS 
#####################
### sample 50
rm(list = ls())
set.seed(10^6)

funct <- c("gaussian", "epanechnikov", "rectangular", "biweight")
par(mfrow = c(2,4))


n <- c(50, 1000)

for (j in n) {
  x <- rnorm(j, 0, 1)
  for (i in funct) {
    fx = density(x, kernel = i)
    plot(fx, col = "red", lwd = 2, ylim = c(0,1), 
         main = paste0("n: ", j, "| function: ", i))
    curve(dnorm(x, mean = 0, sd = 1), add = TRUE, col = "blue", lwd = 2)
  }
}


##EXPONENTIAL DISTRIBUTION

rm(list = ls())
set.seed(10^6)

funct <- c("gaussian", "epanechnikov", "rectangular", "biweight")
par(mfrow = c(2, 4))


n <- c(50, 1000)

for (j in n) {
  x <- rexp(j)
  for (i in funct) {
    fx = density(x, kernel = i)
    plot(fx, col = "red", lwd = 2, ylim=c(0,1),
         main = paste0("n: ", j, "| function: ", i))
    curve(dexp(x), add=TRUE, col = "blue", lwd=2)
  }
}


