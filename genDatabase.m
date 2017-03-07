function genDatabase(vPath,cluPath,index,imClass, K)

load(strcat(vPath,cluPath,imClass,'_labels.mat'));

data = strcat(vPath,cluPath,imClass,'.data');
fp = fopen(data,'w');

% fprintf(fp,'%d\n',length(labels));
for i = 1:length(labels)
   
    fprintf(fp,'%d ',length(labels{i}));
    for j = 1:length(labels{i})
        fprintf(fp,'%d ',labels{i}(j)+K*(index-1));
    end
    fprintf(fp,'\n');
end
fclose(fp);




