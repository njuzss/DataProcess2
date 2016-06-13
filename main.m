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

% clustering
for i = 1:length(imClass(:,1))
%        hog( vPath,pPath,deblank(imClass(i,:)));
%        pKmeans( K,vPath,pPath,deblank(imClass(i,:)),cluPath )
%          GMM(K, vPath,pPath,deblank(imClass(i,:)));
        filterClu(K,scene,vPath,cluPath,deblank(imClass(i,:)),threshold_l,threshold_h);
end
%% generate inter-view trainning data 
% for i = 1:length(imClass(:,1))  
%        
%        genViewSet(K,vPath,view,i,deblank(imClass(i,:)));
% end
%% generate intra-view trainning data 
% for i = 1:view
%        genModelSet(K,vPath,num2str(i),view ,imClass);
% end
%% collecting valid cluster
% for i = 1:5
%     filteredName = strcat('aest_view','_',num2str(i),'.clu');
%     fp = fopen(filteredName,'w');
%     for j = 1:4
%         collectClu(fp,vPath,cluPath,i,j,deblank(imClass(j,:)),K,view);
%     end
%     fclose(fp);
% end