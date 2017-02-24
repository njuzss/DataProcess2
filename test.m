
[x,y] = size(V);
X = cell(1,7);
for j = 1:7
    for i = 1:y/7
    X{1,j}(:,i) = V(:,(i-1)*7+j);
    end
end