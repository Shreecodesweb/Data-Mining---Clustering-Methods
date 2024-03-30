library(cluster)
library(datasets)
library(ggplot2)
data("mtcars")


# Select features for clustering
features <- c("mpg", "wt", "hp")  # Adjust features as needed
mtcars_subset <- mtcars[, features]

# Perform K-means clustering (acting as a substitute for BIRCH's initial centroids)
kmeans_model <- kmeans(mtcars_subset, centers = 3)  # Adjust number of clusters (k)

# Assign cluster labels
cluster_labels <- kmeans_model$cluster

# Create data frame with cluster memberships
mtcars_clusters <- cbind(mtcars_subset, Cluster = factor(cluster_labels))

# Visualize clusters using ggplot2
ggplot(mtcars_clusters, aes(x = mpg, y = wt, color = Cluster)) +
  geom_point() +
  labs(title = "K-means Clustering of mtcars Dataset (Simplified BIRCH)", x = "MPG", y = "Weight") +
  theme_minimal()