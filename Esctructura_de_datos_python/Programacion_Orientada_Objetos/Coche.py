class Coche:
    def __init__(self, marca, velocidad):
        self.marca = marca
        self.velocidad = velocidad

    def acelerar(self):
        while self.velocidad < 300:
            velocidad_anterior = self.velocidad
            self.velocidad += 20

            if self.velocidad > 300:
                self.velocidad = 300  # evitar pasar el límite

            print(
                f"El vehículo {self.marca} pasa de {velocidad_anterior} km/h "
                f"a {self.velocidad} km/h en 10 segundos"
            )

coche1 = Coche("Toyota", 100)
coche1.acelerar()
