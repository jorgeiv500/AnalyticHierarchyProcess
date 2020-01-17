# AnalyticHierarchyProcess


El paquete `AnalyticHierarchyProcess` provee funciones para desarrollar tecnicas de toma de decisiones multicriterio como VIKOR, DEMATEL, AHP, Entropia.

## Instalación

Tal como se describe el manual de julia, para instalar un paquete no registrado se utiliza el comando `Pkg.clone()`, de la siguiente manera:

```julia
Pkg.clone("https://github.com/jorgeiv500/AnalyticHierarchyProcess.git")

```

Es requerida la versión 0.5 o superior (puede encontrar aquí las instrucciones de instalación [here][version]).


## Uso

Este paquete cuenta con 
This package alow us to compute the eigenweigth from a n*n pairwaise comparison matrix and evaluate the inconsistency in the matrix.

eigenv(x) = compute the eigenweigth from a n*n pairwaise comparison matrix
CRA(x) = Consistency ratio from a n*n pairwaise comparison matrix
triads(x,t) =  evaluate the inconsistency in all circular triads from a n*n pairwaise comparison matrix. 
## Example

The simple example below is based on https://en.wikipedia.org/wiki/Analytic_hierarchy_process_–_leader_example#Pairwise_comparisons 
for one matrix.

![Sensitivity Report](https://upload.wikimedia.org/wikipedia/commons/3/32/AHP_TDHExperienceMatrixWPriorities.png)

```julia
using AnalyticHierarchyProcess


Pairwaise=[1 1/4 4;
           4  1  9;
           1/4 1/9 1]
t=
println(eigenv(Pairwaise))
println(CRA(Pairwaise))
println(triads(Pairwaise,t))
```

Out[6]:
3×1 Array{Float64,2}:
 0.217166 
 0.717065 
 0.0657693
 
 ```julia
 INFORME DE RESULTADOS 
    ________CRITERIOS___________________________

    1. LAMBDA MAX=3.0371848745375076

    2. CI =0.018592437268753814

    3. SIZE=3

    4. CR =0.035754687055295796

    5. El Wi de criterios es=[0.217166; 0.717065; 0.0657693]
     ```
