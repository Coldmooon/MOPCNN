function cleanSUN()

% matlabpool open;
% data_dir = '/netscr/yunchao/';
% load('SUNfilenames.mat');

% parpool local
data_dir = '/media/coldmoon/ExtremePro960G/Datasets/SUN397/airport_inside/';
filenames = load('SUNfilenames.mat'); filenames = filenames.filenames;

% parfor i=1:length( filenames)
for i=1:length( filenames)
    i
    name = [data_dir,filenames{i}];
    img = imread(name);
    img = imresize(img,[256,256]);
    
    if(size(img,3)<3)
        disp('fake color')
        nimg = zeros(size(img,1),size(img,2),3);
        nimg(:,:,1) = img(:,:,1);
        nimg(:,:,2) = img(:,:,1);
        nimg(:,:,3) = img(:,:,1);
        img = nimg;
    end
    if(size(img,3)>3)
        disp('4 channels')
        nimg = zeros(size(img,1),size(img,2),3);
        nimg(:,:,1) = img(:,:,1);
        nimg(:,:,2) = img(:,:,2);
        nimg(:,:,3) = img(:,:,3);
        img = nimg;
    end
    imwrite(img, name);
end
end










