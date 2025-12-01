#1.Crea una clase llamada **Usuario** con atributos nombre y edad. Implementa una función que muestre los datos del usuario.

class Usuario:
    def __init__(self,nombre,edad):
         self.nombre = nombre
         self.edad  = edad

    def datos(self):
         print(f"Nombre: {self.nombre}")
         print(f"edad: {self.edad}")
        

usuario1 = Usuario("Juan",20)
usuario1.datos()