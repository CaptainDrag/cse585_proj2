function [rt] = checkDiff(table1,table2)
[M1,N1] = size(table1);
[M2,N2] = size(table2);
M = max(M1,M2);

i = 1;
curr = 0;
set1 = cell(100,1);
set2 = cell(100,1);
while i < M
    curr = curr + 1;
    set1{curr,1} = table1(i:i+3,1:N1);
    set2{curr,1} = table2(i:i+3,1:N2);
    i = i + 5;
end
rt = zeros(curr,curr);
for i=1:curr
    for j=1:curr
        rt(i,j) = calcDiff(set1{i,1}, set2{j,1});
    end
end

end

