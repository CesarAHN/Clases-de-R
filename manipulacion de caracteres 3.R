
#---------------------------------------------------------------------
#                 MANIPULACIÓN DE CARACTERES 3 EN R
#---------------------------------------------------------------------

# Para saber si un elemento pertenece a un vector.

# comando %in%.

x<-c("Lunes", "Martes", "Miércoles", "Jueves",
     "Viernes", "Sábado", "Domingo")

"Lunes" %in% x

c("Lunes", "Martes") %in% x

# Para saber si una subcadena pertenece al vector. 

# Comando Grepl.

y<-c("La tierra es el tercer planeta del sistema solar",
     "La tierra es, hasta ahora, el único planeta habitable")

grepl("tierra", y)

grepl("sol", y)

grepl(c("tierra", "ah"), y)    # Sólo permite de un ancho de 1.

# Concatenar e imprimir caracteres.

# Comando cat.

# cat("Objetos", "sep =") 

z<-c("Luis", "Juan", "Hector")

cat("Mi mejor amigo es: ", z[1])
cat("Mi peor amigo es:", z[2], sep = "")

# Comando print.

print(z)
print("Mi mejor amigo es:")

# Comando Paste

# Concatena vectores y los convierte en caracteres.

paste("Mi mejor amigo es:", z[1], sep = "")


#---------------------------
# Minúsculas y Mayúsculas.
#---------------------------

# Mayúsculas.

paises<-c("Perú", "Argentina", "Brasil", "Chile", "Colombia")

toupper(paises)

# Minúsculas.

tolower(paises)









