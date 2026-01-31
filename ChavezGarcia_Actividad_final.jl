using Plots, Statistics, Random, StatsBase

# 1. GENERADOR DE EULER
function phi_chavez(t)
    t_c = clamp(t, 1e-10, 1.0)
    return t_c <= 0.25 ? 1.0 - (8/3)*t_c : (4/9)*(1.0 - t_c)
end

theta = 2.5
psi(t) = (-log(phi_chavez(t)))^theta
function inv_psi(z)
    phi_val = exp(-abs(z)^(1/theta))
    return phi_val >= 1/3 ? 3/8*(1-phi_val) : clamp(1-9/4*phi_val, 0.0, 1.0)
end

# 2. SIMULACIÓN SIN ERRORES DE SINTAXIS
function simular_copula(n)
    Random.seed!(42)
    u = rand(n)
    w = rand(n)
    v = [inv_psi(abs(psi(w[i]) - psi(u[i]))) for i in 1:n]
    
    rho = corspearman(u, v) 
    sw = 12 * mean(abs.(v .- u)) / 2 
    return (u, v, rho, sw)
end

escenarios = [10_000, 100_000, 1_000_000, 10_000_000]
plots = []

println("--- REINTENTANDO MARATÓN (ELIMINANDO ERROR DE ROUND) ---")

for n in escenarios
    println("Calculando para $n puntos...")
    u, v, r, s = simular_copula(n)
    
    # Redondeamos manualmente para evitar el MethodError
    r_txt = (floor(r * 10000) / 10000)
    s_txt = (floor(s * 10000) / 10000)
    
    idx = 1:min(n, 10000)
    p = scatter(u[idx], v[idx], 
                markersize=1, alpha=0.3, aspect_ratio=:equal,
                title="n=$n\nRho=$r_txt, SW=$s_txt",
                legend=false)
    push!(plots, p)
end

# 3. DESPLIEGUE DE LAS 4 GRÁFICAS
plot(plots..., layout=(2,2), size=(900,900))