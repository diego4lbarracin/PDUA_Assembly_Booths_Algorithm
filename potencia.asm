//Diego Alejandro Albarracin
//David Felipe Vargas

//Implementacion Algoritmo potencia
//Se emple mismo codigo pero con un for anidado, para realizar cont veces una iteracion dentro de otra
//Funcion FOR ANINADO
foranid:
	//Movemos al acumulador la direccion de memoria de la variable count
    mov acc, cte
    cont
    //Movemos a DPTR la direccion de memoria guardada en acc.
    mov DPTR, acc
    //Obtemos el contenido que esta en esa direccion de memoria y lo guardamos 
    //en acc.
    mov acc, [DPTR]
    //Invertimos el contenido en acc. (complemento a 1)
    inv acc
    //Guardamos el valor invertido en a
    mov a, acc
    //Guardamos en acumulador la direccion de memoria de num1
    mov acc, cte
    num1
    //Movemos la direccion de memoria de num1 que esta en acc a DPTR.
    mov DPTR, acc
    //Movemos el contenido de la direccion de memoria al que apunta DPTR a acc.
    mov acc, [DPTR]
    //Sumamos acc (eso sera igual  -3)
    add acc, a
    //Guardamos en a ese resultado.
    mov a, acc
    
    //Guardamos en acumulador la direccion de memoria de num1
    mov acc, cte
    num1
    //Movemos el contenido de la direccion de memoria al que apunta DPTR a acc.
    mov acc, [DPTR]
    //Sumamos acc con rango [1+(-3)= -2]
    add acc, a
    //Movemos acc a a(a=-2)
    mov a, acc

    //Traemos la variable i
    mov acc, cte
    y
    mov DPTR, acc
    //En este momento, acc=i
    mov acc, [DPTR]
    
    //[y+(a= -2)]
    add acc, a

    jn 
    //Si i+(-rango) es un resultado negativo, va a saltar a la funcion 
    //donde ocurre la multiplicacion.
    for
    
    jmp cte
    finloopanidado
//Funcion FOR.
for:
    //Movemos al acumulador la direccion de memoria de la variable count
    mov acc, cte
    count
    //Movemos a DPTR la direccion de memoria guardada en acc.
    mov DPTR, acc
    //Obtemos el contenido que esta en esa direccion de memoria y lo guardamos 
    //en acc.
    mov acc, [DPTR]
    //Invertimos el contenido en acc. (complemento a 1)
    inv acc
    //Guardamos el valor invertido en a
    mov a, acc
    //Guardamos en acumulador la direccion de memoria de num1
    mov acc, cte
    num1
    //Movemos la direccion de memoria de num1 que esta en acc a DPTR.
    mov DPTR, acc
    //Movemos el contenido de la direccion de memoria al que apunta DPTR a acc.
    mov acc, [DPTR]
    //Sumamos acc (eso sera igual  -8)
    add acc, a
    //Guardamos en a ese resultado.
    mov a, acc
    
    //Guardamos en acumulador la direccion de memoria de num1
    mov acc, cte
    num1
    //Movemos el contenido de la direccion de memoria al que apunta DPTR a acc.
    mov acc, [DPTR]
    //Sumamos acc con rango [1+(-8)= -7]
    add acc, a
    //Movemos acc a a(a=-7)
    mov a, acc

    //Traemos la variable i
    mov acc, cte
    i
    mov DPTR, acc
    //En este momento, acc=i
    mov acc, [DPTR]
    
    //[i+(a= -7)]
    add acc, a

    jn 
    //Si i+(-rango) es un resultado negativo, va a saltar a la funcion 
    //donde ocurre la multiplicacion.
    lsb_q
    
    jmp cte
    finloop

//Funcion de Multiplicacion.

//Funcion para guardar lsb de Q en lsb_q
lsb_q:
mov acc, cte
q
mov dptr, acc
mov acc, [dptr]
//aplicar lsb a q
lsb acc
//guardar acc en una variable
mov a, acc
mov acc, cte
lsb_q 
mov dptr, acc
//Movemos "a" a "acc", la cual es el bit menos significativo de q 
mov acc, a
//La variable lsb_q toma un nuevo valor
mov [dptr], acc

