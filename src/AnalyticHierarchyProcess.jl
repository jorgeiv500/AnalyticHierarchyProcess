
module AnalyticHierarchyProcess

using Compat:view 

export eigenv,CRA,lmax,ctriads,entropia,vikor

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

return c
     
end
################################################
function entropia(m)  
a=size(m,1)
    k=-1/log(a)
    mnorm=m./sum(m,1)
    mlog=mnorm.*log(mnorm)
    sumcol=sum(mlog,1)
    entropia1=sumcol*k
    diversidad=1-entropia1
    w=(diversidad/sum(diversidad,2))
     return w
end
#################################################
function vikor(a,wi,minmax)  
tamano=size(a,2) #saber cuantos criterios se tienen
    filas=size(a,1)
    vaciomejor=zeros(1,tamano)
    vaciopeor=zeros(1,tamano)
    
    for j=1:tamano
        col=a[:,j]
        if minmax[j]==1
            vaciomejor[j]=maximum(col)
            vaciopeor[j]=minimum(col)
        elseif minmax[j]==0
            vaciomejor[j]=minimum(col)
            vaciopeor[j]=maximum(col)
        end
    end
    println("El vector mejor es=",vaciomejor)
    println("El vector peor es=",vaciopeor)
    
    matrizrs=zeros(filas,tamano)
    for j=1:tamano
        for i=1:filas
            matrizrs[i,j]=
            wi[j]*((vaciomejor[j]-a[i,j])/(vaciomejor[j]-vaciopeor[j]))
        end
    end
    println("La matriz rs es=",matrizrs)
    sj=sum(matrizrs,2)
    rj=maximum(matrizrs,2)
    println("El vector sj=",sj)
    println("El vector rj=",rj)
    qj=zeros(filas,1)
    for i=1:filas
        qj[i]=(0.5*(sj[i]-minimum(sj))/(maximum(sj)-minimum(sj)))+
        (0.5*(rj[i]-minimum(rj))/(maximum(rj)-minimum(rj)))
    end
    println("el indice qj=",qj)
return qj
end
end # module
