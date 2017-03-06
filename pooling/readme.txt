This is code for learning the final MOPCNN feature from patch features. It is simply VLAD descriptor with PCA.

1) call [D, V, PCAV] = learnCodebook(image_dir, img_list, pcadim, k) to learn codebooks and PCA parameters

2) call SUN_GetData(patchsize) to get the feature X1, X2, X3 for each size

3) normalize X1, X2, X3 and concatenate them, you are done!

Please cite this work:

Yunchao Gong, Liwei Wang, Ruiqi Guo, Svetlana Lazebnik. Multi-scale orderless pooling of deep convolutional activation features. ECCV 2014.