//Funcion para el msb de ACUMULADOR
msb_acum:
mov acc, cte
acum
mov dptr, acc
mov acc, [dptr]
msb acc
mov a, acc
//Se toma el valor msb_a
mov acc, cte
msb_a
mov dptr, acc
mov acc, a
//msb_a toma un nuevo valor
mov [dptr], acc

//Funcion para el lsb de ACUMULADOR
lsb_acum:
mov acc, cte
acum
mov dptr, acc
mov acc, [dptr]
msb acc
mov a, acc
//Se toma el valor lsb_a
mov acc, cte
lsb_a
mov dptr, acc
mov acc, a
//lsb_a toma un nuevo valor
mov [dptr], acc


	
multiplacionBooth:
	
//Carga de lsb_q
    //Movemos al acumulador la direccion de memoria de lsb_q
    mov acc, cte
    lsb_q
    //Se guarda el contenido de acc en DPTR
    mov DPTR, acc
    //Se obtiene el contenido al que apunta DPTR y se guarda en acc
    mov acc, [DPTR]
    //Se aplica completo a 1's a acc (lsb_q)
    inv acc
    //Se almacena el contenido en a.
    mov a, acc
    //Movemos al acumulador la direccion de memoria de num1
    mov acc, cte
    num1
    //Se mueve esa direccion a DPTR
    mov DPTR, acc
    //Se mueve a acc el contenido en esa direccion de memoria
    mov acc, [DPTR]
    //Se suma 1+not(lsb_q)
    add acc, a
    //Se alamacena el resultado de la operacion en a (a=-lsb_q)
    mov a, acc
//Carga de q_1
    //Movemos a acc la direccion de memoria de q_1
    mov acc, cte
    q_1
    //Movemos a DPTR esa direccion de memoria
    mov DPTR, acc
    //Movemos a acc el contenido de esa direccion de memoria
    mov acc, [DPTR]
    //Inicio de la comparacion: Se realiza la suma de la variable 'a' con q_1(en este caso acc) (a= -lsb_q )
    //Si lsb_q=0 y q_1=0; entonces 0+0= 0
    //Si lsb_q=1 y q_1=0; entonces -1+1= 0
    //Al conecer que cuando los valores lsb_q y q_1 son iguales no se ejecuta ninguna operacion y 
    //se salta inmediatamente a la funcion donde se realiza el corriemento
    add acc, a
    jz
   	lsr_q



    //Si este no es el caso, se contunia para probar las otras opciones
    mov acc, cte
    //Variable con el contenido de -1
    num_1
    mov DPTR,acc
    mov acc, [DPTR]
    //Guardamos en a el valor de -1 (a=-1)
    mov a, acc
    //Traemos de vuelta el valor lsb_q
    mov acc, cte
    lsb_q
    //Movemos ese valor a DPTR
    mov DPTR,acc
    mov acc, [DPTR]
    //Se suma -1 y el contenido de lsb_q
    //Si la suma es = 0; entonces lsb_q=1, lo que quiere decir que se
    //necesita restar m al ACU [ACU = ACU+(-M)].
    add acc, a
    jz
	//llamar Fucnion de ir a la resta
	rest_am
	jmp cte
	sum_am    
   


    
//Resta acc-m
res_am:

//Se carga la variable multiplicadora en cte
mov acc, cte
multi
mov dptr, acc
mov acc, [dptr]
//Se aplica complemento 2 a la variable multi
mov a, acc
inv a
mov acc, cte
mascara_lsb
mov dptr, acc
mov acc, [dptr]
add acc, a
mov a, acc
//Se carga la variable acumuladora en cte
mov acc, cte
acum
mov dptr, acc
mov acc, [dptr]
//Se realiza la resta ACC+(-M)
add acc, a
//La suma se guarda en a 
mov a, acc

//Funcion para cambiar valor
jump_chng_acum: 	
//Si se realiza la resta, se cambia inmediatamente al cambio del acumulador
jmp cte
chng_acum

