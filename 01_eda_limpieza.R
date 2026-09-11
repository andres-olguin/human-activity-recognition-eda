# 1. Comprobación formal de valores nulos (NA)
total_na <- sum(is.na(x_train))
cat("Total de valores NA en el conjunto:", total_na, "\n")

# 2. Balanceo de clases (distribución de las 6 actividades)
tabla_actividades <- table(x_train$Actividad)
porcentajes <- prop.table(tabla_actividades) * 100
cbind(Frecuencia = tabla_actividades, Porcentaje = round(porcentajes, 2))

# 3. Comprobación de rangos y normalización de las variables sensoriales
# En este dataset, los autores normalizaron las señales en el intervalo [-1, 1]
min_val <- min(x_train[, 1:561])
max_val <- max(x_train[, 1:561])
cat("Rango de las características de sensores: [", min_val, ",", max_val, "]\n")

# ==========================================
# 4. REDUCCIÓN DE DIMENSIONALIDAD (PCA)
# ==========================================

# Ejecutar PCA sobre las 561 variables cuantitativas (columnas 1 a 561)
# Se utiliza scale. = TRUE para estandarizar la varianza unitaria
pca_model <- prcomp(x_train[, 1:561], center = TRUE, scale. = TRUE)

# Calcular la proporción de varianza explicada
var_explicada <- pca_model$sdev^2
prop_varianza <- var_explicada / sum(var_explicada)
prop_acumulada <- cumsum(prop_varianza)

# ¿Cuántos componentes explican el 80% y el 90% de la variabilidad?
comp_80 <- which(prop_acumulada >= 0.80)[1]
comp_90 <- which(prop_acumulada >= 0.90)[1]

cat("Componentes necesarios para el 80% de varianza:", comp_80, "de 561\n")
cat("Componentes necesarios para el 90% de varianza:", comp_90, "de 561\n")

# Gráfico de Varianza Acumulada (Scree Plot / Regla del Codo)
plot(prop_acumulada[1:100], type = "b", pch = 19, col = "darkblue",
     xlab = "Número de Componentes Principales",
     ylab = "Proporción de Varianza Acumulada",
     main = "Varianza Acumulada por Componentes Principales (Primeros 100)")
abline(h = 0.80, col = "red", lty = 2, lwd = 2) # Línea umbral 80%
abline(h = 0.90, col = "darkgreen", lty = 2, lwd = 2) # Línea umbral 90%
legend("bottomright", legend = c("80% Varianza", "90% Varianza"),
       col = c("red", "darkgreen"), lty = 2, lwd = 2)


# ==========================================
# 5. VISUALIZACIÓN BIDIMENSIONAL (PC1 vs PC2)
# ==========================================

# Extraer las dos primeras componentes en un dataframe
pca_df <- data.frame(
  PC1 = pca_model$x[, 1],
  PC2 = pca_model$x[, 2],
  Actividad = x_train$Actividad
)

# Paleta de colores para las 6 actividades
colores <- c("red", "blue", "darkgreen", "orange", "purple", "brown")

# Graficar la proyección
plot(pca_df$PC1, pca_df$PC2, 
     col = colores[pca_df$Actividad],
     pch = 19, 
     cex = 0.5,
     xlab = paste0("PC1 (", round(prop_varianza[1] * 100, 1), "% varianza)"),
     ylab = paste0("PC2 (", round(prop_varianza[2] * 100, 1), "% varianza)"),
     main = "Separación de Actividades en el Espacio PCA (PC1 vs PC2)")

# Agregar leyenda de actividades
legend("topleft", 
       legend = levels(pca_df$Actividad), 
       col = colores, 
       pch = 19, 
       cex = 0.75, 
       bty = "n")