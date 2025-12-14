import tkinter as tk

# Crear ventana principal
ventana = tk.Tk()
ventana.title("Dibujar en Canvas")
ventana.geometry("500x400")

# Crear Canvas
canvas = tk.Canvas(ventana, bg="white")
canvas.pack(fill=tk.BOTH, expand=True)

# Variables para guardar la posición anterior del mouse
x_anterior = None
y_anterior = None

# Función cuando se presiona el mouse
def presionar_mouse(event):
    global x_anterior, y_anterior
    x_anterior = event.x
    y_anterior = event.y

# Función para dibujar mientras se mueve el mouse presionado
def dibujar(event):
    global x_anterior, y_anterior
    if x_anterior and y_anterior:
        canvas.create_line(
            x_anterior, y_anterior,
            event.x, event.y,
            width=2
        )
    x_anterior = event.x
    y_anterior = event.y

# Función cuando se suelta el mouse
def soltar_mouse(event):
    global x_anterior, y_anterior
    x_anterior = None
    y_anterior = None

# Eventos del mouse
canvas.bind("<Button-1>", presionar_mouse)
canvas.bind("<B1-Motion>", dibujar)
canvas.bind("<ButtonRelease-1>", soltar_mouse)

# Ejecutar aplicación
ventana.mainloop()
