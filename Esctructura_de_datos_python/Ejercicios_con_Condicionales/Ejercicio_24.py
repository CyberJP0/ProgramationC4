#24. Contar cuántos números pares hay entre 1 y 20.

contador = 0
for i in range(1, 21):
    if i % 2 == 0:
        contador += 1
print(f"La cantidad de números pares entre 1 y 20 es: {contador}")
