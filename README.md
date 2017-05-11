# AnalyticHierarchyProcess


The `AnalyticHierarchyProcess` package currently provides the eigenweigths consistency index and xonsistency ratio from a n*n matrix:


## Installation

As described in the julia manual, to [install unregistered packages][unregistered], use `Pkg.clone()` with the repository url:

```julia
Pkg.clone("https://github.com/jorgeiv500/AnalyticHierarchyProcess")
```

Julia version 0.5 or higher is required (install instructions [here][version]).

## Usage

This package alow us to compute the eigenweigth from a n*n pairwaise comparison matrix

## Example

The simple example below is based on https://en.wikipedia.org/wiki/Analytic_hierarchy_process_–_leader_example#Pairwise_comparisons 
for one matrix.

![Sensitivity Report](https://upload.wikimedia.org/wikipedia/commons/3/32/AHP_TDHExperienceMatrixWPriorities.png)

```julia
using AnalyticHierarchyProcess


Pairwaise=[1 1/4 4;
           4  1  9;
           1/4 1/9 1]

eigenv(Pairwaise)


        
        INFORME DE RESULTADOS 
    ________CRITERIOS___________________________

    1. LAMBDA MAX=3.0371848745375076

    2. CI =0.018592437268753814

    3. SIZE=3

    4. CR =0.035754687055295796

    5. El Wi de criterios es=[0.217166; 0.717065; 0.0657693]

Out[6]:
3×1 Array{Float64,2}:
 0.217166 
 0.717065 
 0.0657693
```
