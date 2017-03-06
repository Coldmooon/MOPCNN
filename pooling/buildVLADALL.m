function [X] = buildVLADALL(image_dir, img_list, D, V, PCAV)

D = single(D);

% start the building
X = zeros(length(img_list), size(D,1)*size(V,2), 'single');
for i=1:length(img_list)
    i
    % load each data separately
    name = img_list{i};
    name=strrep(name,'.jpg','.mat');
    name=strrep(name,'.JPEG','.mat');
    name = [image_dir, name];
    name = strtrim(name);

    try
        data = load(name);
        XX = data.S;
        XX(XX<0) = 0; % relu
        XX = XX*V;
        [v] = FisherVector(XX, D);
        v = v';
    catch ME
        disp('wrong image')
        v = randn(1,size(D,1)*size(V,2));
    end

    X(i,:) = v(:);
end

X = sign(X) .* sqrt(abs(X));
X = normalize(X);

X = X*PCAV;




















