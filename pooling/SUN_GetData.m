function SUN_GetData(patchsize)


% load('SUNfilenames.mat');
filenames = load('SUNfilenames.mat'); filenames = filenames.filenames;
if(patchsize==256)
% 	image_dir = '/lustre/scr/y/u/yunchao/SUN/256/';
    image_dir = './features/256/';
elseif(patchsize==128)
	% image_dir = '/lustre/scr/y/u/yunchao/SUN/128/';
    image_dir = './features/128/';
elseif(patchsize==64)
% 	image_dir = '/lustre/scr/y/u/yunchao/SUN/64/';
    image_dir = './features/64/';
end


if(patchsize==256)
    X = BuildALLGlobal(image_dir, filenames);
    save -v7.3 'data/SUN_256' X
elseif(patchsize==128)
    [D, V, PCAV] = learnCodebook(image_dir, filenames, 500, 100);
    X = buildVLADALL(image_dir, filenames, D, V, PCAV);
    save -v7.3 'data/SUN_128' X
elseif(patchsize==64)
    [D, V, PCAV] = learnCodebook(image_dir, filenames, 500, 100);
    X = buildVLADALL(image_dir, filenames, D, V, PCAV);
    save -v7.3 'data/SUN_64' X
end