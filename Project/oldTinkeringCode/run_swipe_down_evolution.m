% neural network code for swiping down
clc;
clear;

addpath ('reusableCode');

generate_swipe_down_data;

load_current_weight_data;
[currentWeight, evolutionOfWeights, evolutionOfErrors] = run_neural_network(processedPatternCollection, expectedOutputs, currentWeight, pMax);

plot(evolutionOfErrors(2, :));

disp("Finished running through all the swipe down data");
save('current_weight.mat', 'currentWeight');