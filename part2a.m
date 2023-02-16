imtool close all
clear

f=gif2b(imread('match1.gif'));


[images, num] = getImages(f);

B = [0 0 0; 0 0 0; 0 0 0];
B = lo2uint(strel(B));
imtool(images{1,1})
%imtool(images{2,1})
%imtool(images{3,1})
%imtool(images{4,1})
temp = images{1,1};
%temp = images{2,1};
%temp = images{3,1};
%temp = images{4,1};
currSE = B;
r = 1;
conti = true;
Ur = sum(temp(:))/255;
table = zeros(3,100);
table(2,1) = Ur;
while conti
    imtool close all
    curr = erosion(temp, currSE);
    imtool(curr)
    imtool(currSE)
    currGrabulometry = dilation(curr, currSE);
    imtool(currGrabulometry)
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
for i=1:r-1
    HXB = HXB - table(3,i) * log(table(3,i));
end


