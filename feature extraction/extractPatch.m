function [images, ss] = extractPatch(im, d, patchsize)

IMAGE_MEAN = d.image_mean;
IMAGE_DIM = 256;
grid = 30;
CROPPED_DIM = 227;
endsize = IMAGE_DIM - patchsize + 1;

% resize to fixed input size
im = single(im);
if(size(im,1)~=256 || size(im,2)~=256)
    im = imresize(im, [IMAGE_DIM IMAGE_DIM], 'bilinear');
end
% permute from RGB to BGR (IMAGE_MEAN is already BGR)
im = im(:,:,[3 2 1]) - IMAGE_MEAN;

% prepare indexes
indices = 1:grid:endsize;
indices = [indices endsize];
indices = unique(indices);

% sample patches
ind = 1;
images = zeros(CROPPED_DIM, CROPPED_DIM, 3, length(indices)*length(indices), 'single');
for i=indices
    for j=indices
        images(:, :, :, ind) = ...
            imresize(permute(im(i:i+patchsize-1, j:j+patchsize-1, :), [2 1 3]), [CROPPED_DIM, CROPPED_DIM], 'bilinear');
        ind = ind + 1;
    end
end
ss = length(indices)*length(indices);
images = {images};