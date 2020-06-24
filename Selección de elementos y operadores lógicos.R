#---------------------------------------------------------------------
#             SELECCIÓN DE ELEMENTOS Y OPERADORES LÓGICOS
#---------------------------------------------------------------------

x<-c(2,1,3,12,43,43,6,8,62,9,0,5,23,42,4,1,3)

#--------------------------
# Selección de elementos.
#--------------------------

x[4]                # Para seleccionar el cuarto elemento. 
x[12]               # //     //        //  duodécimo elemento.
x[length(x)]        # //     //        // último elemento.
x[3:6]              # //     //        los elementos desde el tercero al sexto.
x[-2]               # //     //        todos los elementos menos el segundo.
x[-(3:6)]           # Todos los elementos excepto desde el tercero al sexto.

#-------------------------
# Operadores Lógicos.
#-------------------------

# "vector_deseado"["condiciones lógicas"]

# Igualdad "==".

x[x==3]             # Elementos iguales a 3.
x[x==17]            #    //       //    a 17.

# Mayor que ">".

x[x>3]              # Elementos mayores que 3.
x[x>100]            # Elementos mayores que 100.

# Menor que "<".

x[x<5]              # Elementos menores que 5.

# Mayor igual que ">=".

x[x>=8]             # Elementos mayores iguales que 8.

# Menor igual que "<=".

x[x<=8]             # Elementos menores iguales que 8.

# Diferente "!=".

x[x!=3]             # Elementos diferentes de 3.

# Negación "!".

x[!x<5]             # Elementos que no son menores que 5.

# y "&".

x[x>3 & x<10]       # Elementos mayores que 3 y menores que 10.

# o "|".

x[x>3 | x<10]       # Elementos mayores que 3 o menores que 10.
x[x!=0 | x>5]       # Elementos diferentes de 0 o mayores que 5.

#------------------------------------------------------------
# Para la posición tras cumplimiento de la condición lógica.
#------------------------------------------------------------

which(x==3)         # En que posiciones se encuentra el elemento 3.
which(x!=3 & x<5)   # // //     //      //     // los elementos diferentes de 3 
#y menores que 5.


#------------------------------------------------
# Para cambiar valores de elementos del vector.
#------------------------------------------------

View(x)             # Para observar el vector en formato tabla.

x[5]<-1000             # Para cambiar el valor del elemento de la posición quinta.

x[c(1,5)]=x[c(1,5)]+5  # Para sumarle el valor de 5 a los elementos de las posiciones
# 1 y 5.

x[which(x==3)]=x[which(x==3)]+100

