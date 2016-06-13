function filterClu( K,scene,vPath,cluPath,imClass,threshold_l,threshold_h )
%%filter using idf
% load(strcat(vPath,pPath,imClass,'_idx.mat'));

clusterPath=strcat(vPath,cluPath,imClass,'\');

indices = zeros(K,2*K);
count = cell(1);

for i = 1:K
    patchPath  = strcat(clusterPath,num2str(i),'\');
    
    patches = dir(fullfile(patchPath,'*.bmp'));
    names = {patches.name};
    name = natsort(names);
    
    
    for j = 1:length(name)
        index = findstr(name{1,j},'_');
        num = name{1,j}(1:index-1);
        num = str2num(num);
        indices(i,j) = num;
    end
    c{i} = unique(indices(i,:));
    
end

for i = 1:length(c)
    num = length(c{1,i});
    count{1,i} = strcat(num2str(num),'_',num2str(i));
end

x = natsort(count(1,:));
for j = 1:(K*threshold_l)
    index = findstr(x{1,j},'_');
    num = x{1,j}(index+1:end);
    rmdir(strcat(clusterPath,num2str(num)),'s');
end
% for j = length(x):-1:(K-K*threshold_h+1)
%     index = findstr(x{1,j},'_');
%     num = x{1,j}(index+1:end);
%     rmdir(strcat(clusterPath,num2str(num)),'s');
% end

%% count cluster

clusters = dir(clusterPath);
names_cluster = {clusters.name};
names_cluster = names_cluster(3:end);
names_cluster = natsort(names_cluster);
labels = {};

% 90 is temprory, attention!!!!
% scene instead
for i = 1:scene
    labels{i} = zeros(1,0);
end

for i = 1:length(names_cluster)
    
    name_cluster = cell2mat(names_cluster(1,i));
    
    patchPath  = strcat(clusterPath,name_cluster,'\');
    name_cluster = str2num(name_cluster);
    
    patches = dir(fullfile(patchPath,'*.bmp'));
    names_patch = {patches.name};
    for j = 1:length(names_patch)
        index = findstr(names_patch{1,j},'_');
        num = names_patch{1,j}(1:index-1);
        numsb = str2num(num);
        labels{numsb} = [labels{numsb},name_cluster];
    end
    
end

for i= 1:length(labels)
    labels{i} = unique(labels{i});
end

labels_gmm = strcat(vPath,cluPath,imClass,'_labels');
save(labels_gmm,'labels');


