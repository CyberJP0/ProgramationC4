# Clase base
class Animal:
    def hablar(self):
        return "Este animal hace un sonido."

# Clase hija Perro
class Perro(Animal):
    def hablar(self):
        return "El perro dice: ¡Guau guau!"

# Clase hija Gato
class Gato(Animal):
    def hablar(self):
        return "El gato dice: ¡Miau!"

# Probando las clases
animal = Animal()
perro = Perro()
gato = Gato()

print(animal.hablar())
print(perro.hablar())
print(gato.hablar())
