%ѭ��Jiacobi
%Ŀ�����
n=10;
T=diag(ones(n,1)*2)+diag(ones(n-1,1)*(-1),1)+diag(ones(n-1,1)*(-1),-1);
%��׼����ֵ
% lamda=zeros(1,n);
% for i=1;n
%     lamda(i)=4*(sin(i*pi/(2*(n+1))))^2;
% end
lamda=eig(T);
% %��ֵ
% maxx=[1,2]; %max��¼a_pq��λ�� (�У���)
% maxi(1)=T(maxx(1),maxx(2));%��¼��Ԫ
% maxleft=T(1,1);
% maxdown=T(2,2);
% tol=1e-6;%ͣ����׼
% k=1; %ѭ��ָ��
k=1;
while max(max(abs(T-diag(diag(T)))))>1e-6 %ͣ����׼
    %һ��Givens��ת
    for i=1:n-1
        for j=i+1:n
            %һ��Givens��ת
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
    lamdaf(k)=T(1,1);  %��һ������ֵ
    lamdal(k)=T(n,n);   %���һ������ֵ
    error(k)=norm(sort(diag(T))-lamda);  %���Խ�����������ʵ����ֵ�Ƚ�
    k=k+1;
    %     %Ѱ����һ����Ԫ
    % %     maxx=[2,1];
    % %     maxi=T(maxx);
    %     k=k+1;
    %     maxx=[1,2];
    %     maxi(k)=T(maxx(1),maxx(2));%��¼��Ԫ
    %     for i=1:n   %��ָ��
    %         for j=1:n   %��ָ��
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
eigenvalue=diag(T); %����ֵ

% figure(1)
% plot(maxi,'.-')
% xlabel('��������')
% ylabel('��Ԫ')
% title('��Ԫ')
% figure(2)
% plot(errorf,'.-')
% xlabel('��������')
% ylabel('��һ������ֵ���')
% title('��һ������ֵ����½�����')
% figure(3)
% plot(errorl,'.-')
% xlabel('��������')
% ylabel('��n������ֵ���')
% title('��n������ֵ����½�����')
figure(4)
semilogy(error,'.')
xlabel('��������');
ylabel('��һ������ֵ');
