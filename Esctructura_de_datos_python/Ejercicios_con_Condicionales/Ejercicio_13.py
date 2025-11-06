#13. Leer edades hasta que se ingrese una edad fuera del rango 0-120.

edad = int(input("Ingrese su edad (0-120): "))
while 0 <= edad <= 120:
    edad = int(input("Ingrese su edad (0-120): "))

print("Edad fuera de rango. Fin del programa.")
