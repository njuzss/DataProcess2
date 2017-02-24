clear;

%% parameter setting
options = [];
options.maxIter = 200;
options.error = 1e-6;
options.nRepeat = 30;
options.minIter = 50;
options.meanFitRatio = 0.1;
options.rounds = 30;


% options.kmeans means whether to run kmeans on v^* or not
% options alpha is an array of weights for different views

% options.alpha = [0.01];
options.alpha = [0.01 0.01 0.01 0.01];
options.kmeans = 1;


%% read dataset

load ../handwritten.mat
data{1} = fourier';
data{2} = pixel';   
data{3} = mor';   
data{4} = profile';   
% data{5} = zer';   
K = 10;


%% normalize data matrix

for i = 1:length(data)
    data{i} = data{i} / sum(sum(data{i}));
end

%%

% run 3 times
U_final = cell(1,3);
V_final = cell(1,3);
V_centroid = cell(1,3);
for i = 1:1
   [U_final{i}, V_final{i}, V_centroid{i} log] = MultiNMF(data, K, gnd, options);
end
