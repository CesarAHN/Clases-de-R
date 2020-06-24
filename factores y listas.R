#---------------------------------------------------------------------
#                   FACTORES - CODIFICACIÓN DE VECTORES
#---------------------------------------------------------------------

#El vector de género de un salón:

g<-c(1,2,1,2,2,2,2,1,2,1,2,1,
     2,1,2,1,1,2,1,2,1,1,1,2,2)  # Vector de 1 y 2 que representan el género.
View(g)

g1<-factor(g)            # Para indicar que existen dos niveles. 
View(g1)

g2<-factor(g, 
           levels = c(1,2), 
           labels = c("Masculino","Femenino")) # Para especificar los nombres de los levels.
View(g2)

#---------------------------------
# Utilizando una base de datos
#---------------------------------
base<-read.csv("F:/educ.csv", header = TRUE)
View(base)
table(base)

base$p109a<-factor(base$p109a, 
              levels = c(1,2,3,4,5,6,7,8,9,10), 
              labels = c("Sin Nivel","Inicial","Primaria Incompleta",
                         "Primaria Completa","Secundaria Incompleta",
                         "Secundaria Completa","S.NU. Incompleta",
                         "S.NU. Completa","S.U. Incompleta",
                         "S.U. Completa"))

View(base)


table(base$p109a)

bdata<-read.csv(file = "base1.csv", header = TRUE, sep = ";")
View(bdata)

bdata$sexo<-factor(bdata$sexo,
                   levels = c(0,1),
                   labels = c("Masculino", "Femenino"))
bdata$colegio<-factor(bdata$colegio,
                      levels = c(0,1),
                      labels = c("Privado", "Público"))
bdata$ecivil<-factor(bdata$ecivil,
                     levels = c(0,1),
                     labels = c("Soltero", "Casado"))


table(bdata$sexo,bdata$colegio,bdata$ecivil)


res<-c("a","b","b","d","e","a","c","d","a","e")

res<-ordered(res, levels=c("e","d","c","b","a"))

str(res)

recode(res, "1=100;2=200;3=300;4=400;5=500")
