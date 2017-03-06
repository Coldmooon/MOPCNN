function [X] = normalizeL1(X)

for i=1:size(X,1)
    if(sum(X(i,:))~=0)
        X(i,:) = X(i,:)/sum(X(i,:)); 
    end
end