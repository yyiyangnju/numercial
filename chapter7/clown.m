%С��ͼ
load clown.mat;
[U,S,V]=svd(X);
colormap('gray'); %��û�в�𲻴󣬾͵�һ���ǻ�ɫ
K=[5 10 30 70];
n=length(K);
for i=1:n
    k=K(i);
    figure(i)
   
    image(U(:,1:k)*S(1:k,1:k)*V(:,1:k)');
end
figure(n+1)
image(X);
%����ǵ�80���Ѿ���ԭͼ�����
