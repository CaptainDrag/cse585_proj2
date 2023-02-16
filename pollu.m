function [currX, xi, xj, yi, yj] = pollu(X, i, j)
[M,N] = size(X);
currX = X;
xj = i;
yj = j;
xi = i;
yi = j;
untermi = true;
temp = cell(M*N, 1);
currTemp = 0;
currPos = 0;
while untermi
    currX(i,j) = 0;
    if i < xi
        xi = i;
    end
    if i > xj
        xj = i;
    end
    
    if j < yi
        yi = j;
    end
    if j > yj
        yj = j;
    end
    
    
    for curri = i-1:i+1
        for currj = j-1:j+1
            if currX(curri,currj) == 255
                currX(curri,currj) = 0;
                currTemp = currTemp + 1;
                temp{currTemp, 1} = [curri,currj];
            end
        end
    end
    
    currPos=currPos+1;
    
    if currPos > currTemp
        untermi=false;
    else
        i = temp{currPos,1}(1);
        j = temp{currPos,1}(2);
    end
    
    
end

end