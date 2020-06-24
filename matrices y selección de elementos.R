#---------------------------------------------------------------------
#                   MATRICES Y SELECCIÓN DE ELEMENTOS.
#---------------------------------------------------------------------

#---------------------------------
# Convertir un vector en Matriz:
#---------------------------------

# matrix("Vector", nrow="#", ncol="#", byrow="T o F")

a<-matrix(1:12, nrow=3)  # Para especificar el número de filas.
b<-matrix(1:12, ncol=3)  # Para especificar el número de columnas.
c<-matrix(1:12, nrow = 3, byrow = TRUE)  # Para ordenarlo por filas.
d<-matrix(1:12, nrow = 4, ncol = 4, byrow = TRUE)

x<-seq(1,20, by=2)
x1<-c(x,20,20)

z<-matrix(x1, nrow=4)

#---------------------------------------
# Convertir varios vectores en matriz:
#---------------------------------------

# rbind y cbind.

x2<-1:10
x3<-rep(2,10)
x4<-seq(2,5, length.out = 10)
x5<-seq(10,12, length.out = 10)

m1<-rbind(x2,x3)   # Para ordenarlos por filas.
m2<-cbind(x2,x3)   # Para ordenarlos por columnas.

m3<-rbind(x2,x3,x4,x5)
m4<-cbind(x2,x3,x4)

#---------------------------------------------
# Para cambiar nombre a las filas y columnas.
#---------------------------------------------

#dimnames("n_matriz")=list("n_de las filas","n_de las columnas")

t<-rbind(c(2,3,4),c(4,4,4))

dimnames(t)=list(c("Periodo 1", "Periodo 2"), 
                 c("Persona A", "Persona B", "Persona C"))

# Para sólo colocar nombres a la fila o a la columna.

p<-cbind(seq(1,3,by=1),seq(2,4, by=1))

dimnames(p)=list(NULL,
                 c("Colegio A", "Colegio B")) # Sólo para las columnas.

dimnames(p)=list(c("2010","2011","2012"), 
                 NULL)                        # Sólo para las filas. 

n1<-c("Edad","Sexo")
n2<-c("2018","2019","2020")

dimnames(p)=list(n2,n1)  # Los nombres a través de vectores definidos.

#--------------------------------------------
# Para seleccionar elementos de una matriz.
#--------------------------------------------

p

# "Matriz"["filas","columnas"]

p[1,]  # Para obtener la primera fila de la matriz.
p[2,]  # Para obtener la segunda fila de la matriz.
p[,1]  # La primera columna de la matriz.
p[,1, drop=FALSE] # Para mostrar el nombre de la columna y el formato matriz.
p[,2]  # La segunda columna de la matriz.

p[1,2]  # El elemento de la primera fila y la segunda columna.
p[3,1]  # El elemento de la tercera fila y la primera columna.
p[2,1, drop=FALSE]   

# Para la matriz m3
m3

m3[3,4]        # Para el elemento de la fila 3 y columna 4.

m3[,c(5,6,7)]  # Para las columnas 5,6 y 7.
m3[,5:7]       # El mismo resultado que el anterior.

m3[c(1,2),]    # Para las filas 1 y 2.

#--------------------------
# dimensión de la matriz
#--------------------------

#dim("n_matriz")

dim(m3)  # Dimensión de la matriz m3.

dim(p)   # Dimensión de la matriz p.

dim(m3)[1]  # Dimensión de las filas de la matriz m3.

dim(m3)[2]  # Dimensión de las columnas de la matriz m3.



