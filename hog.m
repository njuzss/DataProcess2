function hog( vPath,pPath,imClass )

patchPath = strcat(vPath,pPath,imClass);
Files = dir(fullfile(patchPath,'*.bmp'));
names = {Files.name};     
name = natsort(names); 

%% HOG feature
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

%% concate
[x,y] = size(V);
V = V';
V = reshape(V,1,x*y);
VV = zeros(x/7,y*7);

for i = 1:x/7
    VV(i,:) = V((i-1)*y*7+1:i*y*7);
end

V = VV;
hog_feature = strcat(vPath,pPath,imClass,'_hog.mat');
save(hog_feature,'V');
% count=0;     
% num= importdata(fullfile([vPath,view,'\',imClass,'.txt']));
% for i=1:nImgs
%     numb=num(i);
%     for j=1:numb
%         count=count+1;
%         tPath=sprintf('_%d.bmp',j);
%         tPath=fullfile([patPath,'\',name{i},tPath]);
%         patch=imread(tPath);
%         featureVector = extractHOGFeatures(patch);
%     end
end

