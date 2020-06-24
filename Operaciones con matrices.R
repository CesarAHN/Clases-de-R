#---------------------------------------------------------------------
#                      OPERACIONES CON MATRICES
#---------------------------------------------------------------------

A<-matrix(1:9, nrow = 3, byrow = TRUE)
a<-c(4,5,4)
b<-c(3,4,4)
d<-c(8,7,7)
B<-rbind(a,b,d)

# Adición de matrices:
M1<-A+B

# Sustracción de matrices:
M2<-A-B

# Producto matriz por escalar:
M3<-4*A

# Producto de matrices:
AB<-A%*%B

# Matriz cuadrada:
A2<-A%*%A

#==============================================
#Para calcular las potencias de las matrices.

install.packages("Biodem")
library(Biodem)
#==============================================

AA<-mtx.exp(A,2)  # La matriz A elevado al cuadrado.
A2==AA

A5<-mtx.exp(A,5)  # La matriz A elevado a la quinta.

#------------------------------
# ÁLGEBRA LINEAL DE MATRICES.
#------------------------------

# Transpuesta de una matriz:
A.t<-t(A)

# LA Diagonal de la matriz:
A.d<-diag(A)

# La traza de la matriz:
A.tz<-sum(diag(A))

# Determinante de la matriz:
B.d<-det(B)

# Inversa de la matriz:
A.i<-solve(A)
B.i<-solve(B)

# Descomposición QR de una matriz:
qr(B)

# Rango de una matriz:
qr(B)$rank

# Descomposición de Cholesky de una matriz:
chol(A)  # Sólo para matrices simétricas y definidas positivas.

# Matriz de varianzas:
var(B)

#-------------------------------------
# Solución de sistema de ecuaciones:
#-------------------------------------

# 2x+3y=1
# 3x-7y=2


D<-matrix(c(2,3,3,-7), nrow = 2, byrow = TRUE)
v<-c(1,2)

solve(D,v)  # Para resolver el sistema de ecuaciones.

#------------------------------
# Valores y Vectores propios.
#------------------------------

eigen(D)  # Para obtener los valores y los vectores propios.
eigen(D)$values  # Sólo para los valores propios.
eigen(D)$vectors # Sólo para los vectores propios.

E<-matrix(c(2,3,3,7), nrow = 2)
eigen(E)$values

