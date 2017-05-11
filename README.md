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

