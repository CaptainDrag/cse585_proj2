function [table] = getInfo(temp,B)
currSE = B;
r = 1;
conti = true;
Ur = sum(temp(:))/255;
table = zeros(4,100);
table(2,1) = Ur;
while conti
    %imtool close all
    curr = erosion(temp, currSE);
    %imtool(curr)
    %imtool(currSE)
    currGrabulometry = dilation(curr, currSE);
    %imtool(currGrabulometry)
    mXrB = sum(currGrabulometry(:))/255;
    table(1,r+1) = r;
    table(2,r+1) = mXrB;
    table(3,r) = (table(2,r) - table(2,r+1))/Ur;
    r = r+1;
    currSE = lo2uint(strel(zeros(r+r+1,r+r+1)));
    if sum(curr) == 0
        conti = false;
    end
end
table = table(1:3,1:r);
HXB = 0;
psum = 0;
for i=1:r-1
    if table(3,i) ~= 0 
        HXB = HXB - table(3,i) * log(table(3,i));
    end

    
    psum = psum + table(3,i);
end
table(4,1) = HXB;
table(4,2) = psum;
end

