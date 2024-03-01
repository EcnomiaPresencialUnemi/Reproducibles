# Análisis de los Resultados de la Encuesta sobre el Incremento del IVA
Este repositorio contiene un script en R diseñado para analizar los resultados de una encuesta sobre el impacto del incremento del IVA en la economía. A continuación, se detallan los pasos seguidos en el código para que puedas entender y ejecutar el análisis por tu cuenta.

## Instalación de Paquetes
El script utiliza los paquetes `ggplot2` para la visualización de datos y `dplyr` para la manipulación de datos. Si aún no los tienes instalados, puedes hacerlo ejecutando los siguientes comandos en R:

```
install.packages("ggplot2")
install.packages("dplyr")
```

## Preparación de los Datos
Antes de empezar, debes cargar tus datos en R. En este ejemplo, el conjunto de datos se llama Encuesta_Economia_Incremento_IVA. Asegúrate de tener este dataframe disponible en tu entorno de R.

## Cálculo del Porcentaje de Respuestas
Esta línea transforma el dataframe datos, agregando una nueva columna Porcentaje que representa el porcentaje de respuestas para cada alternativa basado en el total de respuestas.
El script calcula el porcentaje de respuestas para cada alternativa de la encuesta con el objetivo de entender cómo se distribuyen las opiniones:
```
datos <- datos %>%
  mutate(Porcentaje = Respuestas / sum(Respuestas) * 100)
```
## Ordenamiento de los Datos
Para visualizar los resultados de manera efectiva, ordenamos los datos por el porcentaje de respuestas de forma descendente
Esto asegura que las alternativas con mayores porcentajes se muestren primero en el gráfico, facilitando la interpretación de los resultados:
```
datos <- datos[order(-datos$Porcentaje),]
```

## Creación del Gráfico
Finalmente, se utiliza ggplot2 para crear un gráfico de barras que muestre el porcentaje de respuestas para cada alternativa.
Cada parte del código contribuye a una característica específica del gráfico:
```
ggplot(datos, aes(x = reorder(Alternativas, -Porcentaje), y = Porcentaje, fill = Alternativas)) +
  geom_bar(stat = "identity") +
  geom_text(aes(label = paste0(round(Porcentaje, 1), "%")), position = position_dodge(width = 0.9), vjust = -0.25) +
  theme_minimal() +
  labs(title = "Resultados encuesta Incremento del IVA",
       x = "", y = "Porcentaje",
       caption = "Fuente: Wassap-Economía Presencial") +
  theme(plot.caption = element_text(hjust = 1))
```
### Explicación de las líneas de código del gráfico
```
ggplot(datos, aes(x = reorder(Alternativas, -Porcentaje), y = Porcentaje, fill = Alternativas)) +
```
    Esta línea inicializa el gráfico utilizando el dataframe datos. Se especifica que el eje x debe ordenar las Alternativas de acuerdo con el -Porcentaje (el signo menos indica orden descendente, así que las barras más       grandes aparecen primero o a la izquierda). El eje y muestra el Porcentaje de respuestas para cada alternativa. El argumento fill = Alternativas colorea las barras según la alternativa a la que pertenecen.
```
geom_bar(stat = "identity"):
```
    Añade las barras al gráfico. El argumento stat = "identity" indica que la altura de las barras debe corresponder exactamente a los valores en el eje y (en este caso, el porcentaje de respuestas).

  # geom_text(aes(label = paste0(round(Porcentaje, 1), "%")), position = position_dodge(width = 0.9), vjust = -0.25): 
    Esta línea coloca etiquetas de texto dentro o cerca de las barras, mostrando el porcentaje de respuestas redondeado a un decimal seguido del símbolo %. position_dodge(width = 0.9) ajusta la posición del texto para         evitar que se superponga en barras adyacentes, y vjust = -0.25 mueve el texto ligeramente hacia arriba para que aparezca encima de las barras.

  # theme_minimal(): 
    Aplica un tema minimalista al gráfico, que simplifica el fondo y los elementos decorativos para centrarse en los datos.

  # labs(title = "Resultados encuesta Incremento del IVA", x = "", y = "Porcentaje", caption = "Fuente: Wassap-Economía Presencial"): 
    Personaliza las etiquetas del gráfico, incluyendo el título, las etiquetas de los ejes (en este caso, se deja la del eje x vacía) y la fuente de los datos, que se muestra como un subtítulo en la parte inferior del         gráfico.

  # theme(plot.caption = element_text(hjust = 1)): 
    Ajusta la posición de la fuente (caption) para alinearla a la derecha del gráfico (hjust = 1).

## Ejecución del Código
Para ejecutar este análisis, simplemente copia y pega el código en tu entorno de R y asegúrate de tener el conjunto de datos Encuesta_Economia_Incremento_IVA cargado previamente. El resultado será un gráfico visual que te permitirá interpretar rápidamente las opiniones de los encuestados sobre el incremento del IVA.

