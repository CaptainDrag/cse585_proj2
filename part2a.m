imtool close all
clear

f=gif2b(imread('match1.gif'));


[images, num] = getImages(f);

B = [0 0 0; 0 0 0; 0 0 0];
B = lo2uint(strel(B));
imtool(images{1,1})

temp = images{2,1};
currSE = B;
r = 1;
conti = true;
Ur = sum(temp(:))/255;
while conti
    imtool close all
    curr = erosion(temp, currSE);
    imtool(curr)
    imtool(currSE)
    currGrabulometry = dilation(curr, currSE);
    imtool(currGrabulometry)
    mXrB = sum(currGrabulometry(:))/255;
    r = r+1;
    currSE = lo2uint(strel(zeros(r+r+1,r+r+1)));
    if sum(curr) == 0
        conti = false;
    end
end
