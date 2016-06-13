function GMM( K,vPath,pPath,imClass )

load(strcat(vPath,pPath,imClass,'_hog_.mat'));

%% PCA
[coeff,score,latent] = pca(V);
V = score;
%% GMM

tic;
GMModel = fitgmdist(V,K,'Regularize',0.1,'Start','plus');
idx = cluster(GMModel,V);
idx_model = strcat(vPath,pPath,imClass,'_idx.mat');
save(idx_model,'idx');
gmm_model = strcat(vPath,pPath,imClass,'_gmm.mat');
save(gmm_model,'GMModel');
toc;

end