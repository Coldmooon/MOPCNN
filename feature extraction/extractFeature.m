function extractFeature(imgdir, filenames, savedir, patchsize)

if(patchsize==256)
	model_def_file = '../../examples/imagenetfeature256.prototxt';
elseif(patchsize==128)
	model_def_file = '../../examples/imagenetfeature128.prototxt';
elseif(patchsize==64)
	model_def_file = '../../examples/imagenetfeature64.prototxt';
elseif(patchsize==10)
	model_def_file = '../../examples/imagenet_deploy.prototxt';
end
model_file = '../../examples/alexnet_train_iter_470000';

% init caffe network (spews logging info)
caffe('init', model_def_file, model_file);
% set to use GPU or CPU
caffe('set_mode_cpu');
% put into test mode
caffe('set_phase_test');
% load mean
d = load('ilsvrc_2012_mean');


for i=1:length(filenames)
    i
    % name and check if computed
    name = [imgdir, filenames{i}];
    savename = [savedir, num2str(patchsize), '/', filenames{i}];
    savename = strrep(savename, '.jpg', '.mat');
    savename = strrep(savename, '.JPEG', '.mat');

    name = strtrim(name);
    savename = strtrim(savename);

    if(exist(savename))
        disp('already computed...')
        continue;
    end
    
    
    % read image
    im = imread(name);
    
    
    % prepare oversampled input
    if(patchsize==10)
        input_data = {prepare_image(im, d)};
        ss = 10;
    else
        [input_data,ss] = extractPatch(im, d, patchsize);
    end
    

    % do forward pass to get scores
    S = caffe('forward', input_data);
    S = reshape(S{1}, [4096 ss])';


    % save the scores
    if(~exist(fileparts(savename)))
        mkdir(fileparts(savename));
    end
    save(savename, 'S');
end




 





















