% neural network code for swiping right
clc;
clear;

addpath ('reusableCode');

generate_swipe_left_data;

load_current_weight_data;

oldWeight = currentWeight;

[currentWeight, evolutionOfWeights, uusevolutionOfErrors] = run_neural_network(processedPatternCollection, expectedOutputs, currentWeight, pMax);

disp("Finished running through all the swipe right data");

save('current_weight.mat', 'currentWeight');