#12. Contar cuántos números positivos se ingresan antes de ingresar un número negativo.

numero = int(input("digite su numero(ingrese un numero negativo para terminar): "))
contador = 0

while numero >= 0:
    contador += 1
    numero = int(input("digite su numero(ingrese un numero negativo para terminar): "))


print("La cantidad de numeros positivos fue",contador)