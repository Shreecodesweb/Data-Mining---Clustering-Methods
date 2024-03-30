library(cluster)
library(datasets)
data("mtcars")


# Select features for clustering
features <- c("mpg", "wt", "hp")  # Adjust features as needed
data_subset <- mtcars[, features]

# Calculate distance matrix
dist_matrix <- dist(data_subset)

# Perform hierarchical clustering with Ward linkage
hc_model <- hclust(dist_matrix, method = "ward.D2")

# Plot the dendrogram
plot(hc_model, main = "Hierarchical Clustering Dendrogram for mtcars Dataset", xlab = "Sample Data Points")

