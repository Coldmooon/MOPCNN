function [X] = BuildALLGlobal(image_dir, img_list)


% start the building
X = zeros(length(img_list), 4096, 'single');
for i=1:length(img_list)
    i
    % load each data separately
    name = img_list{i};
    name=strrep(name,'.jpg','.mat');
    name=strrep(name,'.JPEG','.mat');
    name = [image_dir, name];
    name = strtrim(name);

    try
        v = load(name);
        v = v.S;
    catch ME
        disp('wrong image')
        v = randn(4096, 1);
        v(v<0)=0;
    end

    X(i,:) = v(:)';
end

