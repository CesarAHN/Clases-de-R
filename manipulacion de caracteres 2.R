#---------------------------------------------------------------------
#                 MANIPULACIÓN DE CARACTERES 2 EN R
#---------------------------------------------------------------------

#--------------------------------
# Separar una cadena en partes.
#--------------------------------

# Comando Strsplit.

# strsplit("Vector", "split")

x<-c("Fruta1;Mango", "Fruta2;Naranja", 
     "Fruta3;Mandarina", "Fruta4;Plátano")

x<-strsplit(x, ";")   # Para separar por el símbolo ;
x<-substring(x,1)     # Para observar como está compuesta la lista.
x<-substring(x,4,9)   # Para seleccionar sólo la palabra fruta.

h<-matrix(1:16, nrow = 4)   # Crear una matriz. 
dimnames(h)<-list(NULL, x)  # Para poder cambiar el nombre de las columnas.
h

x1<-c("Mango;Fruta1", "Naranja;Fruta2",
      "Mandarina;Fruta3", "Plátano;Fruta4")

# Se podría separar por ; pero no a fruta ya que tienen distintos anchos los
# elementos.

#------------------------
# sustituir caracteres.
#------------------------

# chartr("old", "new", "Vector")

# Palabras que por codificación no se colocó la ñ. 

z<-c("Manana", "nandu","nono", "Ano", "Canon",
     "Senor", "Bano","Cano", "Tamano", "Estano")

# Si se desea corregir y reemplazar todas las n por ñ.

chartr("n", "ñ", z)

#----------------------
# Comando sub y gsub.
#----------------------

# sub("Pattern", "Replacement", "Vector", "Ignore.case= T o F")

# gsub("Pattern", "Replacement", "Vector", "Ignore.case= T o F")

# Pero si sólo se desea reemplazar las primeras n por ñ.

sub("n", "ñ", z)

# Usos básicos de sub y gsub.

p<-c("Excel es el mejor programa", 
     "Las mejores tablas estadísticas se desarrollan en Excel",
     "Los gráficos de Excel son lo máximo",
     "Excel es todo para mi", "¿Excel?, sí Excel es el mejor")

sub("Excel", "R", p)

# Pero si deseamos cambiar todos los Excel.

gsub("Excel", "R", p)

t<-c("Realizo mis documentos en word",
     "Word es muy fácil")

gsub("word", "Latex", t)
gsub("word", "Latex", t, ignore.case = TRUE)

#--------------------------------
# Uso de expresiones Regulares.
#--------------------------------

# Expresión |

gsub("word|excel", "R", c("word es un buen programa", "excel es el mejor"))

# Expresión ^

gsub("^w", "W", c("walter", "wilson", "waldo", "wawa"))

# Expresión $

gsub("e$", "é", c("Empece", "Pele", "Pate", "soñe", "te", "preste"))

# Expresión []

gsub("[12]", "Maíz", c("45 kilos de 1", "Exportación de 2"))

gsub("[0-2]", "3", "1,2,5,6,8,4,58")

# Expresión [^ ]

gsub("[^0-3]", " ", "2,3,4,6,5,3,1,9")

# Expresión +

gsub("4+", "x", c("1,2,3,4", "11,22,33,44", "43,22,444,4444"))

# Expresión *

gsub("c*", " ", "El mar es celeste")

# Expresión {}

gsub("1{2}", "mar", "1,32,11,3,54,65,111,65")

gsub("1{1,3}", "mar", "2,1,22,34,554,11,23,111,1111")

gsub("1{3,}", "sol", "1,2,1,11,3,111,211,1111,243211")

gsub("[12]\\d{3}", "DOS MIL DIECISIETE", "Cambia el año 2049")

# Expresión .

gsub(".", "4", "9 veces 4")

# Expresión \\d

gsub("\\d{2}", "si", "1,22,2,4,333,55,66,666")

# Expresión \\D

gsub("\\D{2}", "no", "ma,12,32,2,321,,23")

# Expresión \\w

gsub("\\w", "_", "},,$,56,,#,5,s,dw,3")

# Expresión \\W

gsub("\\W", "_", "},,$,56,,#,5,s,dw,3")

# Expresión \\s

gsub("\\s", "_", "María y José")


gsub("[ab]", "\\t", "abc and ABC")

# Unión de expresiones.

x1<-c("Mango;Fruta1", "Naranja;Fruta2",
      "Mandarina;Fruta3", "Plátano;Fruta4")

# Si queremos separar fruta.

gsub(".*;", "",x1)

