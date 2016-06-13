clear;

%%  add the imagePath
vPath='D:\Experiments\MiltiView\';
imPath='Projections\';
pPath='Patches\';
cluPath = 'Clusters\';
imClass = char('armchair','sofa','endtable','teatable');



for i = 1:5
    filteredName = strcat('aest_data','_',num2str(i),'.clu');
    fp = fopen(filteredName,'at');
    
    for j = 1:4
        
        clusterPath=strcat(vPath,num2str(i),'\',cluPath,deblank(imClass(j,:)),'\');
        
        nums = dir(fullfile(clusterPath));
        indices = {nums.name};
        indices = natsort(indices);
        
        fprintf(fp,'%d %d\n',j,length(indices));
        
        for x = 1:length(indices)
            if(isequal(indices{x},'.') || isequal(indices{x},'..'))
                continue;
            end
            
            fprintf(fp,'%d ',str2num(indices{x}));
            
        end
        
        fprintf(fp,'\n');
        
    end
    fclose(fp);
    
end


