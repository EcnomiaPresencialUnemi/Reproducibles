## Gráfico de tasas de crecimiento del PIB de Ecuador
Para reproducir el gráfico con código R debes hacer lo siguiente:

**1.** Descargar el archivo **data-fy7Vp**.
**2.** Descargar el script: **Tasa crecimiento PIB Ecuador.R**.
**3.** Da doble clic en el archivo del script que acabas de descargar y se abrirá automáticamente en **RStudio**.
**4.** Carga a RStudio el archivo **data-fy7Vp**.
**5.** Corre en RStudio cada una de las instrucciones.








Cargar la librería ggplot2:
  - library(ggplot2)

Generar el gráfico de líneas utilizando ggplot():
  - ggplot(datos_pib): Inicia la creación del gráfico utilizando 'datos_pib' como el conjunto de datos.
  - aes(x = Años, y = `Tasa de Crecimiento`): Establece los ejes, mapeando 'Años' al eje X y 'Tasa de Crecimiento' al eje Y.
  - geom_line(colour = "#112446"): Añade la línea del gráfico con un color específico.
  - labs(): Define las etiquetas y títulos del gráfico.
    - x = "Años": Etiqueta del eje X.
    - y = "Tasas de crecimiento": Etiqueta del eje Y.
    - title = "Ecuador": Título del gráfico.
    - subtitle = "Tasas de crecimiento del PIB": Subtítulo del gráfico.
    - caption = "Fuente: BCE; Elaboración: GRINVEC-UNEMI": Fuente y elaboración como leyenda.

Aplicar temas y estilos:
  - theme_minimal(): Utiliza un tema minimalista para el gráfico.
  - theme(): Personaliza elementos específicos del gráfico.
    - plot.title: Estilo del título.
    - plot.subtitle: Estilo del subtítulo.
    - plot.caption: Estilo de la leyenda.
    - axis.title.y: Estilo del título del eje Y.
    - axis.title.x: Estilo del título del eje X.

Establecer los límites del eje X:
  - scale_x_continuous(breaks = seq(2014, 2024, by = 1)): Define las marcas en el eje X para mostrar cada año desde 2014 hasta 2024.

