 n=100;
 m=n;
 %构造迭代矩阵
 t1=linspace(-1,-1,n-1);
 t2=linspace(2,2,n);
 A=diag(t1,1)+diag(t1,-1)+diag(t2);
 j=0;  
 tol=1e-6;
 %标准特征值
 l=zeros(n,1);
 for i=1:n
     l(i)=2*(1-cos(i*pi/(n+1)));
 end
 for m=n:(-1):2
   
     %j=1;
     %n=100
     while abs(A(m,m-1))>tol*min(abs(A(m,m)),abs(A(m-1,m-1)))
          A=QR_yin(A);
          %error(j)=norm(sort(diag(A))-l);
           j=j+1;
     end
    lamda(m)=A(m,m);
    A=A(1:m-1,1:m-1);
 end
 lamda(1)=A;
 error=norm(sort(lamda')-l);
 j
 