import tkinter as tk

# Crear ventana principal
ventana = tk.Tk()
ventana.title("Calculadora - Suma")
ventana.geometry("300x220")

# Función para sumar
def sumar():
    num1 = float(entrada1.get())
    num2 = float(entrada2.get())
    resultado.config(text=f"Resultado: {num1 + num2}")

# Labels
label1 = tk.Label(ventana, text="Número 1:")
label1.pack(pady=5)

entrada1 = tk.Entry(ventana)
entrada1.pack(pady=5)

label2 = tk.Label(ventana, text="Número 2:")
label2.pack(pady=5)

entrada2 = tk.Entry(ventana)
entrada2.pack(pady=5)

# Botón
boton = tk.Button(ventana, text="Sumar", command=sumar)
boton.pack(pady=10)

# Label resultado
resultado = tk.Label(ventana, text="Resultado:")
resultado.pack(pady=5)

# Ejecutar
ventana.mainloop()
