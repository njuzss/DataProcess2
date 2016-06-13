function genSceneSet(K,vPath,cluPath,imClass)

label_all = cell(length(imClass(:,1)),1);

for i = 1:length(imClass(:,1))
    load(strcat(vPath,cluPath,deblank(imClass(i,:)),'_labels.mat'));
    label_all{i} = labels;
    clear idx;
end

file = strcat('aest','.scene');
fp = fopen(file,'w');
for i = 1:length(label_all{1})
    
    flag = false;
    for j = 1:length(label_all)
        temp = label_all{j}{i};
        if(~isempty(temp))
            flag =true;
            for x = 1:length(temp)
                fprintf(fp,'%d ',temp(x)+K*(j-1));
            end
        end
    end
    if(flag)
        fprintf(fp,'\n');
    end
    
end

fclose(fp);
end