# --------------------------------------------
# PROYECTO FINAL PYTHON
# BY JEFRY
# --------------------------------------------

# Librerías
import logging
from colorama import Fore, Style, init
from tabulate import tabulate
from datetime import datetime
from rich.console import Console
from rich.table import Table
from rich import box

init(autoreset=True)
console = Console()

# -----------------------------
# LISTAS PARA LOS PARÁMETROS
# -----------------------------
intentos_usuarios = []
intentos_ip = []
intentos_tipo = []
intentos_hora = []
intentos_servidor = []

# -----------------------------
# CONFIGURACIÓN DE LOGGING
# -----------------------------
logging.basicConfig(
    filename="accesos.log",
    level=logging.INFO,
    format="%(asctime)s - %(levelname)s - %(message)s",
)

# -----------------------------
# FUNCIÓN PARA REGISTRAR INTENTOS
# -----------------------------
def registrar_intentos():
    usuario = input("Introduzca su usuario: ")
    intentos_usuarios.append(usuario)

    ip = input("Introduzca su IP: ")
    intentos_ip.append(ip)

    servidor = input("Introduzca su servidor: ")
    intentos_servidor.append(servidor)

    hora_actual = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    intentos_hora.append(hora_actual)

    tipo = input("fallido/exito: ")
    intentos_tipo.append(tipo)

    print(Fore.GREEN + "Intento registrado correctamente!")

    # Guardar en archivo log
    logging.info(
        f"Intento registrado | Usuario: {usuario} | IP: {ip} | Servidor: {servidor} | Tipo: {tipo}"
    )

# -----------------------------
# GENERAR ALERTAS
# -----------------------------
def general_alertas():
    contador_fallos = 0
    prev_user = ""
    UMBRAL_INTENTOS = 2

    for i in range(len(intentos_usuarios)):
        usuario_actual = intentos_usuarios[i]
        tipo_actual = intentos_tipo[i].lower()

        if usuario_actual == prev_user:
            if tipo_actual == "fallido":
                contador_fallos += 1
            else:
                contador_fallos = 0
        else:
            contador_fallos = 1 if tipo_actual == "fallido" else 0
            prev_user = usuario_actual

        if contador_fallos >= UMBRAL_INTENTOS:
            print(
                Fore.RED
                + Style.BRIGHT
                + f"\n❗ ALERTA: El usuario {usuario_actual} tiene {contador_fallos} intentos fallidos consecutivos.\n"
            )

# -----------------------------
# MOSTRAR REPORTE (Rich)
# -----------------------------
def mostrar_reporte():
    if len(intentos_usuarios) == 0:
        console.print("[bold yellow]----- NO SE HAN REGISTRADO INTENTOS -----[/]")
        return

    tabla = Table(title="REPORTE DE ACCESOS", box=box.DOUBLE_EDGE, style="cyan")

    tabla.add_column("#", justify="center", style="bold white")
    tabla.add_column("Usuario", style="bold green")
    tabla.add_column("IP", style="yellow")
    tabla.add_column("Tipo", style="bold")
    tabla.add_column("Hora", style="magenta")
    tabla.add_column("Servidor", style="cyan")

    # EN ESTA PARTE DECORAMOS UN POCO LA SALIDA DE TEXTO.
    for i in range(len(intentos_usuarios)):
        color_tipo = "red" if intentos_tipo[i].lower() == "fallido" else "green"

        tabla.add_row(
            str(i + 1),
            intentos_usuarios[i],
            intentos_ip[i],
            f"[{color_tipo}]{intentos_tipo[i]}[/]",
            intentos_hora[i],
            intentos_servidor[i],
        )

    console.print(tabla)

# -----------------------------
# MENÚ PRINCIPAL
# -----------------------------
while True:
    print(Fore.CYAN + Style.BRIGHT + "------ MENU PRINCIPAL ------")
    print("Seleccione una opción:\n")
    print("1. REGISTRAR INTENTO")
    print("2. GENERAR ALERTAS")
    print("3. MOSTRAR REPORTE")
    print("4. SALIR\n")

    opcion = input(Fore.GREEN + "Introduzca una opción: ")

    if opcion == "1":
        registrar_intentos()

    elif opcion == "2":
        general_alertas()

    elif opcion == "3":
        mostrar_reporte()

    elif opcion == "4":
        print(Fore.YELLOW + "SALIENDO DEL SISTEMA...")
        break

    else:
        print(Fore.RED + "---- OPCIÓN INVÁLIDA ----\n")

