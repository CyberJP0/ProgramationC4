import tkinter as tk

# Crear ventana principal
ventana = tk.Tk()
ventana.title("Lista de elementos")
ventana.geometry("300x300")

# Función para agregar elementos al Listbox
def agregar_elemento():
    elemento = entrada.get()
    if elemento != "":
        lista.insert(tk.END, elemento)
        entrada.delete(0, tk.END)

# Entry para escribir el nuevo elemento
entrada = tk.Entry(ventana)
entrada.pack(pady=10)

# Botón para agregar
boton = tk.Button(ventana, text="Agregar", command=agregar_elemento)
boton.pack(pady=5)

# Listbox
lista = tk.Listbox(ventana)
lista.pack(pady=10, fill=tk.BOTH, expand=True)

# Ejecutar la aplicación
ventana.mainloop()
