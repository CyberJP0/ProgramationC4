# Clase base
class Dispositivo:
    def encender(self):
        return "El dispositivo se está encendiendo..."


# Clase hija Laptop
class Laptop(Dispositivo):
    def encender(self):
        return "La laptop está iniciando el sistema operativo."


# Clase hija Teléfono
class Telefono(Dispositivo):
    def encender(self):
        return "El teléfono está encendiendo y mostrando el logo."


# Probando las clases
dispositivo = Dispositivo()
laptop = Laptop()
telefono = Telefono()

print(dispositivo.encender())
print(laptop.encender())
print(telefono.encender())
