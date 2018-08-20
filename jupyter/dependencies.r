library(devtools)
if (file.exists(Sys.getenv("TAR")) == FALSE)  {
    Sys.setenv(TAR = "/bin/tar")
}
options(repos = c("https://cloud.r-project.org/"))

install.packages("Rcpp")
install.packages("ggplot2")
install.packages("bindr")
install.packages("modeltools")
install.packages("plogr")
install.packages("bindrcpp")
install.packages("flexmix")
install.packages("dplyr")
install.packages("fpc")
install.packages("dendextend")
install.packages("d3heatmap")
install.packages("plotly")
install.packages("reshape")

