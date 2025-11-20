//Ejercio 15. Ingrese una palabra y muestre su primera y última letra.
Algoritmo PrimeraYUltimaLetraCadena
Definir palabra Como Cadena
Definir primera, ultima Como Caracter
Definir largo Como Entero
Escribir "Ingrese una palabra:"
Leer palabra
largo = Longitud(palabra)
primera = Subcadena(palabra, 1, 1)
ultima = Subcadena(palabra, largo, largo)
Escribir "Primera letra: ", primera
Escribir "Última letra: ", ultima
FinAlgoritmo