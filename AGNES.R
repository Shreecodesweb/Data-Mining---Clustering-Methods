install.packages("cluster")
library(cluster)
library(factoextra) 
install.packages("tidyverse")

library(tidyverse)
library(datasets)
library(ggplot2)
data("mtcars")

# Select features for clustering
features <- c("mpg", "wt", "hp")  # Adjust features as needed

# Calculate distance matrix (Euclidean distance)
distance_matrix <- dist(mtcars[, features])

# Perform AGNES clustering with Single Linkage
agnes_model <- agnes(distance_matrix, method = "single")  # Specify linkage method

# Explore model structure (optional)
str(agnes_model)  # View details of the hierarchical clustering model

# Cut the dendrogram for specific number of clusters (optional)
k <- 3  # Adjust k for desired number of clusters
cluster_labels <- cutree(agnes_model, k = k)

# Combine data with cluster labels (optional)
mtcars_clustered <- cbind(mtcars_subset, Cluster = factor(cluster_labels))

# Visualize clusters (optional)
ggplot(mtcars_clustered, aes(x = mpg, y = wt, color = Cluster)) +
  geom_point() +
  labs(title = "AGNES Clustering (Single Linkage) on mtcars") +
  theme_minimal()