function GMM( K,vPath,pPath,imClass )

load(strcat(vPath,pPath,imClass,'_hog.mat'));

%% PCA
[coeff,score,latent] = pca(V);
V = score;
%% GMM

tic;
GMModel = fitgmdist(V,K,'Regularize',0.01,'Start','plus');
idx = cluster(GMModel,V);
idx_model = strcat(vPath,view,'\',imClass,'_idx.mat');
save(idx_model,'idx');
gmm_model = strcat(vPath,view,'\',imClass,'_gmm.mat');
save(gmm_model,'GMModel');
toc;

end