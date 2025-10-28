//Ejercicio 13.Leer edades hasta que se ingrese una edad fuera del rango 0-120.
Proceso LeerEdades
    Definir edad Como Entero
	
    Escribir "Ingrese edades (finaliza cuando ingrese una edad fuera del rango 0-120):"
    Leer edad
	
    Mientras edad >= 0 Y edad <= 120 Hacer
        Escribir "Edad válida: ", edad
        Leer edad
    FinMientras
	
    Escribir "Edad fuera de rango. Fin del programa."
FinProceso
