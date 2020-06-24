#---------------------------------------------------------------------
#                     UNIR BASE DE DATOS - merge()
#---------------------------------------------------------------------

#-----------------
# Comando Merge.
#-----------------

# SÓLO 2 DATA FRAME:

set.seed(10)
df1<-data.frame(id=1:20, 
                país=sample(c("Perú", "Argentina", "Brasil", "Chile",
                              "Colombia", "Bolivia"), 
                            size = 20,
                            replace = TRUE))
set.seed(11)
df2<-data.frame(id=sample(1:30, size = 15),
                educación=sample(c("Economía", "Contador", "Administrador",
                                   "Ingeniero", "Doctor"),
                                 size = 15,
                                 replace = TRUE))

# Si deseamos unir sólo las observaciones que se repiten en las dos 
# bases de datos (intersección).

interseccion<-merge(df1,df2)   # R identifica que la variable 
# común es "id".Además "all=FALSE" (valor por defecto).

View(interseccion)

# Si deseamos especificar la variable común:

interseccion1<-merge(df1,df2, by="id", all = FALSE)

# Si deseamos conservar a todos los individuos del primer data frame (df1):

t_df1<-merge(df1,df2, all.x = TRUE)   

# Si deseamos conservar a todos los individuos del segundo DF (df2):
t_df2<-merge(df1,df2, all.y = TRUE)

# Si deseamos conservar a todos los individuos:
t_df<-merge(df1,df2, all = TRUE)

# CON MÁS DE 2 DATA FRAME:
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

# Si deseo unir las 5 base de datos sólo con los individuos que se repiten:

df_r<-merge(df1,df2)
df_r1<-merge(df_r,df3)
df_r2<-merge(df_r1,df4)
df_r3<-merge(df_r2,df5)

View(df_r3)

# Usando reduce() para escribir menos códigos.

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
# Para la intersección:
bd<-merge(bd1,bd2, by.x = "contribuyente", by.y = "id")

# MÁS DE UNA VARIABLE DE EMPAREJAMIENTO.

# Más de 1 variable como indicador para emparejar.
set.seed(17)
datos1<-data.frame(ubigeo=sample(1:25, size = 50, replace = T),
                   estrato=factor(sample(1:2, size = 50, replace = T),
                                  levels = c(1,2),
                                  labels = c("Rural", "Urbano")),
                   condicion=factor(sample(1:3, size = 50, replace = T),
                                    levels = 1:3,
                                    labels = c("Jefe", "Cónyuge", "Hijo")),
                   edad=sample(1:50, size = 50, replace = T))

set.seed(18)
datos2<-data.frame(ubigeo=sample(1:25, size = 40, replace = T),
                   estrato=factor(sample(1:2, size = 40, replace = T),
                                  levels = c(1,2),
                                  labels = c("Rural", "Urbano")),
                   condicion=factor(sample(1:3, size = 40, replace = T),
                                    levels = 1:3,
                                    labels = c("Jefe", "Cónyuge", "Hijo")),
                   ingresos=sample(1000:5000, size = 40, replace = T))

# Tres variables iguales (ubigeo, estrato y condición).
# Intersección:

datos<-merge(datos1, datos2, by=c("ubigeo", "estrato", "condicion"))
