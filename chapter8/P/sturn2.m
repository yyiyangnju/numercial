%用二分法和原点位移反幂法求解在（1，2）间的特征值
n=100;
T=diag(ones(n,1)*2)+diag(ones(n-1,1)*(-1),1)+diag(ones(n-1,1)*(-1),-1);
%特征值分离
z=linspace(0.99,2.11,200);
k=0;
x0=ones(n,1);
TOL=1e-6;
N=10000;
for i=1:length(z)-1
    l=S(T,z(i));
    r=S(T,z(i+1));
    num=l-r;
    if num==1
        k=k+1;
        space(k,1:4)=[z(i),z(i+1),l,r];
    end
end

lamda=zeros(1,k);
tol=1e-2;
for i=1:k
    %二分法
    while space(i,2)-space(i,1)>tol
        c=(space(i,2)+space(i,1))/2;
        if S(T,c)==l
            space(i,1)=c;
        else
            space(i,2)=c;
        end
    end
    %反幂法
    lamda(i)=space(i,1)+1/inverse(space(i,1)+0.00001,n);
end

eigenvalue=zeros(1,k);
eigenvaluef=eig(T);
m=0;
for i=1:n
    if eigenvaluef(i)>=1&&eigenvaluef(i)<=2
        m=m+1;
        eigenvalue(m)=eigenvaluef(i);
    end
end
left=space(:,1);
error=norm(eigenvalue-lamda);
figure
plot(eigenvalue,'-')
hold on
plot(lamda,'o')
hold on
plot(left,'*')
legend('真实特征值','求得特征值','二分法求得近似')







