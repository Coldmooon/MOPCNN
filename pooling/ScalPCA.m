function [XX,pc] = ScalPCA(X, dim)

rr = randperm(size(X,1));

if(size(X,1)>=5000)
	A = X(rr(1:5000),:);
else
	A = X(rr(1:1000),:);
end

B = A;
XX = X*B';
K = B*B';
[V,l] = eig(double(K));
[a,b] = sort(diag(l),'descend');
l = diag(a);
V = V(:,b);
XX = XX*V*pinv(l)*l.^(1/2);
pc = B'*V*pinv(l)*l.^(1/2);

XX = XX(:,1:dim);
pc = pc(:,1:dim);















