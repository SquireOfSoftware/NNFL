% clc;
% clear;
%addpath ('/Users/JarvisWalker/Documents/Git/leap-source-code/NNFL/Group14/');
addpath ('/Users/JarvisWalker/Documents/Git/matleap');
addpath ('/Users/JarvisWalker/Documents/Git/NNFL/Project/nestedSortStruct');

v = run_matleap;

save('volume_down.mat', 'v');