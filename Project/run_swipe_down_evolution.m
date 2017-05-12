% neural network code for swiping down
clc;
clear;

addpath ('/Users/JarvisWalker/Documents/Git/NNFL/Project/reusableCode');

generate_swipe_down_data;

load_current_weight_data;
[currentWeight, evolutionOfWeights, evolutionOfErrors] = run_neural_network(processedPatternCollection, expectedOutputs, currentWeight, pMax);

disp("Finished running through all the swipe down data");
save('current_weight.mat', 'currentWeight');