#-----------------------------------------------------------------------
#                      GR�FICOS EN R - PRIMERA PARTE.
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
# GR�FICOS DE NIVEL ALTO.
#--------------------------

#------------------------------
# GR�FICOS UNIDIMENSIONALES
#------------------------------

# Puntos / Linea - plot().
# Sintaxis:

# plot(x, ...)
plot(score)

# Histograma - hist().
# Sintaxis:

# hist(x, ...)
hist(negro)

# Gr�fico de caja - boxplot().
# Sintaxis:

# boxplot(x, ...)
boxplot(ingresos)


#-------------------------
# GR�FICOS BIDIMENSIONALES.
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

# Type: Especifica el tipo de gr�fico. 
# Sintaxis: 
#  type=" "   
      #  "p" - Puntos (gr�fico de dispersi�n).
      #  "l" - L�neas
      #  "b" - Puntos unidos con l�neas.
      #  "o" - Puntos unidos con l�neas (cubren los puntos).
      #  "h" - L�neas verticales (tipo histograma).
      #  "s" - Escaleras, 

tipo<-c("p", "l", "b", "o", "h", "s")

par(mfcol=c(2,3), mar=rep(2,4))
for (i in 1:length(tipo)) {
  plot(ingresos, score, type = tipo[i])
}

# main: Agrega t�tulo al gr�fico.
# Sintaxis:
#  main=" "

titu<-c("Puntos", "L�neas", "Puntos unidos con l�neas",
        "Puntos cubiertos", "L�neas Verticales",
        "Escalera")

par(mfcol=c(2,3), mar=rep(2,4))
for (i in 1:length(tipo)) {
  plot(ingresos, score, type = tipo[i],
       main = paste("Gr�fico tipo:", titu[i]))
}

# sub: Agrega subt�tulos.
# Sintaxis:
# sub= " "

par(mfcol=c(2,3), mar=rep(5,4))
for (i in 1:length(tipo)) {
  plot(ingresos, score, type = tipo[i],
       main = paste("Gr�fico tipo:", titu[i]),
       sub = "Elaboraci�n Propia")
}

# xlab y ylab: Etiquetas para los ejes "x" y "y".
# Sintaxis:
# xlab=" ", ylab=" "

par(mfcol=c(2,3), mar=rep(5,4))
for (i in 1:length(tipo)) {
  plot(ingresos, score, type = tipo[i],
       main = paste("Gr�fico tipo:", titu[i]),
       sub = "Elaboraci�n Propia",
       xlab = "INGRESOS DE LOS POSTULANTES", 
       ylab = "PUNTAJE DE CR�DITO")
}

# axes: Argumento l�gico que si toma FALSE no dibuja los ejes ni
#       la caja del gr�fico. Su valor por defecto es TRUE.

plot(ingresos, score, axes = FALSE)

# xlim y ylim: Expecifica el l�mite inferior y superior de los ejes
#              "x" y "y". 
# Sintaxis:
#  xlim=c()  y   ylim=c()

plot(ingresos, score, xlim = c(0, 100), ylim = c(0,600))


# add: Argumento l�gico que si toma TRUE permite que se agregue
#      otra gr�fica al gr�fico predise�ado. Su valor por defecto es
#      FALSE.

# SE USAR� PARA JUNTAR GR�FICOS DE NIVEL ALTO Y BAJO.

#------------------------------
# Par�metros de los gr�ficos.
#------------------------------

# adj: Sirve para especificar la justificaci�n de los textos. 
# Valores:
#         0 - si se desea a la izquierda.
#         0.5 - si se desea al centro.
#         1 - si se desea a la derecha.

plot(ingresos, score, 
     main = "Gr�fico de Dispersi�n", adj=0)
# Es recomendable que si s�lo se desea justificar el t�tulo. 
# se utilice con el par�metro title()

plot(ingresos, score)
title("Gr�fico de Dispersi�n", adj=0)

# Se puede usar en los par�metros text(), mtext() y title().

# col: Asigna colores. Para saber la cantidad de colores digitar
#      colors()
# Sintaxis: col=" "
plot(ingresos, score, col="red")

# Este par�metro se puede usar en combinaci�n con otros par�metros.
# col.main, col.sub, col.lab, col.axis

