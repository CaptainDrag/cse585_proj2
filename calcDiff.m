function [diff] = calcDiff(set1,set2)
diff = 0;
[M1,N1] = size(set1);
[M2,N2] = size(set2);
M = max(M1,M2);
N = max(N1,N2);
temp1 = zeros(4, N);
temp2 = zeros(4, N);
for i = 1:M1
    for j = 1:N1
        temp1(i,j) = set1(i,j);
    end
end
for i = 1:M2
    for j = 1:N2
        temp2(i,j) = set2(i,j);
    end
end
for i = 1:N
    diff = diff + abs(temp1(2,i) - temp2(2,i));
end
end

