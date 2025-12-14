# Clase base
class Vehiculo:
    def mover(self):
        return "El vehículo se está moviendo."


# Clase hija Carro
class Carro(Vehiculo):
    def mover(self):
        return "El carro avanza por la carretera."


# Clase hija Bicicleta
class Bicicleta(Vehiculo):
    def mover(self):
        return "La bicicleta avanza pedaleando."


# Probando las clases
vehiculo = Vehiculo()
carro = Carro()
bicicleta = Bicicleta()

print(vehiculo.mover())
print(carro.mover())
print(bicicleta.mover())
