function runMNMF(vPath,pPath,imClass)
%% parameter setting
options = [];
options.maxIter = 300;
options.error = 1e-6;
options.nRepeat = 30;
options.minIter = 50;
options.meanFitRatio = 0.1;
options.rounds = 30;

% options.kmeans means whether to run kmeans on v^* or not
% options alpha is an array of weights for different views

% options.alpha = [0.01];
options.alpha = [0.01 0.01 0.01 0.01 0.01 0.01 0.01];
options.kmeans = 1;


%% read dataset
hog_feature = strcat(vPath,pPath,imClass,'_hog.mat');
load(hog_feature);
data = X;
% data{5} = zer';   
K = 60;


%% normalize data matrix

for i = 1:length(data)
    data{i} = data{i} / sum(sum(data{i}));
end

%%

% run 3 times
U_final = cell(1,1);
V_final = cell(1,1);
V_centroid = cell(1,1);
gnd = [];
for i = 1:1
   [U_final{i}, V_final{i}, V_centroid{i} log] = MultiNMF(data, K, gnd, options);
   fused_feature = strcat(vPath,pPath,imClass,'_Vr.mat');
   Vr = V_centroid;
    save(fused_feature,'Vr');
 
   
end
end