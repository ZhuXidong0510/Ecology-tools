# Read CSV or txt files
data <- read.csv("your_file.csv", header = TRUE)  # or use read.table

# Define the Camargo's evenness calculation function
camargo <- function(abundances) {
  n <- sum(abundances)  # Total abundance
  if (n == 0) return(NA)  # Avoid division by 0
  evenness <- 1 - sum(outer(abundances, abundances, function(x, y) abs(x - y))) / (2 * n^2)
  return(evenness)
}

# Calculate the evenness index for each sample
evenness_values <- apply(data[, -1], 1, camargo)  # Ignore the first column (sample names)

# Output the evenness of each sample.
print(evenness_values)
# You have successfully calculated the Camargo's evenness index, excellent work!