
module AnalyticHierarchyProcess

using Compat:view , DataFrames

export eigenv,CRA,lmax,ctriads

# Funtion lambda max###############################################################
function lmax(x)  
data = x
Z=data
A=sum(data,1)
Anorm=data./A
tam=length(Z[1,:])
wprom=sum(Anorm,2)/tam
Awprom=Z*wprom
lambdamax=mean(Awprom./wprom)
return lambdamax          
end

#Function weigth###############################################################
function eigenv(x)  
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
if tam>=3
M=Z^100
sumafilas=sum(M,2)
WCRIT=sumafilas/sum(sumafilas)
else
WCRIT=[1/tam;1/tam]
end

return   WCRIT
    
end

function CRA(x)  ############################################################################################
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
function ctriads(t,Criteria) #####################################################################
     c=[]
for T=1:length(t)

ai=Criteria[t[T][1], t[T][2]]
aj=Criteria[t[T][1], t[T][3]]
ak=Criteria[t[T][2], t[T][3]]

m=[1    ai   aj
  1/ai  1    ak
  1/aj  1/ak 1]
 co=CRA(m)
push!(c,co)
end
print(c)
dt=DataFrame(triad=t,CR=c)
order=sort!(dt, cols = (order(:CR, rev = true)))

return order
     
end
end # module
