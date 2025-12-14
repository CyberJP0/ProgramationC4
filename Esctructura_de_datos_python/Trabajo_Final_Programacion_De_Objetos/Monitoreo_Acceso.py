
import tkinter as tk
from tkinter import ttk, messagebox
from datetime import datetime
import mysql.connector
from mysql.connector import Error

# -----------------------------
# CONFIGURACIÓN MYSQL
# -----------------------------
DB_CONFIG = {
    "host": "127.0.0.1",
    "user": "root",
    "password": "",
    "database": "seguridad",
    "port": 3306
}

ALERTA_UMBRAL = 2

# -----------------------------
# FUNCIONES DE BASE DE DATOS
# -----------------------------
def conectar_mysql():
    try:
        conn = mysql.connector.connect(**DB_CONFIG)
        return conn
    except Error as e:
        messagebox.showerror("Error MySQL", f"No se pudo conectar a la base de datos:\n{e}")
        return None

def guardar_intento_bd(usuario, ip, tipo, hora, servidor):
    conn = conectar_mysql()
    if not conn:
        return False
    try:
        cursor = conn.cursor()
        sql = "INSERT INTO intentos (usuario, ip, tipo, hora, servidor) VALUES (%s, %s, %s, %s, %s)"
        cursor.execute(sql, (usuario, ip, tipo, hora, servidor))
        conn.commit()
        return True
    except Error as e:
        messagebox.showerror("Error MySQL", f"Error al insertar intento:\n{e}")
        return False
    finally:
        cursor.close()
        conn.close()

def obtener_intentos_bd():
    conn = conectar_mysql()
    if not conn:
        return []
    try:
        cursor = conn.cursor()
        cursor.execute("SELECT id, usuario, ip, tipo, hora, servidor FROM intentos ORDER BY id")
        rows = cursor.fetchall()
        return rows
    except Error as e:
        messagebox.showerror("Error MySQL", f"Error al leer intentos:\n{e}")
        return []
    finally:
        cursor.close()
        conn.close()

def obtener_alertas_bd(umbral=ALERTA_UMBRAL):
    conn = conectar_mysql()
    if not conn:
        return []
    try:
        cursor = conn.cursor()
        sql = """
            SELECT usuario, COUNT(*) as fallos
            FROM intentos
            WHERE LOWER(tipo) = 'fallido' OR LOWER(tipo) = 'f'
            GROUP BY usuario
            HAVING fallos >= %s
        """
        cursor.execute(sql, (umbral,))
        rows = cursor.fetchall()
        return rows
    except Error as e:
        messagebox.showerror("Error MySQL", f"Error al generar alertas:\n{e}")
        return []
    finally:
        cursor.close()
        conn.close()

# -----------------------------
# FUNCIONES DE LA INTERFAZ
# -----------------------------
def registrar_intento_gui():
    usuario = entry_usuario.get().strip()
    ip = entry_ip.get().strip()
    servidor = entry_servidor.get().strip()
    tipo = combo_tipo.get().strip()

    if not (usuario and ip and servidor and tipo):
        messagebox.showwarning("Campos incompletos", "Por favor complete todos los campos.")
        return

    hora_actual = datetime.now().strftime("%Y-%m-%d %H:%M:%S")

    ok = guardar_intento_bd(usuario, ip, tipo, hora_actual, servidor)
    if ok:
        messagebox.showinfo("Registrado", "Intento registrado correctamente.")
        entry_usuario.delete(0, tk.END)
        entry_ip.delete(0, tk.END)
        entry_servidor.delete(0, tk.END)
        combo_tipo.set("")

