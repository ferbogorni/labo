# Definir los datos
x <- c(29.73946, 26.55952, 33.96938, 36.48934, 30.46945)
y <- c(41.98924, 43.8092, 43.43921, 43.9492, 43.7392)

# Realizar el test de Wilcoxon
wilcox.test(x, y, paired=TRUE)
