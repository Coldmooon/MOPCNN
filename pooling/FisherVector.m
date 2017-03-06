function [v] = FisherVector(X,C)

%
% X is local features, n*d
% C is kmeans centers, c*d
%
dim = size(X,2);
cc = size(C,1);

% for each local feature, find its center
D = dist_mat(X,C);

k = 5;
[a,idx] = sort(D,2);
a = a(:,1:k);
idx = idx(:,1:k);
sim = exp(-a/10);
sim = normalizeL1(sim);
v = zeros(cc, dim);
for i = 1:size(X,1)
    for j=1:k
        v(idx(i, j),:) = v(idx(i, j),:) + sim(i, j) * (X(i,:) - C(idx(i, j),:));
    end
end

if norm (v) == 0
  v = ones(1,cc*dim);
end
























