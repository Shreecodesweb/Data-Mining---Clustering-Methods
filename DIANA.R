library(cluster)
library(datasets)
data("mtcars")

install.packages("FactoMineR")
library("FactoMineR")
install.packages("devtools")
library("devtools")
install_github("kassambara/factoextra")
install.packages("factoextra")
library(factoextra)


# Select features for clustering
features <- c("mpg", "wt", "hp")  # Adjust features as needed
X_mtcars <- mtcars[, features]

# Perform DIANA clustering
diana_model_mtcars <- diana(X_mtcars)

# Plot dendrogram
fviz_dend(as.dendrogram(diana_model_mtcars))

# Optional: Get cluster assignments for a specific number of clusters
k <- 3  # Adjust the desired number of clusters
cluster_assignments <- cutree(diana_model_mtcars, k = k)
table(cluster_assignments)