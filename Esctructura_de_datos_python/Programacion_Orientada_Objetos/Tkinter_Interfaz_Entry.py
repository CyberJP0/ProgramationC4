import tkinter as tk

# Crear la ventana principal
ventana = tk.Tk()
ventana.title("Entry y Button")
ventana.geometry("350x200")

# Función que se ejecuta al presionar el botón
def mostrar_texto():
    texto = entrada.get()
    resultado.config(text=texto)

# Entry (campo de texto)
entrada = tk.Entry(ventana)
entrada.pack(pady=10)

# Button
boton = tk.Button(ventana, text="Mostrar texto", command=mostrar_texto)
boton.pack(pady=5)

# Label donde se mostrará el texto
resultado = tk.Label(ventana, text="")
resultado.pack(pady=10)

# Ejecutar la ventana
ventana.mainloop()
