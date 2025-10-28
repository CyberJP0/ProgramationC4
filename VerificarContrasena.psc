//Ejercicio 17. Solicitar contraseñas hasta que el usuario ingrese la correcta ('admin123').
Proceso VerificarContrasena
    Definir contrasena Como Cadena
	
    Repetir
        Escribir "Ingrese la contraseña:"
        Leer contrasena
    Hasta Que contrasena = "admin123"
	
    Escribir "¡Contraseña correcta! Acceso permitido."
FinProceso
