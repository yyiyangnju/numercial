%小丑图
load clown.mat;
[U,S,V]=svd(X);
colormap('gray'); %有没有差别不大，就第一张是灰色
K=[5 10 30 70];
n=length(K);
for i=1:n
    k=K(i);
    figure(i)
   
    image(U(:,1:k)*S(1:k,1:k)*V(:,1:k)');
end
figure(n+1)
image(X);
%结果是到80就已经和原图差不多了
