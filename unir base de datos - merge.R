#---------------------------------------------------------------------
#                     UNIR BASE DE DATOS - merge()
#---------------------------------------------------------------------

#-----------------
# Comando Merge.
#-----------------

# S�LO 2 DATA FRAME:

set.seed(10)
df1<-data.frame(id=1:20, 
                pa�s=sample(c("Per�", "Argentina", "Brasil", "Chile",
                              "Colombia", "Bolivia"), 
                            size = 20,
                            replace = TRUE))
set.seed(11)
df2<-data.frame(id=sample(1:30, size = 15),
                educaci�n=sample(c("Econom�a", "Contador", "Administrador",
                                   "Ingeniero", "Doctor"),
                                 size = 15,
                                 replace = TRUE))

# Si deseamos unir s�lo las observaciones que se repiten en las dos 
# bases de datos (intersecci�n).

interseccion<-merge(df1,df2)   # R identifica que la variable 
# com�n es "id".Adem�s "all=FALSE" (valor por defecto).

View(interseccion)

# Si deseamos especificar la variable com�n:

interseccion1<-merge(df1,df2, by="id", all = FALSE)

# Si deseamos conservar a todos los individuos del primer data frame (df1):

t_df1<-merge(df1,df2, all.x = TRUE)   

# Si deseamos conservar a todos los individuos del segundo DF (df2):
t_df2<-merge(df1,df2, all.y = TRUE)

# Si deseamos conservar a todos los individuos:
t_df<-merge(df1,df2, all = TRUE)

# CON M�S DE 2 DATA FRAME:
set.seed(12)
df3<-data.frame(id=sample(1:30, size = 20),
                edad=sample(20:40, size = 20, replace = TRUE))

set.seed(13)
df4<-data.frame(id=sample(1:30, size = 20),
                sexo=factor(sample(1:2, size = 20, replace = TRUE),
                            levels = c(1,2),
                            labels = c("Masculino", "Femenino")))

set.seed(14)
df5<-data.frame(id=sample(1:30, size = 25),
                ingresos=sample(2000:5000, size = 25, replace = TRUE))

# Si deseo unir las 5 base de datos s�lo con los individuos que se repiten:

df_r<-merge(df1,df2)
df_r1<-merge(df_r,df3)
df_r2<-merge(df_r1,df4)
df_r3<-merge(df_r2,df5)

View(df_r3)

# Usando reduce() para escribir menos c�digos.

dff<-Reduce(merge, list(df1,df2,df3,df4,df5))

# Si deseo unir las 5 base de datos, pero que se queden los individuos
# del df1:

dff_1<-Reduce(function(...) merge(..., all.x=T), 
              list(df1,df2,df3,df4,df5))   # "all.y=T" Para el DF (df5). 

# Si deseo unir las 5 base de datos, pero que se queden todos
# los individuos:
dff_all<-Reduce(function(...) merge(..., all=TRUE), 
                list(df1,df2,df3,df4,df5))

# DISTINTO NOMBRE

# Variables con datos comunes con distinto nombre:

set.seed(15)
bd1<-data.frame(contribuyente=sample(1:20, size = 15),
                ingresos=sample(2000:5000, size = 15))

set.seed(16)
bd2<-data.frame(id=sample(1:20, size = 10),
                trabajo=factor(sample(1:2, size = 10, replace = T),
                               levels = c(1,2),
                               labels = c("Independiente", "Dependiente")))

# En la primera base "contribuyente", en la segunda base "id".
# Para la intersecci�n:
bd<-merge(bd1,bd2, by.x = "contribuyente", by.y = "id")

# M�S DE UNA VARIABLE DE EMPAREJAMIENTO.

# M�s de 1 variable como indicador para emparejar.
set.seed(17)
datos1<-data.frame(ubigeo=sample(1:25, size = 50, replace = T),
                   estrato=factor(sample(1:2, size = 50, replace = T),
                                  levels = c(1,2),
                                  labels = c("Rural", "Urbano")),
                   condicion=factor(sample(1:3, size = 50, replace = T),
                                    levels = 1:3,
                                    labels = c("Jefe", "C�nyuge", "Hijo")),
                   edad=sample(1:50, size = 50, replace = T))

set.seed(18)
datos2<-data.frame(ubigeo=sample(1:25, size = 40, replace = T),
                   estrato=factor(sample(1:2, size = 40, replace = T),
                                  levels = c(1,2),
                                  labels = c("Rural", "Urbano")),
                   condicion=factor(sample(1:3, size = 40, replace = T),
                                    levels = 1:3,
                                    labels = c("Jefe", "C�nyuge", "Hijo")),
                   ingresos=sample(1000:5000, size = 40, replace = T))

# Tres variables iguales (ubigeo, estrato y condici�n).
# Intersecci�n:

datos<-merge(datos1, datos2, by=c("ubigeo", "estrato", "condicion"))
