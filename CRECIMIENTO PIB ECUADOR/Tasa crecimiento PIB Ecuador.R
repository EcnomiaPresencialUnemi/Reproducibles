# Instalar las librerías necesarias
install.packages("ggplot2") # para realizar el grafico
install.packages("readr") # para cargar la data en formato csv

# Cargar las librerías necesarias
library(ggplot2)
library(readr)

# Cargar los datos desde el archivo data-fy7Vp.csv
read_csv("ruta/al/archivo/data-fy7Vp.csv")

# pasar el archivo original a un objeto llamado datos_pib
datos_pib <- data_fy7Vp

# Renombrar las columnas del dataframe datos_pib
colnames(datos_pib) <- c("Años", "Tasa de Crecimiento")

# Convertir Tasa de Crecimiento a numérico, eliminando el signo de porcentaje
datos_pib$`Tasa de Crecimiento` <- as.numeric(sub("%", "", datos_pib$`Tasa de Crecimiento`))

# Generar el gráfico de líneas
ggplot(datos_pib) +
  aes(x = Años, y = `Tasa de Crecimiento`) +
  geom_line(colour = "#112446") +
  labs(
    x = "Años",
    y = "Tasas de crecimiento",
    title = "Ecuador",
    subtitle = "Tasas de crecimiento del PIB",
    caption = "Fuente: BCE; Elaboración: GRINVEC-UNEMI"
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(size = 20, face = "bold", hjust = 0.5),
    plot.subtitle = element_text(size = 16, face = "bold", hjust = 0.5),
    plot.caption = element_text(size = 14, face = "bold.italic"),
    axis.title.y = element_text(size = 12, face = "bold"),
    axis.title.x = element_text(size = 12, face = "bold")
  ) +
  scale_x_continuous(breaks = seq(2014, 2024, by = 1))  # Añadir marcas para cada año
