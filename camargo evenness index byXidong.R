# 读取CSV或txt文件
data <- read.csv("your_file.csv", header = TRUE)  # 或使用 read.table

# 定义 Camargo 均匀度计算函数
camargo <- function(abundances) {
  n <- sum(abundances)  # 总丰度
  if (n == 0) return(NA)  # 避免除以 0
  evenness <- 1 - sum(outer(abundances, abundances, function(x, y) abs(x - y))) / (2 * n^2)
  return(evenness)
}

# 计算每个样本的均匀度指数
evenness_values <- apply(data[, -1], 1, camargo)  # 忽略第一列（样本名）

# 输出每个样本的均匀度
print(evenness_values)
