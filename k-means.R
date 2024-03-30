library(datasets)
data("mtcars")
str(mtcars)
mtcars$hpcyl <- mtcars$hp/mtcars$cyl


# Load libraries (not necessary if kmeans is already attached)
# library(stats)

# Load mtcars data set
data(mtcars)

# Select features (choose mpg and wt for this example)
features <- c("mpg", "wt")
X <- mtcars[, features]

# Define the number of clusters (experiment with different values)
numClusters <- 4

# Perform K-means clustering
kmeans_model <- kmeans(X, centers = numClusters)

# Visualize the clusters
plot(X[, 1], X[, 2], col = kmeans_model$cluster, pch = 19, 
     main = paste('K-means Clustering with', numClusters, 'Clusters'))
points(kmeans_model$centers[, 1:2], col = 1:numClusters, pch = 'x', cex = 2)

# Optional: Add labels for cluster centers
text(kmeans_model$centers[, 1:2], paste("Cluster", 1:numClusters), col = 1:numClusters)
