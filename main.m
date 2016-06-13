clear;
vPath='D:\Experiments\MultiView\';
pPath='Parts\';

cluPath = 'Clusters\';


imClass = char('armchair','sofa','endtable','teatable');
K=60;         %max k among models
view = 7;
scene = 60;
threshold_l = 0.3;
threshold_h = 0.15;

%% clustering
% for i = 1:length(imClass(:,1))
% %        hog( vPath,pPath,deblank(imClass(i,:)));
% %        pKmeans( K,vPath,pPath,deblank(imClass(i,:)),cluPath )
% %          GMM(K, vPath,pPath,deblank(imClass(i,:)));
%         filterClu(K,scene,vPath,cluPath,deblank(imClass(i,:)),threshold_l,threshold_h);
% end
%% generate  trainning data 
% genSceneSet(K,vPath,cluPath,imClass)

%% generate testing data
for j = 1:4
    genDatabase(vPath,cluPath,j,deblank(imClass(j,:)), K); 
end