plot(ingresos, score, col="red",
     main = "Gr�fico de Dispersi�n", col.main="violet",
     col.lab="blue")

# bty: Para el marco de la caja del gr�fico:
# Valores que toma: 
#     "o" - El marco completo.
#     "l" - S�lo la l�nea vectical del eje "y".
#     "7" - Las l�neas posteriores del eje "y" y "x".
#     "n" - Ninguna l�nea.
#     "c" - Las dos l�neas del eje "x" y la l�nea del eje "y".
#     "u" - Las dos l�neas del eje "y" y la l�nea del eje "x".
#     "]" - Las dos l�neas del eje "x" y la l�nea  post. del eje "y".

marco<-c("o", "l", "7", "n", "c", "u", "]")

par(mfcol=c(2,3), mar=rep(2,4))
for (i in 1:length(tipo)) {
  plot(ingresos, score, col="skyblue",
       main = paste("Marco tipo:", marco[i]),
       bty=marco[i])
}

# Este par�metro tambi�n se puede usar con el par�metro legend().
# Pero s�lo puede tomar "n" u "o".

# cex: Valor num�rico que se usa determinar el tama�o 
# de los textos y algunos s�mbolos.

par(mfcol=c(2,3), mar=rep(2,4))
for (i in 1:length(tipo)) {
  plot(ingresos, score, col="red",
       main = paste("Tama�o de las esferas, cex:", i),
       cex=i)
}

# Este par�metro tambi�n se usa en combinaci�n con otros par�metros.
# cex.lab, cex.main, cex.sub, cex.axis.

# las: Determina la posici�n de las etiquetas de los ejes.
# Valores:  
#    0 - Paralelo a los ejes.
#    1 - Horizontal.
#    2 - Perpendicular al eje.
#    3 - Vertical.

las_v<-c(0,1,2,3)

par(mfcol=c(2,2), mar=rep(3,4))
for (i in las_v) {
  hist(ingresos, col="green", las=i,
       main = paste("Orientaci�n las:", i))
}

# lty: Valor num�rico que determina el tipo de l�neas.
# Valores:
#         0 - Sin l�neas.
#         1 - L�nea s�lida.
#         2 - L�nea Quebrada.
#         3 - L�nea Punteada.
#         4 - Punto L�nea.
#         5 - L�nea larga-corta.
#         6 - Dos l�neas cortas.

lty_v<-c(0,1:6)

par(mfcol=c(2,4), mar=rep(3,4))
for (i in lty_v) {
  hist(ingresos, col="skyblue", lty=i,
       main = paste("Tipo de l�nea lty:", i))
}

# lwd: Valor num�rico que determina el tama�o de las l�neas.

lwd_v<-1:12

par(mfcol=c(3,4), mar=rep(3,4))
for (i in lwd_v) {
  hist(ingresos, col="skyblue", lwd=i, 
       main = paste("Tama�o de l�nea lwd:", i))
}

# lwd y lty se ver�n mejor con el gr�fico de nivel bajo abline().

# pch: Determina el tipo de los s�mbolos. Toma 26 valores. 
# Adicionalmente puede usar cualquier tipo de caracter.

pch_v<-c(0,1:7)

par(mfcol=c(2,4), mar=rep(2,4))
for (i in pch_v) {
  plot(ingresos, score, col="blue", pch=i,
       main = paste("Usando el s�mbolo para, pch:", i))
}

# A continuaci�n se muestran los 26 simbolos.

filas = rep(1:4, each=7)
columnas = rep(1:7, times=4)
par(mar=c(rep(1.5,4)))
plot(filas, columnas, xlim=c(.5,5), ylim=c(.5,7.5),
      xlab="", ylab="", type = "n", 
      xaxt = "n", yaxt = "n")
points(filas, columnas, pch=0:25, cex=3, bg="green")
text(row, col, 0:25, pos=4, offset=2, cex=1.5)
title("S�MBOLOS PARA CADA VALOR DE PCH")

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

# Se puede combinar con otros par�metros:
# font.main, font.sub, font.lab, font.axis.

# xaxt y yaxt: Determina si se mostrar�n los intervalos de los 
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

# axis: Agrega ejes a las gr�ficas.
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







