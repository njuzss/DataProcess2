function runPSLF(vPath,pPath,imClass,semi,topic)

hog_feature = strcat(vPath,pPath,imClass,'_hog.mat');

if semi == 1
    % Y -labels
    y_labels = strcat(vPath,pPath,imClass,'_idxk.mat');
    load(y_labels);
    [x,y] = size(idx);
    Y = zeros(topic,x);
    for j = 1:x
        Y(idx(j,1),j) = 1;
    end

    % U -base matrix
    u_base = strcat(vPath,pPath,imClass,'_U.mat');
    load(u_base);
    
    % X{l} -labeled shapes
    load(hog_feature);
    L = X;
    clear X;
    % X{ul} -unlabeled shapes
    test_feature = strcat(vPath,pPath,imClass,'_test.mat');
    load(test_feature);
    UL = X;
    clear X;
    for i = 1:length(L)
        X{i} = [L{i} UL{i}];
    end
    
    [Vr, U, V, W, numIter,tElapsed,object] = pslf(X, Y, U);
    fused_feature = strcat(vPath,pPath,imClass,'_SVr.mat');
    coef_matrix = strcat(vPath,pPath,imClass,'_SW.mat');
    save(fused_feature,'Vr');
    save(coef_matrix,'V');

%% output labels for unlabeled shapes
     newY = W'*Vr;
    for i=1:length(Vr)
        pos=find(newY(:,i)==max(newY(:,i)));
        pLabels(i,1)=pos(1,1);
    end

    results = strcat(vPath,pPath,imClass,'_SY.mat');
    save(results,'pLabels');
else
    Y = [];   
    load(hog_feature);
    [Vr, U, V, W, numIter,tElapsed,object] = pslf(X, Y);
    fused_feature = strcat(vPath,pPath,imClass,'_Vr.mat');
    basis_matrix = strcat(vPath,pPath,imClass,'_U.mat');
    save(fused_feature,'Vr');
    save(basis_matrix,'U');
end


end