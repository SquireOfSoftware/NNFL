% neural network code for swiping right
clc;
clear;

addpath ('/Users/JarvisWalker/Documents/Git/NNFL/Project/reusableCode');

generate_swipe_right_data;

load_current_weight_data;

oldWeight = currentWeight;

[currentWeight, evolutionOfWeights, uusevolutionOfErrors] = run_neural_network(processedPatternCollection, expectedOutputs, currentWeight, pMax);

disp("Finished running through all the swipe right data");
disp(currentWeight - oldWeight);
save('current_weight.mat', 'currentWeight');