%SnµÄ¼ÆËã
function s=S(T,lamda)
n=size(T,1);
s=0;
p=zeros(n+1);
p(1)=1;
if p(2)>0
    s=s+1;
end
p(2)=T(1,1)-lamda;
for i=3:n+1
    p(i)=(T(i-1,i-1)-lamda)*p(i-1)-T(i-2,i-1)^2*p(i-2);
    if p(i-1)==0
        s=s+1;
    else if p(i)*p(i-1)>0
            s=s+1;
        end
    end
end
end

    
            
            
        
    