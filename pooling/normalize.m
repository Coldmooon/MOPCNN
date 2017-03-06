function X = normalize(X)

for i=1:size(X,1)
    nn = norm(X(i,:));
    if(nn~=0)
        X(i,:) = X(i,:) ./ nn;
    end
end