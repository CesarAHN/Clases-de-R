#-----------------------------------------------------------------------
#                      GRÁFICOS EN R - PRIMERA PARTE.
#-----------------------------------------------------------------------

library(haven)

datos<-read_dta("ex3-2003.dta")
View(datos)

names(datos)

# Cambiando nombres.
names(datos)[1:4]<-c("score", "negro", "ingresos", "patrimonio")

datos$negro<-factor(datos$negro, levels = c(0,1),
                    labels = c("Blanco", "Negro"))

attach(datos)

datos1<-read_dta("gender.dta")
View(datos1)

names(datos1)
names(datos1)[1:4]<-c("ingreso","educacion","experiencia","femenino")

#--------------------------
# GRÁFICOS DE NIVEL ALTO.
#--------------------------

#------------------------------
# GRÁFICOS UNIDIMENSIONALES
#------------------------------

# Puntos / Linea - plot().
# Sintaxis:

# plot(x, ...)
plot(score)

# Histograma - hist().
# Sintaxis:

# hist(x, ...)
hist(negro)

# Gráfico de caja - boxplot().
# Sintaxis:

# boxplot(x, ...)
boxplot(ingresos)


#-------------------------
# GRÁFICOS BIDIMENSIONALES.
#-------------------------

# Comando plot().
# Sintaxis:

# plot(x, y, ...)

plot(ingresos, score)

plot(datos1$educacion, datos1$experiencia)


# Comando sunflowerplot().
# Sintaxis:

# plot(x, y, ...)

sunflowerplot(datos1$educacion, datos1$experiencia)

#--------------------------------------------
# ARGUMENTOS DE LOS COMANDOS DE NIVEL ALTO.
#--------------------------------------------

# ...

# Type: Especifica el tipo de gráfico. 
# Sintaxis: 
#  type=" "   
      #  "p" - Puntos (gráfico de dispersión).
      #  "l" - Líneas
      #  "b" - Puntos unidos con líneas.
      #  "o" - Puntos unidos con líneas (cubren los puntos).
      #  "h" - Líneas verticales (tipo histograma).
      #  "s" - Escaleras, 

tipo<-c("p", "l", "b", "o", "h", "s")

par(mfcol=c(2,3), mar=rep(2,4))
for (i in 1:length(tipo)) {
  plot(ingresos, score, type = tipo[i])
}

# main: Agrega título al gráfico.
# Sintaxis:
#  main=" "

titu<-c("Puntos", "Líneas", "Puntos unidos con líneas",
        "Puntos cubiertos", "Líneas Verticales",
        "Escalera")

par(mfcol=c(2,3), mar=rep(2,4))
for (i in 1:length(tipo)) {
  plot(ingresos, score, type = tipo[i],
       main = paste("Gráfico tipo:", titu[i]))
}

# sub: Agrega subtítulos.
# Sintaxis:
# sub= " "

par(mfcol=c(2,3), mar=rep(5,4))
for (i in 1:length(tipo)) {
  plot(ingresos, score, type = tipo[i],
       main = paste("Gráfico tipo:", titu[i]),
       sub = "Elaboración Propia")
}

# xlab y ylab: Etiquetas para los ejes "x" y "y".
# Sintaxis:
# xlab=" ", ylab=" "

par(mfcol=c(2,3), mar=rep(5,4))
for (i in 1:length(tipo)) {
  plot(ingresos, score, type = tipo[i],
       main = paste("Gráfico tipo:", titu[i]),
       sub = "Elaboración Propia",
       xlab = "INGRESOS DE LOS POSTULANTES", 
       ylab = "PUNTAJE DE CRÉDITO")
}

# axes: Argumento lógico que si toma FALSE no dibuja los ejes ni
#       la caja del gráfico. Su valor por defecto es TRUE.

plot(ingresos, score, axes = FALSE)

# xlim y ylim: Expecifica el límite inferior y superior de los ejes
#              "x" y "y". 
# Sintaxis:
#  xlim=c()  y   ylim=c()

plot(ingresos, score, xlim = c(0, 100), ylim = c(0,600))


# add: Argumento lógico que si toma TRUE permite que se agregue
#      otra gráfica al gráfico prediseñado. Su valor por defecto es
#      FALSE.

# SE USARÁ PARA JUNTAR GRÁFICOS DE NIVEL ALTO Y BAJO.

#------------------------------
# Parámetros de los gráficos.
#------------------------------

# adj: Sirve para especificar la justificación de los textos. 
# Valores:
#         0 - si se desea a la izquierda.
#         0.5 - si se desea al centro.
#         1 - si se desea a la derecha.

plot(ingresos, score, 
     main = "Gráfico de Dispersión", adj=0)
# Es recomendable que si sólo se desea justificar el título. 
# se utilice con el parámetro title()

plot(ingresos, score)
title("Gráfico de Dispersión", adj=0)

# Se puede usar en los parámetros text(), mtext() y title().

# col: Asigna colores. Para saber la cantidad de colores digitar
#      colors()
# Sintaxis: col=" "
plot(ingresos, score, col="red")

# Este parámetro se puede usar en combinación con otros parámetros.
# col.main, col.sub, col.lab, col.axis

plot(ingresos, score, col="red",
     main = "Gráfico de Dispersión", col.main="violet",
     col.lab="blue")