def ver_reporte_gui():
    datos = obtener_intentos_bd()
    ventana = tk.Toplevel(root)
    ventana.title("Reporte de accesos")
    ventana.geometry("760x400")

    cols = ("ID", "Usuario", "IP", "Tipo", "Hora", "Servidor")
    tree = ttk.Treeview(ventana, columns=cols, show="headings")
    for c in cols:
        tree.heading(c, text=c)
        # ancho por columna
        if c == "Hora":
            tree.column(c, width=180)
        elif c == "Servidor":
            tree.column(c, width=150)
        elif c == "Usuario":
            tree.column(c, width=120)
        else:
            tree.column(c, width=90)

    vsb = ttk.Scrollbar(ventana, orient="vertical", command=tree.yview)
    hsb = ttk.Scrollbar(ventana, orient="horizontal", command=tree.xview)
    tree.configure(yscroll=vsb.set, xscroll=hsb.set)
    tree.grid(row=0, column=0, sticky="nsew")
    vsb.grid(row=0, column=1, sticky="ns")
    hsb.grid(row=1, column=0, sticky="ew")

    ventana.grid_rowconfigure(0, weight=1)
    ventana.grid_columnconfigure(0, weight=1)

    # llenar tabla
    for fila in datos:
        tree.insert("", tk.END, values=fila)

def ver_alertas_gui():
    alertas = obtener_alertas_bd()
    if not alertas:
        messagebox.showinfo("Alertas", "No hay alertas por ahora.")
        return

    texto = ""
    for usuario, fallos in alertas:
        texto += f"⚠ Usuario: {usuario} — Intentos fallidos: {fallos}\n"

    messagebox.showwarning("Alertas detectadas", texto)

# -----------------------------
# INTERFAZ PRINCIPAL (Tkinter)
# -----------------------------
root = tk.Tk()
root.title("Sistema de Monitoreo de Accesos - GUI sencilla")
root.geometry("420x360")
root.resizable(False, False)

titulo = tk.Label(root, text="REGISTRAR INTENTO", font=("Arial", 14, "bold"))
titulo.pack(pady=10)

frm = tk.Frame(root)
frm.pack(padx=20, pady=5, fill="x")

# Usuario
lbl_usuario = tk.Label(frm, text="Usuario:")
lbl_usuario.grid(row=0, column=0, sticky="w")
entry_usuario = tk.Entry(frm)
entry_usuario.grid(row=0, column=1, sticky="ew", padx=6, pady=3)

# IP
lbl_ip = tk.Label(frm, text="IP:")
lbl_ip.grid(row=1, column=0, sticky="w")
entry_ip = tk.Entry(frm)
entry_ip.grid(row=1, column=1, sticky="ew", padx=6, pady=3)

# Servidor
lbl_servidor = tk.Label(frm, text="Servidor:")
lbl_servidor.grid(row=2, column=0, sticky="w")
entry_servidor = tk.Entry(frm)
entry_servidor.grid(row=2, column=1, sticky="ew", padx=6, pady=3)

# Tipo
lbl_tipo = tk.Label(frm, text="Tipo:")
lbl_tipo.grid(row=3, column=0, sticky="w")
combo_tipo = ttk.Combobox(frm, values=["fallido", "exito"], state="readonly")
combo_tipo.grid(row=3, column=1, sticky="ew", padx=6, pady=3)

frm.grid_columnconfigure(1, weight=1)

# Botones
btn_frame = tk.Frame(root)
btn_frame.pack(pady=12)

btn_registrar = tk.Button(btn_frame, text="Registrar intento", width=18, command=registrar_intento_gui)
btn_registrar.grid(row=0, column=0, padx=6, pady=4)

btn_reporte = tk.Button(btn_frame, text="Ver reporte", width=12, command=ver_reporte_gui)
btn_reporte.grid(row=0, column=1, padx=6, pady=4)

btn_alertas = tk.Button(btn_frame, text="Ver alertas", width=12, command=ver_alertas_gui)
btn_alertas.grid(row=0, column=2, padx=6, pady=4)

# Atajo: Enter registra cuando el foco esté en cualquier campo
def on_enter(event):
    registrar_intento_gui()

root.bind("<Return>", on_enter)

# Mensaje pequeño inferior
lbl_info = tk.Label(root, text=f"Conectando a MySQL: {DB_CONFIG['host']}  |  Umbral alertas: {ALERTA_UMBRAL}")
lbl_info.pack(side="bottom", pady=6)

root.mainloop()
