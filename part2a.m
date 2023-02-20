imtool close all
clearvars -except table1 table2

f=gif2b(imread('match1.gif'));
%f=gif2b(imread('match3.gif'));


[images1, num1] = getImages(f);
table1 = zeros(100,100);
curr = 0;
maxN1 = 0;
B = [0 0 0; 0 0 0; 0 0 0];
B = lo2uint(strel(B));
imtool(images1{1,1})
imtool(images1{2,1})
imtool(images1{3,1})
imtool(images1{4,1})

for i = 1:4
    tempTable = getInfo(images1{i,1},B);
    [M,N] = size(tempTable);
    curr = curr + 1;
    table1(curr:curr+M-1, 1:N) = tempTable;
    curr = curr + M;
    maxN1 = max(maxN1, N);
end
table1 = table1(1:5*num1, 1:maxN1);
f=gif2b(imread('match3.gif'));


[images2, num2] = getImages(f);
table2 = zeros(100,100);
curr = 0;
maxN2 = 0;
B = [0 0 0; 0 0 0; 0 0 0];
B = lo2uint(strel(B));
imtool(images2{1,1})
imtool(images2{2,1})
imtool(images2{3,1})
imtool(images2{4,1})

for i = 1:4
    tempTable = getInfo(images2{i,1},B);
    [M,N] = size(tempTable);
    curr = curr + 1;
    table2(curr:curr+M-1, 1:N) = tempTable;
    curr = curr + M;
    maxN2 = max(maxN2, N);
end
table2 = table2(1:5*num2, 1:maxN2);

diffs1 = checkDiff(table1,table2);

