function [m,vector,error,i] = powermethod(v,A,lamda0,vector0) %��ʼ����v���Ͷ�Ӧ�ľ���A,��׼����ֵ����׼��������
 vector=zeros(size(A,1),1); %����������
 error=zeros(1,3);%��¼��ʵ���仯
 distance=zeros(1,3);
 t=1; %��¼ÿһ�ε����
 i=1; %ָ��
 vector=v;
 while t>1e-6
     u=A*vector;
     [a,d]=max(abs(u));
     m=u(d);
     vector=u/m;
     t=abs(m-lamda0);  %��ʵ���
     error(i)=t;  
    %distance(i)=sqrt(1-vector'*vector0/(norm(vector)));%norm((vector/norm(vector))*(vector/norm(vector))'-(vector0/norm(vector0))*(vector0/norm(vector0))');  %�������֮ǰҪ�Ȱ�ÿһ����λ��
     i=i+1;
 end
 
 figure(1)
 semilogy(error,'o')
 title('����ֵ���仯');
 xlabel('��������');
 ylabel('���')
 
 figure(2)
 semilogy(distance,'o')
 title('�����ӿռ����仯')
 xlabel('��������')
 ylabel('�ӿռ����')
     
end