//Suma acc+m
sum_am:
//Se carga la variable acumuladora en cte
mov acc, cte
acum
mov dptr, acc
mov acc, [dptr]
//Se carga la variable acumuladora en a
mov a, acc
//Se carga la variable multiplicadora en cte 
mov acc, cte
multi
mov dptr, acc
//Se carga la variable multiplicadora en acc 
mov acc, [dptr]
//Se realiza la suma ACC+M
add acc, a
//La suma se guarda en a 
mov a, acc


//funcion para realizar los cambios en el acumulador
chng_acum;
mov acc, cte
acum
mov dptr, acc
//Movemos "a" a "acc", la cual puede ser (ACC+(-M)) o (ACC+M)
mov acc, a
mov [dptr], acc



//Logical shift right Q
lsr_q:
mov acc, cte
q
mov dptr, acc
mov  acc, [dptr]
//se aplica logical shift right
lsr acc
mov a, acc

//funcion para cambiar Q
chng_q:
mov acc, cte
q
mov dptr, acc
mov acc, a
//q toma un nuevo valor
mov [dptr], acc


//LSB de ACC
lsb_acum:
mov acc, cte
acum
mov dptr, acc
mov acc, [dptr]
lsb acc
mov a, acc
and a, a
jz
chngdos_q
jmp cte
sumar_1

//Funcion 
sumar_1:
mov acc, cte
q
mov dptr, acc
mov acc, [dptr]
msb acc
add acc, acc
jz
suma_0+1
jmp cte
chngdos_q

//Funcion 
suma_0+1:
mov acc, cte
mascara_msb
mov dptr, acc
mov acc, [dptr]
mov a, acc
mov acc, cte
q
mov dptr, acc
mov acc, [dptr]
add acc, a
mov a, acc

//funcion 2 para cambiar Q si se se suma 1
chngdos_q:
mov acc, cte
q
mov dptr, acc
mov acc, a
//q toma un nuevo valor
mov [dptr], acc




//Logical shift right A
lsr_a:
mov acc, cte
acum
mov dptr, acc
mov  acc, [dptr]
//se aplica logical shift right
lsr acc
mov a, acc

//funcion para cambiar A
chng_a:
mov acc, cte
acum
mov dptr, acc
mov acc, a
//acum toma un nuevo valor
mov [dptr], acc

//Funcion para cambiar el msb de A. Si msb_a es igual a 0, se verifica el valor del MSB actual. Si ese MSB actual es 0, no se realiza cambios, si es 1 se le resta 1. 
//Si el msb_a es igual a 1, se verifica el valos del MSB actual. Si ese MSB actual es 0, se le suma 1, si es 1 se deja igual.

chng_acum:
mov acc, cte
msb_a
mov dptr, acc
mov acc, [dptr]
add acc, acc
jz
cambio_cero
jmp cte
cambio_uno

cambio_cero:
mov acc, cte
acum
mov dptr, acc
mov acc, [dptr]
msb acc
mov a, acc
add a, a
jz
chngdostres_a
//Si no es 0, y es 1, le resto inv de la mascara
mov acc, cte
mascara_msb
mov dptr, acc
mov acc, [dptr]
mov a, acc
inv a
//Se carga acum
mov acc, cte
acum
mov dptr, acc
mov acc, [dptr]
//Ej: Si el numero es: 11001010 y el msb debe ser 0 se hace este proceso: 11001010-10000000= 01001010
add acc, a
mov a, acc

//funcion  2 para cambiar A
chngdos_a:
mov acc, cte
acum
mov dptr, acc
mov acc, a
//acum toma un nuevo valor
mov [dptr], acc

//Funcion cuando el msb actual de acc es igual a 0
cambio_uno:
mov acc, cte
acum
mov dptr, acc
mov acc, [dptr]
msb acc
mov a, acc
add a, a
jz
cambio_unomas
jmp cte
chnge_q1

