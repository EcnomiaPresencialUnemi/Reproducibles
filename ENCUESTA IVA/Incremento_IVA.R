install.packages("ggplot2")
install.packages("dplyr")


library(ggplot2)
library(dplyr)

datos <- Encuesta_Economia_Incremento_IVA

# Calcular el porcentaje de respuestas por alternativa
datos <- datos %>%
  mutate(Porcentaje = Respuestas / sum(Respuestas) * 100)

# Ordenar los datos por Porcentaje de forma descendente para el gráfico
datos <- datos[order(-datos$Porcentaje),]

# Creando el gráfico
ggplot(datos, aes(x = reorder(Alternativas, -Porcentaje), y = Porcentaje, fill = Alternativas)) +
  geom_bar(stat = "identity") +
  geom_text(aes(label = paste0(round(Porcentaje, 1), "%")), position = position_dodge(width = 0.9), vjust = -0.25) +
  theme_minimal() +
  labs(title = "Resultados encuesta Incremento del IVA",
       subtitle = "",
       x = "", y = "Porcentaje",
       caption = "Fuente: Wassap-Economía Presencial") +
  theme(plot.caption = element_text(hjust = 1)) # Alinea la fuente a la parte inferior derecha


ggplot(datos, aes(x = reorder(Alternativas, -Porcentaje), y = Porcentaje, fill = Alternativas)) +
  geom_bar(stat = "identity") +
  geom_text(aes(label = paste0(round(Porcentaje, 1), "%")), position = position_dodge(width = 0.9), vjust = -0.25) +
  theme_minimal() +
  labs(title = "Resultados encuesta Incremento del IVA",
       subtitle = "",
       x = "", y = "Porcentaje",
       caption = "Fuente: Wassap-Economía Presencial") +
  theme(plot.caption = element_text(hjust = 1)) # Alinea la fuente a la parte inferior derecha






