function hog( vPath,pPath,imClass,view )
tic;
patchPath = strcat(vPath,pPath,imClass);
Files = dir(fullfile(patchPath,'*.bmp'));
names = {Files.name};     
name = natsort(names); 

%% Compute HOG features
count=0; 
patchnum = length(name);
V=zeros(patchnum,1296);
for j=1:patchnum
        count=count+1;
        tPath = strcat(patchPath,'\',name{j});
        patch=imread(tPath);
        featureVector = extractHOGFeatures(patch);
%         featureVector = hogcalculator(patch);
        V(count,:)=featureVector;
end

%% Concate views for evey part
% [x,y] = size(V);
% V = V';
% V = reshape(V,1,x*y);
% VV = zeros(x/view,y*view);
% 
% for i = 1:x/view
%     VV(i,:) = V((i-1)*y*view+1:i*y*view);
% end
% V = VV;

%% Use Multi-view fusion
V = V';
[x,y] = size(V);
X = cell(1,view);
for j = 1:view
    for i = 1:y/view
    X{1,j}(:,i) = V(:,(i-1)*view+j);
    end
end

%% Save mat
hog_feature = strcat(vPath,pPath,imClass,'_hog.mat');
save(hog_feature,'X');
toc;
end

