function [rt, item] = getImages(X)
[M,N] = size(X);
originX = X;
rt = cell(100,1);
item = 0;

for i = 1:M
    for j = 1:N
        if X(i,j) == 255
            [X, a, b, c, d] = pollu(X, i, j);
            item = item +1;
            rt{item,1} = originX(a:b,c:d);

            
           
        end
    end
end




end