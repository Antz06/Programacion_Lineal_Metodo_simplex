# Ejemplo:
# Un comerciante de frutas necesita 30 cajas de naranjas, 25 de plátanos
# y 20 de manzanas. Dos mayoristas están en condiciones de satisfacer sus
# necesidades, pero solo venden la fruta en contenedores completos. 
# El mayorista “Argiabasto” envía en cada contenedor 10 cajas de naranjas, 
# 10 de plátanos y 5 de manzanas. El mayorista “Frutos con sabor a México” 
# envía en cada contenedor 5 cajas de naranjas, 5 de plátanos y 10 de manzanas. 
# Sabiendo que el mayorista “Argiabasto” se encuentra a 280 Km. de distancia y 
# el mayorista “Frutos con sabor a México” a 420 Km., calcular cuántos 
# contenedores habrá de comprar a cada mayorista, con el objeto de ahorrar 
# tiempo y dinero, reduciendo al mínimo la distancia.

#Mayoristas         Cajas/naranjas   Cajas/plátanos   Cajas/manzanas    Distancia
#Argiabasto              10               10              5               280 km
#Frutos con              5                5               10              420 km
#sabor a México

# Resolución del problema de programación líneal a través del método gráfico

# Paso 1: Identificar las variables básicas
# x1 = Contenedores de Argiabasto 
# x2 = Contenedores de Frutos con sabor a México

# Paso 2: Identificar las variables "cj"
# c1 = 280 km/ distancia del mayorista Argiabasto
# c2 = 420 km/ distancia del mayorista Frutos con sabor a México

# Paso 3: función objetivo
# Min z = (280km/Argiabasto)(x1Argiabasto) + (420km/Frutos)((x2Frutos)
# Min z = 280x1 + 420x2

# Paso 4: Identificar "bj"
# b1 = Cantidad mínima requerida de naranjas (30)
# b2 = Cantidad mínima requerida de plátanos (25)
# b3 = Cantidad mínima requerida de manzanas (20)

# Paso 5: Identificar "aij"
# b1 = Cantidad mínima requerida de naranjas (30)
#   * Argiabasto ofrece en cada contenedor 10 cajas
#   * Frutos con sabor a México ofrece en cada contenedor 5 cajas
# b2 = Cantidad mínima requerida de plátanos (25)
#   * Argiabasto ofrece en cada contenedor 10 cajas
#   * Frutos con sabor a México ofrece en cada contenedor 5 cajas
# b3 = Cantidad mínima requerida de manzanas (20)
#   * Argiabasto ofrece en cada contenedor 5 cajas
#   * Frutos con sabor a México ofrece en cada contenedor 10 cajas

# Paso 6: Armar restricciones
# b1 = Cantidad mínima requerida de naranjas (30)
#    = (10 cajas/Argiabasto)(x1.A) + (5 cajas/Frutos)(x2.F)
#    = 10x1 + 5x2 >= 30
# b2 = Cantidad mínima requerida de plátanos (25)
#    = (10 cajas/Argiabasto)(x1.A) + (5 cajas/Frutos)(x2.F)
#    = 10x1 + 5x2 >= 25
# b3 = Cantidad mínima requerida de manzanas (20)
#    = (5 cajas/Argiabasto)(x1.A) + (10 cajas/Frutos)(x2.F)
#    = 5x1 + 10x2 >= 20

# Paso 7: No negatividad
# x1, x2 >= 0

# Paso 8: Modelo general
# Min z = 280x1 + 420x2
# s.a.
# 10x1 + 5x2 >= 30  (1)
# 10x1 + 5x2 >= 25  (2)
# 5x1 + 10x2 >= 20  (3)
#
# x1, x2 >= 0

# Paso 9 Gráficar el sistema.

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
# Se ejecuta la instrucción para mostrar el resultado que minimize la función
lp(direction = "min", objective.in = funcion_objetivo, const.mat =restriciones_derecho, const.dir = restriccion.direccion, const.rhs = lado_derecho.restriccion, int.vec = c(1, 2, 3, 4, 5), all.int = T)

# Se ejecuta la instrucción para mostrar los valores de x1 y x2.
lp(direction = "min", objective.in = funcion_objetivo, const.mat =restriciones_derecho, const.dir = restriccion.direccion, const.rhs = lado_derecho.restriccion, int.vec = c(1, 2, 3, 4, 5), all.int = T)$solution

