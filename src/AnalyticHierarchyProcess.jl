__precompile__()
module AnalyticHierarchyProcess

# package code goes here

using Compat

using ExcelReaders
using PyPlot
export 

grupal 

function grupal(X,Y,D)  

data = readxlsheet("AHP.xlsx", "criterios")
Z=data
A=sum(data,1)
Anorm=data./A
tam=length(Z[1,:])
wprom=sum(Anorm,2)/tam
Awprom=Z*wprom
lambdamax=mean(Awprom./wprom)
println("
    ________CRITERIOS___________________________")
println("
    1. LAMBDA MAX=",lambdamax)
CI=(lambdamax-tam)/(tam-1)

println("
    2. CI =",CI)
println("
    3. SIZE=",tam)

if tam==1  
    CR=CI/0.00
elseif tam==2  
    CR=CI/0.00
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
M=Z^300
sumafilas=sum(M,2)
WCRIT=sumafilas/sum(sumafilas)
println("
    5. El Wi de criterios es=",WCRIT)

z=Y

hojas = String[];
for i=1:z

    push!(hojas,"Hoja"*"$(i)")
 
end

######################################################################################
i=1
#############################################
c=zeros(X,Y)#
#############################################

for Z in hojas   

######################################################################################
    data=readxlsheet("AHP.xlsx", (Z))
A=sum(data,1)
Anorm=data./A
tam=length(data[1,:])
wprom=sum(Anorm,2)/tam
Awprom=data*wprom
lambdamax=mean(Awprom./wprom)
println("
        ________START _________________________________________________",i)
println("
        1.LAMBDA MAX= ",lambdamax)
CI=(lambdamax-tam)/(tam-1)
println("
        2. CONSISTENCY INDEX = ",CI)
println("
        3. SIZE= ",tam)
if tam==1  
    CR=CI/0.00
elseif tam==2  
    CR=CI/0.00
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
        4. CONSISTENCY RATIO=",CR)
M=data^300
sumafilas=sum(M,2)
Wi=sumafilas/sum(sumafilas)
println("
        5. WEIGTH =",Wi)
for j = 1:tam
    c[j,i]=Wi[j]  
    end
        i+=1
    
        end   

F=c*WCRIT
println("
         _____________________________________________________
          El ranking final de alternativas es  
         _____________________________________________________"
                             ,F)
println(c)   
    
FF=F'
W=squeeze(FF, 1)

x = [1:1:tam;]
y = [W;]
fig = figure("pyplot_barplot",figsize=(5,4))

b = barh(x,y,color="blue",align="center",alpha=0.8)

axis("tight")

grid("on")
xlabel("Importancia")
ylabel("Alternativas")

suptitle("Ranking alternativas")
savefig("plot.svg")
    
end

end # module
