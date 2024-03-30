library(cluster)
library(datasets)
data("mtcars")
# Select features (choose mpg and wt for this example)
features <- c("mpg", "wt")
X <- mtcars[, features]

# Define the number of clusters (experiment with different values)
numClusters <- 4

# Calculate pairwise distances using Manhattan distance
distances <- dist(X, method = "manhattan")

# Perform K-medoids clustering
kmedoids_model <- pam(distances, k = numClusters)

# Visualize the clusters
plot(X[, 1], X[, 2], col = kmedoids_model$clustering, pch = 19, 
     main = paste('K-medoids Clustering with', numClusters, 'Clusters'))
points(X[kmedoids_model$id.med, 1:2], col = 1:numClusters, pch = 'x', cex = 2)

# Optional: Add labels for medoids (cluster centers)
text(X[kmedoids_model$id.med, 1:2], paste("Medoid", 1:numClusters), col = 1:numClusters)