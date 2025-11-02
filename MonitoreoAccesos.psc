// =====================
// Autor: Jefri
// Tema: Sistema de Monitoreo de Accesos con Subprocesos y Arreglos
// Objetivo: Registrar y analizar intentos de acceso de múltiples usuarios a servidores,
// detectando fallos consecutivos y generando reportes y alertas.
// =====================
// --- Subproceso para registrar intentos ---
SubProceso RegistrarIntento(intentos_usuario, intentos_servidor, intentos_IP, intentos_tipo, intentos_hora, totalIntento Por Referencia, MAX_REGISTROS)
    Si totalIntento < MAX_REGISTROS Entonces
        totalIntento <- totalIntento + 1
        Escribir "Ingrese el nombre de usuario:"
        Leer intentos_usuario[totalIntento]
        Escribir "Ingrese el nombre del servidor:"
        Leer intentos_servidor[totalIntento]
        Escribir "Ingrese la IP:"
        Leer intentos_IP[totalIntento]
        Escribir "Ingrese tipo de intento (Correcto/Fallido):"
        Leer intentos_tipo[totalIntento]
        Escribir "Ingrese hora (hh:mm):"
        Leer intentos_hora[totalIntento]
        Escribir "? Intento registrado."
    SiNo
        Escribir "?? Límite de registros alcanzado."
    FinSi
FinSubProceso

// --- Subproceso para generar alertas ---
SubProceso GenerarAlertas(intentos_usuario, intentos_tipo, totalIntento, UMBRAL_FALLOS_CONSECUTIVOS)
    Definir i, contador Como Entero
    Definir prevUser, tipoActual Como Cadena
    Definir alertaFallosConsecutivos Como Logico
    alertaFallosConsecutivos <- Falso
    contador <- 0
    prevUser <- ""
    
    Escribir ""
    Escribir "===== ALERTAS ====="
    
    Para i <- 1 Hasta totalIntento Con Paso 1 Hacer
        tipoActual <- Minusculas(intentos_tipo[i])
        Si tipoActual = "fallido" O tipoActual = "fallo" Entonces
            Si intentos_usuario[i] = prevUser Entonces
                contador <- contador + 1
            SiNo
                prevUser <- intentos_usuario[i]
                contador <- 1
            FinSi
        SiNo
            prevUser <- intentos_usuario[i]
            contador <- 0
        FinSi
		
        Si contador >= UMBRAL_FALLOS_CONSECUTIVOS Entonces
            alertaFallosConsecutivos <- Verdadero
        FinSi
    FinPara
    
    Si alertaFallosConsecutivos Entonces
		Escribir "?? ALERTA: El usuario ",prevUser, " ha tenido ", contador, " intento fallido consecutivo."
    SiNo
        Escribir "No hay alertas."
    FinSi
FinSubProceso


// --- Subproceso para mostrar reporte ---
SubProceso MostrarReporte(intentos_usuario, intentos_servidor, intentos_IP, intentos_tipo, intentos_hora, totalIntento)
    Definir i Como Entero
    Escribir ""
    Escribir "===== REPORTE DE ACCESOS ====="
    Si totalIntento = 0 Entonces
        Escribir "No hay registros."
    SiNo
        Para i <- 1 Hasta totalIntento Con Paso 1 Hacer
            Escribir "Intento #", i, ":"
            Escribir " Usuario: ", intentos_usuario[i]
            Escribir " Servidor: ", intentos_servidor[i]
            Escribir " IP: ", intentos_IP[i]
            Escribir " Tipo: ", intentos_tipo[i]
            Escribir " Hora: ", intentos_hora[i]
            Escribir "------------------------"
        FinPara
    FinSi
FinSubProceso

// ==============================================
// Algoritmo principal
// ==============================================
Algoritmo MonitoreoAccesos
    // --- Variables ---
    Definir MAX_REGISTROS, totalIntento, opcion, UMBRAL_FALLOS_CONSECUTIVOS Como Entero
    MAX_REGISTROS <- 2
    totalIntento <- 0
    UMBRAL_FALLOS_CONSECUTIVOS <- 1  // Cambia el valor según el umbral que desees
	
    // --- Arreglos ---
    Dimension intentos_usuario[MAX_REGISTROS]
    Dimension intentos_servidor[MAX_REGISTROS]
    Dimension intentos_IP[MAX_REGISTROS]
    Dimension intentos_tipo[MAX_REGISTROS]
    Dimension intentos_hora[MAX_REGISTROS]
	
    Repetir
        Escribir ""
        Escribir "==== MENU PRINCIPAL ===="
        Escribir "1. Registrar intento"
        Escribir "2. Generar alertas"
        Escribir "3. Mostrar reporte"
        Escribir "4. Salir"
        Leer opcion
		
        Segun opcion Hacer
            1:
                RegistrarIntento(intentos_usuario, intentos_servidor, intentos_IP, intentos_tipo, intentos_hora, totalIntento, MAX_REGISTROS)
            2:
                GenerarAlertas(intentos_usuario, intentos_tipo, totalIntento, UMBRAL_FALLOS_CONSECUTIVOS)
            3:
                MostrarReporte(intentos_usuario, intentos_servidor, intentos_IP, intentos_tipo, intentos_hora, totalIntento)
            4:
                Escribir "Saliendo..."
            De Otro Modo:
                Escribir "Opción inválida."
        FinSegun
    Hasta Que opcion = 4
FinAlgoritmo
