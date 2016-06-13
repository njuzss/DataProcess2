function pKmeans( K,vPath,pPath,imClass,cluPath )
%% kmeans
load(strcat(vPath,pPath,imClass,'_hog.mat'));
parpool;

opts=statset('UseParallel','always');
[idx,C] = kmeans(V,K,'Options',opts,'emptyaction','drop','Distance','sqeuclidean');
%Distance
%sqeuclidean
%cosine
%correlation
idx_k = strcat(vPath,pPath,imClass,'_idxk.mat');
save(idx_k,'idx');
centroid  = strcat(vPath,pPath,imClass,'_centroid.mat');
save(centroid,'C');
delete(gcp);

%% mkdir

for i = 1:K
    mkdir(fullfile(vPath,cluPath,imClass),num2str(i));
end


%% collect the results
patPath = strcat(vPath,pPath,imClass);
clusterPath = strcat(vPath,cluPath,imClass);
Files = dir(fullfile(patPath,'*.bmp'));
names = {Files.name};
name = natsort(names);

for i = 1:length(idx)
    
    sourcePath = strcat(patPath,'\',name{(i-1)*7+3});   
    impath = strcat(clusterPath,'\',num2str(idx(i)),'\',name{(i-1)*7+3});   
    Img = imread(sourcePath,'bmp');    
    imwrite(Img,impath);
    
end
% for i = 1:length(idx)
%     for j = 1:7
%     sourcePath = strcat(patPath,'\',name{(i-1)*7+j});   
%     impath = strcat(clusterPath,'\',num2str(idx(i)),'\',name{i});   
%     Img = imread(sourcePath,'bmp');    
%     imwrite(Img,impath);
%     end
% end

end