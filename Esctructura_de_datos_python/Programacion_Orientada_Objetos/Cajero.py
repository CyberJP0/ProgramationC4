#4. Crea una clase llamada **CuentaBancaria** con atributos titular y balance. Implementa funciones para depositar y retirar
class CuentaBancaria:
    def __init__(self, titular, balance):
        self.titular = titular
        self.balance = balance

    def depositar(self):
        monto = float(input("Introduzca el monto a depositar: "))
        if monto > 0:
            self.balance += monto
            print(f"Ha depositado {monto}.")
        else:
            print("El monto debe ser mayor que 0.")

    def retirar(self):
        monto = float(input("Introduzca el monto a retirar: "))
        if monto > 0:
            if monto <= self.balance:
                self.balance -= monto
                print(f"Ha retirado {monto}.")
            else:
                print("Fondos insuficientes.")
        else:
            print("El monto debe ser mayor que 0.")

    def menu(self):
       while True:
           print("\n #### MENU ###")
           print("1.Depositar")
           print("2.Retirar")
           print("3.Montrar balance")
           print("4.Salir")

           opcion = int(input("Introduzca una opcion: "))

           if opcion == 1:
                   self.depositar()
                   print(f"\n El balance actual es {self.balance}")

           elif opcion == 2:
                   self.retirar()
                   print(f"\n El balance actual es {self.balance}")

           elif opcion == 3:
                   print(f"\n Su balance actual es de {self.balance}")

           elif opcion == 4:
               print("\n Saliendo del menu...")
               break
           
           else:
               print("\n Opcion no valida")


cliente1 = CuentaBancaria("Jefry", 100)
cliente1.menu()
