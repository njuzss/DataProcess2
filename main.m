clear;
vPath='D:\Experiments\MultiView\';
phPath='Patches\';
prPath='Parts\';
prPath1 = 'Part1\';
prPath2 = 'Part2\';
ConcPath='ClustersCon\';
mvcPath = 'ClustersMV\';
pslfcPath = 'ClustersPSLF\';

imClass = char('armchair','sofa','endtable','teatable');
K=60;         %max k among models
view = 7;
scene = 60;
threshold_l = 0.3;
threshold_h = 0.15;

semi_pslf = 1;

%% temporary
% filterClu(K,scene,vPath,mvcPath,deblank(imClass(1,:)),threshold_l,threshold_h);

%% clustering
for i = 1:length(imClass(:,1))
%        hog( vPath,prPath,deblank(imClass(i,:)),view);
      runPSLF( vPath,prPath1,deblank(imClass(i,:)),semi_pslf,K);
%       runMNMF( vPath,prPath2,deblank(imClass(i,:)));      
%         pKmeans( K,vPath,prPath1,deblank(imClass(i,:)),pslfcPath )
%         pKmeans( K,vPath,prPath2,deblank(imClass(i,:)),mvcPath )
%          GMM(K, vPath,pPath,deblank(imClass(i,:)));
%        filterClu(K,scene,vPath,ConcPath,deblank(imClass(i,:)),threshold_l,threshold_h);
%        filterClu(K,scene,vPath,pslfcPath,deblank(imClass(i,:)),threshold_l,threshold_h);

end


%% generate  trainning data 
% genSceneSet(K,vPath,pslfcPath,imClass)

%% generate testing data
% for j = 1:4
%     genDatabase(vPath,cluPath,j,deblank(imClass(j,:)), K); 
% end