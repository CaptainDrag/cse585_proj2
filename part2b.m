imtool close all
clear

f=gif2b(imread('shadow1.gif'));
%f=gif2b(imread('shadow1rotated.gif'));


[images, num] = getImages(f);
table = zeros(100,100);
curr = 0;

imtool(images{1,1})
imtool(images{2,1})
imtool(images{3,1})
imtool(images{4,1})
imtool(images{5,1})
imtool(images{6,1})
imtool(images{7,1})
imtool(images{8,1})
imtool(images{9,1})
imtool(images{10,1})

imtool close all
B = [0 0 0; 0 0 0; 0 0 0];
B = lo2uint(strel(B));
imtool(images{7,1})
imtool(images{8,1})
imtool(images{9,1})
imtool(images{10,1})

for i = 7:10
    tempTable = getInfo(images{i,1},B);
    [M,N] = size(tempTable);
    curr = curr + 1;
    table(curr:curr+M-1, 1:N) = tempTable;
    curr = curr + M;
end
