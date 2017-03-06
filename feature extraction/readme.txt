This folder contains all code for extracting deep activation features. This is based on Caffe. So you need to first install caffe. Here are the steps:

1) Install Caffe
2) Put the files in samplemodel to the caffe model directory
3) Modify image file locations in CleanSUN to resize and cleanup the image dataset
4) Modify image file locations in Feature_SUN to extract local patch features.

Please cite this paper 

Yunchao Gong, Liwei Wang, Ruiqi Guo, Svetlana Lazebnik. Multi-scale orderless pooling of deep convolutional activation features. ECCV 2014.