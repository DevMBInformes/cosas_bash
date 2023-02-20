#/bin/bash



##########
#p_text
#
#imprime el texto dado tiene dos argumentos
#1) numero 0 o 1 (NEGRITA O NO)
#2) color: black, red, green, yellow, blue, magenta, cyan, white
##########
p_text() {
  case "$3" in
    black) color_code="30";;
    red) color_code="31";;
    green) color_code="32";;
    yellow) color_code="33";;
    blue) color_code="34";;
    magenta) color_code="35";;
    cyan) color_code="36";;
    white) color_code="37";;
    *) color_code="0";;
  esac
  echo -e "\e[0;${2};${color_code}m$1\e[0m"
}

##########
#total_line
#
#un argumento con el caracter a imprimir, 
#imprime toda la pantalla.
##########
total_line() {
	get_term_x
	repeat_char $1 $?
}

##########
#repeat_char
#
#imprime el primer argumento la cantidad de
#veces pasado en el segundo argumento.
##########

repeat_char() {
  char="$1"
  count="$2"
  printf "%${count}s" | tr " " "${char}"
  echo
}





##########
#Funciones para la  terminal
##########

##########
#get_term_size
#
#imprime en pantalla el tamaño de la terminal
#en filas y columnas.
##########
get_term_size() {
  rows=$(tput lines)
  columns=$(tput cols)
  echo "El tamaño de la terminal es: ${rows} filas x ${columns} columnas"
}


##########
#get_term_x
#
#devuelve el numero de columna disponible en la terminal
#########
get_term_x() {
	return $(tput cols)
}


##########
#get_term_y
#
#devuelve el número de lineas en la terminal.
##########
get_term_y(){
	return $(tput lines)
}


#pruebas::

#generamos un linea con el total de la pantalla con el caracter -
total_line "-"
#prueba de texto en azul sin negrita
p_text "Hola mundo" "0" "blue"
#generamos una linea con el total de la pantalla con el caracter *
total_line "l"
#prueba de texto en rojo con negrita
p_text "Hola mundo" "0" "red"
#obtenemos el tamaño de la terminal
get_term_x

