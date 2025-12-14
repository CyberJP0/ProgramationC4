import tkinter as tk

# Crear la ventana principal
ventana = tk.Tk()
ventana.title("Ventana de Bienvenida")
ventana.geometry("300x150")

# Crear un Label con el mensaje
mensaje = tk.Label(ventana, text="¡Bienvenido a Tkinter!")
mensaje.pack(pady=20)

# Ejecutar la aplicación
ventana.mainloop()
