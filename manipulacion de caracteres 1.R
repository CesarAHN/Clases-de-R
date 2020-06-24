#---------------------------------------------------------------------
#                 MANIPULACIÓN DE CARACTERES EN R
#---------------------------------------------------------------------

# Se Define al vector base:

x<-"manipulación de caracteres"
y<-c("Arsenal", "Chelsea", "Tottenham", 
     "Manchester City", "Manchester United", "Liverpool")

#---------------------
# Contar Caracteres.
#---------------------

# Para contar cuantos caracteres

nchar(x)     # Arroja cuántos caracteres tiene el vector x.

nchar(y)     # Arroja cuántos caracteres tiene el vector y.


#---------------------------
# Para extraer subcadenas.
#---------------------------

# substr("vector", "star=", "stop=")

substr(x, start = 3, stop = 6)    # Para extraer la subcadena desde el 
# tercer al sexto caracter.

substr(x, 4, 9)     # Para extraer la subcadena desde el cuarto al 
# noveno caracter.

substr(y, 1, 3)     # Para extraer la subcadena desde el primer al 
# tercer elemento.

# Se puede generar un nuevo vector de iniciales:

z<-substr(y, 1, 3)

# substring("vector", "first=", "last=10^6")

substring(x, first = 10)     # Para extraer la subcadena desde el 
# caracter 10 hasta el último.

substring(y, 4)     # Para extraer desde el cuarto caracter.

substring(y, 1, 3)  # Para extraer desde el primero al tercer caracter.

# El inicio y el final también pueden ser vectores (sólo substring). 

substring(x, 1:3, 1:3)     # Para extraer primero desde el primer 
# al primer caracter, luego extraer desde el segundo al segundo
# caracter y así sucesivamente.

substring(y, 1:3, 2:4)  

# También se puede modificar.

substr(x, 1, 1)<-"M"    # Para colocar la mayúscula.
x

substring(z[c(4,5)], 2, 3)<-c(".C", ".U")    # Para distinguir a los 
# dos manchester.
z

# Ejemplo para datos con la ENAHO.

library(haven)

based<-read_dta("F:/enaho01-2017-100.dta")

View(based$ubigeo)

# Para crear la variable departamento.

based$departamento<-substring(based$ubigeo, 1, 2)

View(based$departamento)

str(based$departamento)

mode(based$departamento)<-"numeric"
  
based$departamento<-factor(based$departamento,
                  levels = c(1:25),
                  labels = c("Amazonas", "Ancash", "Apurimac", "Arequipa",
                             "Ayacucho", "Cajamarca", "Callao", "Cusco", 
                             "Huancavelica", "Huanuco", "Ica", "Junin", 
                             "La Libertad", "Lambayeque", "Lima", "Loreto",
                             "Madre de Dios", "Moquegua", "Pasco", "Piura", 
                             "Puno", "San Martin", "Tacna", "Tumbes",
                             "Ucayali"))

departamento<-table(based$departamento)

install.packages("xtable")
library(xtable)

tablas<-xtable(departamento)
print(tablas, type = "latex")
print(xtable(departamento, type = "doc"), file = "tabla.doc")

write.csv(departamento, file = "tabla1.csv")


