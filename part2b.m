imtool close all
clear

f=gif2b(imread('shadow1.gif'));


[images3, num3] = getImages(f);
table3 = zeros(100,100);
curr = 0;
maxN3 = 0;

imtool close all
B = [0 0 0; 0 0 0; 0 0 0];
B = lo2uint(strel(B));
imtool(images3{7,1})
imtool(images3{8,1})
imtool(images3{9,1})
imtool(images3{10,1})

for i = 7:10
    tempTable = getInfo(images3{i,1},B);
    [M,N] = size(tempTable);
    curr = curr + 1;
    table3(curr:curr+M-1, 1:N) = tempTable;
    curr = curr + M;
    maxN3 = max(maxN3, N);
end



table3 = table3(1:5*4, 1:maxN3);
f=gif2b(imread('shadow1rotated.gif'));
[images4, num4] = getImages(f);
table4 = zeros(100,100);
curr = 0;
maxN4 = 0;
imtool(images4{1,1})
imtool(images4{2,1})
imtool(images4{3,1})
imtool(images4{4,1})
imtool(images4{5,1})
imtool(images4{6,1})
imtool(images4{7,1})
imtool(images4{8,1})
imtool(images4{9,1})
imtool(images4{10,1})


imtool close all
B = [0 0 0; 0 0 0; 0 0 0];
B = lo2uint(strel(B));
imtool(images4{6,1})
imtool(images4{7,1})
imtool(images4{8,1})
imtool(images4{9,1})


for i = 6:9
    tempTable = getInfo(images4{i,1},B);
    [M,N] = size(tempTable);
    curr = curr + 1;
    table4(curr:curr+M-1, 1:N) = tempTable;
    curr = curr + M;
    maxN4 = max(maxN4, N);
end
table4 = table4(1:5*4, 1:maxN4);

diffs2 = checkDiff(table3,table4);

