install.packages("lpSolve")
# Importar la libreria
library(lpSolve)

# Se guardan en una matriz los coeficientes de la función objetivo
funcion_objetivo <- c(280, 420)
funcion_objetivo
# Asignar los coeficientes de las desigualdades
# 10x1 + 5x2  >= 30         10   5     (1)
# 10x1 + 5x2  >= 25         10   5     (2)
# 5x1 + 10x2  >= 20         5   10     (3)
# Definir el número de filas en 3
restriciones_derecho <- matrix(c(10,5,10,5,5,10), nrow = 3, byrow = T)

# Se muestra el valor de la matriz
restriciones_derecho

# Se guarda en una matriz los simbolos de las desigualdades
restriccion.direccion <- c(">=", ">=", ">=")
restriccion.direccion
# Asignar los valores del lado derecho de las desigualdades
# 10x1 + 5x2  >= 30             30     (1)
# 10x1 + 5x2  >= 25             25     (2)
# 5x1 + 10x2  >= 20             20     (3)
lado_derecho.restriccion <- c(30, 25, 20)
lado_derecho.restriccion
# Se ejecuta la instrucción para mostrar el resultado que maximize la función
lp(direction = "min", objective.in = funcion_objetivo, const.mat =restriciones_derecho, const.dir = restriccion.direccion, const.rhs = lado_derecho.restriccion, int.vec = c(1, 2, 3, 4, 5), all.int = T)

# Se ejecuta la instrucción para mostrar los valores de x1 y x2.
lp(direction = "min", objective.in = funcion_objetivo, const.mat =restriciones_derecho, const.dir = restriccion.direccion, const.rhs = lado_derecho.restriccion, int.vec = c(1, 2, 3, 4, 5), all.int = T)$solution

