function Feature_SUN(ind, patchsize)
% --------------------------------------------
% ind:       an array, for example, ind = [1:20000];
% patchsize: 64, 128, or 256;
% 
% -- by coldmoon
% --------------------------------------------

% imgdir = '/netscr/yunchao/';
% savedir = '/lustre/scr/y/u/yunchao/SUN/';
imgdir = '/media/coldmoon/ExtremePro960G/Datasets/SUN397/airport_inside/';
savedir = './features/';

% load('SUNfilenames.mat'); % 108753
filenames = load('SUNfilenames.mat'); filenames = filenames.filenames;
if(ind(end)>length(filenames))
    id = find(ind==length(filenames));
    ind = ind(1:id);
end
filenames = filenames(ind);


extractFeature(imgdir, filenames, savedir, patchsize)





















