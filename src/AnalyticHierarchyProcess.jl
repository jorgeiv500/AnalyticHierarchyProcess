
module AnalyticHierarchyProcess

# package code goes here

using Compat:view


export eigenv,CRA


function print_rgb(r, g, b, t)
           print("\e[1m\e[38;2;$r;$g;$b;249m",t)
       end



function eigenv(x)  

data = x
Z=data
A=sum(data,1)
Anorm=data./A
tam=length(Z[1,:])
wprom=sum(Anorm,2)/tam
Awprom=Z*wprom
lambdamax=mean(Awprom./wprom)
     print_with_color(:blue,"
        
        INFORME DE RESULTADOS ")  
println("
    ________CRITERIOS___________________________")
println("
    1. LAMBDA MAX=",lambdamax)
if tam==1
                      CI=0
           elseif tam==2
                      CI=0
           else
           CI=(lambdamax-tam)/(tam-1)
           end

println("
    2. CI =",CI)
println("
    3. SIZE=",tam)

if tam==1  
    CR=0.00
elseif tam==2  
    CR=0.00
elseif tam==3  
    CR=CI/0.52
elseif tam==4
    CR=CI/0.89
elseif tam==5
    CR=CI/1.11
elseif tam==6
    CR=CI/1.25
elseif tam==7
    CR=CI/1.35
elseif tam==8
    CR=CI/1.40    
elseif tam==9  
    CR=CI/1.45
elseif tam==10
    CR=CI/1.49
end

println("
    4. CR =",CR)
M=Z^100
sumafilas=sum(M,2)
WCRIT=sumafilas/sum(sumafilas)
println("
    5. El Wi de criterios es=",WCRIT)

return   WCRIT
    
end

function CRA(x)  
data = x
Z=data
A=sum(data,1)
Anorm=data./A
tam=length(Z[1,:])
wprom=sum(Anorm,2)/tam
Awprom=Z*wprom
lambdamax=mean(Awprom./wprom)
 
if tam==1
                      CI=0
           elseif tam==2
                      CI=0
           else
           CI=(lambdamax-tam)/(tam-1)
           end

if tam==1  
    CR=0.00
elseif tam==2  
    CR=0.00
elseif tam==3  
    CR=CI/0.52
elseif tam==4
    CR=CI/0.89
elseif tam==5
    CR=CI/1.11
elseif tam==6
    CR=CI/1.25
elseif tam==7
    CR=CI/1.35
elseif tam==8
    CR=CI/1.40    
elseif tam==9  
    CR=CI/1.45
elseif tam==10
    CR=CI/1.49
end

return CR
end
end # module
