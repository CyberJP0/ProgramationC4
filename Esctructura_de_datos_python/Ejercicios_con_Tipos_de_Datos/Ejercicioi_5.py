#5. Pide al usuario que escriba su edad y muestra Verdadero si es mayor de edad (18+), Falso en caso contrario.

edad = int(input("Introduzca su edad:"))

if edad >= 18:
    print("Usted es mayor de edad:", True)
else:
    print("Usted es menor de edad:", False)