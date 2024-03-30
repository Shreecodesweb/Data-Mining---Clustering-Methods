library(cluster)
library(tidyverse)
library(factoextra)
library(datasets)
data("mtcars")
library(ggplot2)

# Select features for clustering
features <- c("mpg", "wt", "hp", "disp")  # Adjust features as needed
mtcars_numeric <- mtcars %>% select(features)

# Determine optimal number of clusters using silhouette method
optimal_clusters <- fviz_nbclust(mtcars_numeric, FUNcluster = clara, method = "silhouette")
print(optimal_clusters)

# Perform CLARA clustering (adjust k based on optimal clusters)
clara_res <- clara(mtcars_numeric, k = 3, metric = "euclidean", stand = TRUE, correct.d = FALSE)
print(clara_res)

# Combine clustering results with original data
mtcars_clustered <- cbind(mtcars_numeric, cluster = clara_res$clustering)

# Visualize the clusters
fviz_cluster(clara_res, data = mtcars_numeric)