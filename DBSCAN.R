library(fpc)
library(cluster)
library(datasets)
data("mtcars")


# Select features for clustering
features <- c("mpg", "wt")  # Adjust features as needed
data_attributes <- mtcars[, features]

# Compute distance matrix
dist_matrix <- dist(data_attributes)

# Perform DBSCAN clustering
dbscan_result <- dbscan(data_attributes, eps = 0.3, MinPts = 5)  # Adjust eps and MinPts

# Visualize DBSCAN clusters on a scatter plot
plot(data_attributes, col = dbscan_result$cluster + 1, 
     main = "DBSCAN Clustering of mtcars Dataset",
     xlab = features[1], 
     ylab = features[2])
legend("topright", legend = unique(dbscan_result$cluster), col = unique(dbscan_result$cluster) + 1, pch = 1, title = "Cluster")
