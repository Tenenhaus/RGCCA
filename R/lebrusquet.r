leb=function(x_k,missing,z,sameBlockWeight=TRUE,weight=NULL,argmax=TRUE,graph=FALSE,main=NULL,abscissa=NULL)
{#leb(x_k=A[[j]][,k],missing,z=Z[,j])
 xold=x_k
    n=length(x_k)
    indices_miss=which(missing)
    n_miss=length(indices_miss); 
    n_obs=n-n_miss
    n_inc=n_miss+1
    missing=1:n%in%indices_miss
    indices_obs=(1:n)[!missing]
    x_obs=x_k[indices_obs]
    M1=matrix(0,n,n_miss+1) # n_mis+1 colonne, n lignes
    M1[indices_obs,1]=x_obs
    M1[indices_miss,2:(n_miss+1)]=diag(n_miss)
    v1=rep(0,n);v1[indices_obs]=1
    M2=M1-matrix(v1,ncol=1)%*%matrix(rep(1,n),nrow=1)%*%M1/n_obs
    resSvd=svd(M2)
    #(t(M2)%*%M2)-t(M3)%*%M3
    M3=diag(resSvd$d)%*%t(resSvd$v)
    #solve(M3)-resSvd$v%*%diag(1/(resSvd$d))
    normyres=sqrt(t((t(solve(M3))%*%t(M2)%*%matrix(z,ncol=1)))%*%(t(solve(M3))%*%t(M2)%*%matrix(z,ncol=1)))
    if(argmax)
    {
        yres=sqrt(n)*(t(solve(M3))%*%t(M2)%*%matrix(z,ncol=1))/as.numeric(normyres)
    }
    if(!argmax)
    {
       yres=-sqrt(n)*(t(solve(M3))%*%t(M2)%*%matrix(z,ncol=1))/as.numeric(normyres)
    }
    if(sameBlockWeight){yres=yres/weight}
    # t(yres)%*%yres
    ures=solve(M3)%*%yres
    xres=M2%*%ures
    if(graph)
    {
        if(is.null(abscissa))
        {
            plot(x_k[indices_obs],xres[indices_obs],main=ifelse(is.null(main),"graph",main))
            points(x_k[indices_miss],xres[indices_miss],pch=15,col="red")
         
            abline(a=0,b=1)
        }
        else
        {
            coeff=round(lm(xres[indices_obs]~abscissa[indices_obs])$coefficients,digits=2)
            plot(abscissa[indices_obs],xres[indices_obs],main=paste(ifelse(is.null(main),"graph",main),"a=",coeff[2],"alp=",round(ures[1],digits=2)),xlim=c(min(xres,abscissa,na.rm=T),max(xres,abscissa,na.rm=T)),ylim=c(min(xres,abscissa,na.rm=T),max(xres,abscissa,na.rm=T)))
            points(xold[indices_miss],xres[indices_miss],pch=15,col="red")
            abline(a=0,b=1)
            
           xold=xres  
        }
       
       
    }
    return(xres)
}
