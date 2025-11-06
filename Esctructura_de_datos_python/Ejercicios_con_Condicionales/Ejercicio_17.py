# Ejercicio 17: Solicitar contraseñas hasta que el usuario ingrese la correcta ('admin123').

while True:
    contraseña = input("Ingrese la contraseña: ")
    if contraseña == "admin123":
        print("Contraseña correcta. ¡Bienvenido!")
        break
    else:
        print("Contraseña incorrecta. Intente de nuevo.")