# bty: Para el marco de la caja del gráfico:
# Valores que toma: 
#     "o" - El marco completo.
#     "l" - Sólo la línea vectical del eje "y".
#     "7" - Las líneas posteriores del eje "y" y "x".
#     "n" - Ninguna línea.
#     "c" - Las dos líneas del eje "x" y la línea del eje "y".
#     "u" - Las dos líneas del eje "y" y la línea del eje "x".
#     "]" - Las dos líneas del eje "x" y la línea  post. del eje "y".

marco<-c("o", "l", "7", "n", "c", "u", "]")

par(mfcol=c(2,3), mar=rep(2,4))
for (i in 1:length(tipo)) {
  plot(ingresos, score, col="skyblue",
       main = paste("Marco tipo:", marco[i]),
       bty=marco[i])
}

# Este parámetro también se puede usar con el parámetro legend().
# Pero sólo puede tomar "n" u "o".

# cex: Valor numérico que se usa determinar el tamaño 
# de los textos y algunos símbolos.

par(mfcol=c(2,3), mar=rep(2,4))
for (i in 1:length(tipo)) {
  plot(ingresos, score, col="red",
       main = paste("Tamaño de las esferas, cex:", i),
       cex=i)
}

# Este parámetro también se usa en combinación con otros parámetros.
# cex.lab, cex.main, cex.sub, cex.axis.

# las: Determina la posición de las etiquetas de los ejes.
# Valores:  
#    0 - Paralelo a los ejes.
#    1 - Horizontal.
#    2 - Perpendicular al eje.
#    3 - Vertical.

las_v<-c(0,1,2,3)

par(mfcol=c(2,2), mar=rep(3,4))
for (i in las_v) {
  hist(ingresos, col="green", las=i,
       main = paste("Orientación las:", i))
}

# lty: Valor numérico que determina el tipo de líneas.
# Valores:
#         0 - Sin líneas.
#         1 - Línea sólida.
#         2 - Línea Quebrada.
#         3 - Línea Punteada.
#         4 - Punto Línea.
#         5 - Línea larga-corta.
#         6 - Dos líneas cortas.

lty_v<-c(0,1:6)

par(mfcol=c(2,4), mar=rep(3,4))
for (i in lty_v) {
  hist(ingresos, col="skyblue", lty=i,
       main = paste("Tipo de línea lty:", i))
}

# lwd: Valor numérico que determina el tamaño de las líneas.

lwd_v<-1:12

par(mfcol=c(3,4), mar=rep(3,4))
for (i in lwd_v) {
  hist(ingresos, col="skyblue", lwd=i, 
       main = paste("Tamaño de línea lwd:", i))
}

# lwd y lty se verán mejor con el gráfico de nivel bajo abline().

# pch: Determina el tipo de los símbolos. Toma 26 valores. 
# Adicionalmente puede usar cualquier tipo de caracter.

pch_v<-c(0,1:7)

par(mfcol=c(2,4), mar=rep(2,4))
for (i in pch_v) {
  plot(ingresos, score, col="blue", pch=i,
       main = paste("Usando el símbolo para, pch:", i))
}

# A continuación se muestran los 26 simbolos.

filas = rep(1:4, each=7)
columnas = rep(1:7, times=4)
par(mar=c(rep(1.5,4)))
plot(filas, columnas, xlim=c(.5,5), ylim=c(.5,7.5),
      xlab="", ylab="", type = "n", 
      xaxt = "n", yaxt = "n")
points(filas, columnas, pch=0:25, cex=3, bg="green")
text(row, col, 0:25, pos=4, offset=2, cex=1.5)
title("SÍMBOLOS PARA CADA VALOR DE PCH")

# El color de fondo "verde" puede cambiar desde pch=21 hasta pch=25.

# Para cualquier caracter.

plot(ingresos,score, pch="~", col="red")

# font: Determina el estilo del texto.
# Valores:
#   1 - Letra normal.
#   2 - Letra cursiva.
#   3 - Letra negrita.
#   4 - Letra negrita cursiva.

font_v<-1:4

par(mfcol=c(2,2), mar=rep(3,4))
for (i in font_v) {
  plot(ingresos, score, col="blue", font=i,
       main = paste("Caracteres para font:", i))
}

# Se puede combinar con otros parámetros:
# font.main, font.sub, font.lab, font.axis.

# xaxt y yaxt: Determina si se mostrarán los intervalos de los 
# ejes "x" y "y" respectivamente.
# Valores:
#     "s" - Se muestran los intervalos del eje.
#     "n" - No se muestran los intervalos del eje.

vaxt<-c("s","n")

par(mfcol=c(2,1), mar=rep(3,4))
for (i in 1:length(vaxt)) {
  plot(ingresos, score, col="blue", xaxt=vaxt[i], yaxt=vaxt[i],
       main = paste("Resultado cuando xaxt y yaxt toman:", vaxt[i]))
}

# axis: Agrega ejes a las gráficas.
# Sintaxis:
#  axis(side = #)

# Valores: 
#     1 - Agrega un eje en la parte inferior.
#     2 - Agrega un eje a la izquierda.
#     3 - Agrega un eje en la parte superior.
#     4 - Agrega un eje a la derecha.

# Preferente usar cuando xaxt y yxat toman "n".

axis_v<-1:4

par(mfcol=c(2,2), mar=rep(5.5,4))
for (i in axis_v) {
  plot(ingresos, score, col="blue", xaxt="n", yaxt="n",
       main = paste("Agregando eje si axis:", i))
  axis(side = i)
}

# Dentro de axis se puede colocar valores de los ejes.







