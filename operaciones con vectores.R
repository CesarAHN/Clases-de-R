#---------------------------------------------------------------------
#                     OPERACIONES CON VECTORES 
#---------------------------------------------------------------------

x<-1:8
y<-seq(3,27, length.out = 8)


#------------------------
# Operaciones básicas.
#------------------------

z<-x+y             # Adición de vectores.

z1<-x-y            # Sustracción de vectores.

z2<- x%*%y         # Producto escalar.

z3<- x*y           # Producto de Elementos.

z4<-sum(z3)        # La adición del producto de los elementos, da el producto escalar.

#----------------------------
# Operaciones estadísticas.
#----------------------------

e<-mean(x)         # Cálculo de la media del vector x.

e1<-median(x)      # Cálculo de la mediana del vector x.

e2<-max(x)         # El elemento máximo del vector x.

e3<-min(x)         # El elemento mínimo del vector x.

e4<-prod(x)        # EL producto de los elementos de x.

e5<-sum(x)         # La suma de elementos de x.

e6<-cumsum(x)      # Suma acumulada de elementos de x.

e7<-diff(x)        # Diferencias sucesivas de elementos de x.

#----------------------------------------
# Para ordenar los elementos del vector. 
#----------------------------------------

t<-c(1,3,4,2,10,7,5,18,6)

t_a<-sort(t)       # Para ordenar los elementos ascendentemente.

t_d<-sort(t, decreasing = TRUE)   # Para ordenar los elementos descendentemente.
  
t_i<-rev(t)        # Para invertir el orden de los elementos.  


#------------
# GRÁFICO.
#------------
# Definiendo los vectores:
m<-c(3,8)
m
p<-c(10,2)
p

# Suma de vectores.
a<-m+p
a

# Para poder graficarlo, la sintaxis es la siguiente:

# Para graficar el primer vector (vector m):
plot(3,8, xlim=c(0,14), ylim=c(0,12), 
     xlab="Eje x", ylab="Eje y", lwd=3,
     col="blue", bty="n")
axis(side = 1, 0:14)
axis(side = 2, 0:12)
arrows(0,0,3,8,col="blue")
abline(h = pretty(0:12, 12), v = pretty(0:14, 14), col = "lightgray")

# Para graficar el segundo vector (vector p):
points(10,2,lwd=3,col="green")
arrows(0,0,10,2,col="green")

# Para graficar el vector resultante de la adición de los 2 vectores (a=m+p)
points(13,10,lwd=3,col="black")
arrows(0,0,13,10,col="black")

# Agregando las líneas imaginarias para formar el paralelogramo que representa la adición de 2 vectores.
arrows(3,8,13,10,col="blue",lty=3)
arrows(10,2,13,10,col="green",lty=3)