//Se carga el Q y la mascara 10000000 para: EJ: si el numero es 00110111 y el msb tiene que ser 1 se hace lo // siguiente: 00110111 + 10000000 = 10110111
cambio_unomas:
mov acc, cte
acum
mov dptr, acc
mov acc, [dptr]
mov a, acc
mov acc, cte
mascara_msb
mov dptr, acc
mov acc, [dptr]
add acc, a
//Se realiza la suma y se guarda en a
mov a, acc

//funcion 3 para cambiar A
chngtres_a:
mov acc, cte
acum
mov dptr, acc
mov acc, a
//acum toma un nuevo valor
mov [dptr], acc


//Funcion para cambiar el valor de Q-1 por el lSB de q
chng_q1:
mov acc, cte
lsb_q
mov dptr, acc
mov [dptr], acc
mov a, acc
//Cargar Q-1
mov acc, cte
q_1
//Mover el LSB de Q a Q-1
mov dptr, acc
mov acc, a
mov [dptr], acc

//Funcion Incremento de i
incrementoDeI:
//Guardamos en acumulador la direccion de memoria de num1
mov acc, cte
num1
//Movemos la direccion de memoria de num1 que esta en acc a DPTR.
mov DPTR, acc
//Movemos el contenido de la direccion de memoria al que apunta DPTR a acc.
mov acc, [DPTR]
//Guardamos el 1 por un momento con una variable auxiliar
mov a, acc
//Cargamos i
mov acc, cte
i
//Se guarda en DPTR
mov DPTR, acc
//Obtenemos su contenido y lo guardamos en acc.
mov acc, [DPTR]
//Sumamos acc y 'a' (acc= i+1)
add acc, a
//Guardamos por un momento el valor aumentado de i en 'a'
mov a, acc
//Actualizamos el valor de i llevando el contenido de 'a' a i.
mov acc, cte
i
//Se guarda en DPTR
mov DPTR, acc
//Se mueve a acc el contenido de 'a'
mov acc,a
//Por ultimo, guardamos el contenido de acc en la direccion de memoria a la que apunta
//DPTR.
mov [DPTR], acc 
//:D
//Saltamos al for
jmp cte
for

//fin loop y se guardan las variables en dos registros
finloop:
mov acc, cte
acum
mov dptr, acc
mov acc, [dptr]
mov a, acc
mov acc, cte
q
mov dptr, acc
mov acc, [dptr]
jmp
finloopanidado

finloopanidado:
jmp cte
finalPrograma

//Fin programa
finalPrograma:

RET

//Funcion para encontrar el MSB "INSTRUCCIÓN NUEVA"
msb:
//lo que esta en acc lo movemos a "a"
mov a, acc
//Cargamos mascara de 10000000 para encontrar el msb
mov acc, cte
mascara_msb
//Se carga x variable en acc para realizar el msb
mov dptr, acc
mov acc, [dptr]
//Realizamos un and entre la variable x y la mascara para encontrar el msb y descartar lo demas
and a, acc
//Realizamos shift de 7 para el registro y lo dejamos de ultimas para ser lsb
lsr7 a, acc
//Guardamos lo de la operacion de a, a acc, para luego devolver el msb
mov acc, a


//Funcion para el LSB "INSTRUCCIÓN NUEVA"
lsb:
//Guardamos x variable en a
mov a, acc
//Cargamos mascara de 00000001 para encontrar el lsb
mov acc, cte
mascara_lsb
mov dptr, acc
mov acc, [dptr]
//realizamos un and entre la variable x y la mascara para encontrar el lsb y descartar lo demas
and a, acc
//guardamos la operacion anterior en acc
mov acc, a


lsb_q: 0x00
count: 0x08//8
num1: 0x01//1
i: 0x00 //0
q: 0xF9 //11111001
multi: 0xF9 //11111001
acum: 0x00 //00000000
mascara_lsb: 0x01 //00000001
mascara_msb: 0x08 //10000000
MSB "INSTRUCCIÓN NUEVA"//OP CODE: 1110xxx
LSB "INSTRUCCIÓN NUEVA" //OP CODE: 1111xxx
finloop //OP CODE: 1100xxx
msb_a: 0x00
lsb_a: 0x00
q_1: 0x00
cont: 0x03
y: 0x00