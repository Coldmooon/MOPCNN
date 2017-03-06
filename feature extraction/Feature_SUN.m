function Feature_SUN(ind, patchsize)

imgdir = '/netscr/yunchao/';
savedir = '/lustre/scr/y/u/yunchao/SUN/';


load('SUNfilenames.mat'); % 108753
if(ind(end)>length(filenames))
    id = find(ind==length(filenames));
    ind = ind(1:id);
end
filenames = filenames(ind);


extractFeature(imgdir, filenames, savedir, patchsize)





















