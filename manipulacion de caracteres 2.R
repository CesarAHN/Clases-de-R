#---------------------------------------------------------------------
#                 MANIPULACI�N DE CARACTERES 2 EN R
#---------------------------------------------------------------------

#--------------------------------
# Separar una cadena en partes.
#--------------------------------

# Comando Strsplit.

# strsplit("Vector", "split")

x<-c("Fruta1;Mango", "Fruta2;Naranja", 
     "Fruta3;Mandarina", "Fruta4;Pl�tano")

x<-strsplit(x, ";")   # Para separar por el s�mbolo ;
x<-substring(x,1)     # Para observar como est� compuesta la lista.
x<-substring(x,4,9)   # Para seleccionar s�lo la palabra fruta.

h<-matrix(1:16, nrow = 4)   # Crear una matriz. 
dimnames(h)<-list(NULL, x)  # Para poder cambiar el nombre de las columnas.
h

x1<-c("Mango;Fruta1", "Naranja;Fruta2",
      "Mandarina;Fruta3", "Pl�tano;Fruta4")

# Se podr�a separar por ; pero no a fruta ya que tienen distintos anchos los
# elementos.

#------------------------
# sustituir caracteres.
#------------------------

# chartr("old", "new", "Vector")

# Palabras que por codificaci�n no se coloc� la �. 

z<-c("Manana", "nandu","nono", "Ano", "Canon",
     "Senor", "Bano","Cano", "Tamano", "Estano")

# Si se desea corregir y reemplazar todas las n por �.

chartr("n", "�", z)

#----------------------
# Comando sub y gsub.
#----------------------

# sub("Pattern", "Replacement", "Vector", "Ignore.case= T o F")

# gsub("Pattern", "Replacement", "Vector", "Ignore.case= T o F")

# Pero si s�lo se desea reemplazar las primeras n por �.

sub("n", "�", z)

# Usos b�sicos de sub y gsub.

p<-c("Excel es el mejor programa", 
     "Las mejores tablas estad�sticas se desarrollan en Excel",
     "Los gr�ficos de Excel son lo m�ximo",
     "Excel es todo para mi", "�Excel?, s� Excel es el mejor")

sub("Excel", "R", p)

# Pero si deseamos cambiar todos los Excel.

gsub("Excel", "R", p)

t<-c("Realizo mis documentos en word",
     "Word es muy f�cil")

gsub("word", "Latex", t)
gsub("word", "Latex", t, ignore.case = TRUE)

#--------------------------------
# Uso de expresiones Regulares.
#--------------------------------

# Expresi�n |

gsub("word|excel", "R", c("word es un buen programa", "excel es el mejor"))

# Expresi�n ^

gsub("^w", "W", c("walter", "wilson", "waldo", "wawa"))

# Expresi�n $

gsub("e$", "�", c("Empece", "Pele", "Pate", "so�e", "te", "preste"))

# Expresi�n []

gsub("[12]", "Ma�z", c("45 kilos de 1", "Exportaci�n de 2"))

gsub("[0-2]", "3", "1,2,5,6,8,4,58")

# Expresi�n [^ ]

gsub("[^0-3]", " ", "2,3,4,6,5,3,1,9")

# Expresi�n +

gsub("4+", "x", c("1,2,3,4", "11,22,33,44", "43,22,444,4444"))

# Expresi�n *

gsub("c*", " ", "El mar es celeste")

# Expresi�n {}

gsub("1{2}", "mar", "1,32,11,3,54,65,111,65")

gsub("1{1,3}", "mar", "2,1,22,34,554,11,23,111,1111")

gsub("1{3,}", "sol", "1,2,1,11,3,111,211,1111,243211")

gsub("[12]\\d{3}", "DOS MIL DIECISIETE", "Cambia el a�o 2049")

# Expresi�n .

gsub(".", "4", "9 veces 4")

# Expresi�n \\d

gsub("\\d{2}", "si", "1,22,2,4,333,55,66,666")

# Expresi�n \\D

gsub("\\D{2}", "no", "ma,12,32,2,321,,23")

# Expresi�n \\w

gsub("\\w", "_", "},,$,56,,#,5,s,dw,3")

# Expresi�n \\W

gsub("\\W", "_", "},,$,56,,#,5,s,dw,3")

# Expresi�n \\s

gsub("\\s", "_", "Mar�a y Jos�")


gsub("[ab]", "\\t", "abc and ABC")

# Uni�n de expresiones.

x1<-c("Mango;Fruta1", "Naranja;Fruta2",
      "Mandarina;Fruta3", "Pl�tano;Fruta4")

# Si queremos separar fruta.

gsub(".*;", "",x1)

