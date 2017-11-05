%循环Jiacobi
%目标矩阵
n=10;
T=diag(ones(n,1)*2)+diag(ones(n-1,1)*(-1),1)+diag(ones(n-1,1)*(-1),-1);
%标准特征值
% lamda=zeros(1,n);
% for i=1;n
%     lamda(i)=4*(sin(i*pi/(2*(n+1))))^2;
% end
lamda=eig(T);
% %初值
% maxx=[1,2]; %max记录a_pq的位置 (行，列)
% maxi(1)=T(maxx(1),maxx(2));%记录主元
% maxleft=T(1,1);
% maxdown=T(2,2);
% tol=1e-6;%停机标准
% k=1; %循环指标
k=1;
while max(max(abs(T-diag(diag(T)))))>1e-6 %停机标准
    %一波Givens旋转
    for i=1:n-1
        for j=i+1:n
            %一次Givens旋转
            b=(T(i,i)-T(j,j))/(2*T(i,j));  %cot(2\theta)
%             if abs(b)>1e307
%                 t=sign(b)/(2*b);
%             end
            if b==0
                sign_b=1;
            else
                sign_b=sign(b);
            end
            t=1/(b+sign_b*sqrt(b^2+1));  %sign(0)=0!!!!!
            c=1/sqrt(1+t^2);
            s=c*t;
            G=[c,s;-s,c];
            T([i,j],:)=G*T([i,j],:);
            T(:,[i,j])= T(:,[i,j])*G';
        end
    end
    lamdaf(k)=T(1,1);  %第一个特征值
    lamdal(k)=T(n,n);   %最后一个特征值
    error(k)=norm(sort(diag(T))-lamda);  %主对角线排序后和真实特征值比较
    k=k+1;
    %     %寻找下一个主元
    % %     maxx=[2,1];
    % %     maxi=T(maxx);
    %     k=k+1;
    %     maxx=[1,2];
    %     maxi(k)=T(maxx(1),maxx(2));%记录主元
    %     for i=1:n   %行指标
    %         for j=1:n   %列指标
    %             if i~=j
    %                 if abs(T(i,j))>abs(maxi(k))
    %                     maxi(k)=T(i,j);
    %                     maxx=[i,j];
    %                 end
    %             end
    %         end
    %     end
    %     maxleft=T(maxx(1),maxx(1));
    %     maxdown=T(maxx(2),maxx(2));
    %     errorf(k-1)=abs(T(1,1)-lamda(1));
    %     errorl(k-1)=abs(T(n,n)-lamda(n));
end
eigenvalue=diag(T); %特征值

% figure(1)
% plot(maxi,'.-')
% xlabel('迭代次数')
% ylabel('主元')
% title('主元')
% figure(2)
% plot(errorf,'.-')
% xlabel('迭代次数')
% ylabel('第一个特征值误差')
% title('第一个特征值误差下降曲线')
% figure(3)
% plot(errorl,'.-')
% xlabel('迭代次数')
% ylabel('第n个特征值误差')
% title('第n个特征值误差下降曲线')
figure(4)
semilogy(error,'.')
xlabel('迭代次数');
ylabel('第一个特征值');
