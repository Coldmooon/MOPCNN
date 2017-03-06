function D=dist_mat(P1, P2)
%
% Euclidian distances between vectors

n1 = size(P1,1);
n2 = size(P2,1);

norm1 = zeros(n1,1);
norm2 = zeros(n2,1);

for i=1:n1
    norm1(i) = norm(P1(i,:)).^2;
end
for i=1:n2
    norm2(i) = norm(P2(i,:)).^2;
end

D = -1 * P1 * P2';

for i=1:n1
    for j=1:n2
        D(i,j) = D(i,j) + norm1(i) + norm2(j);
    end
end





