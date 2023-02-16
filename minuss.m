function [x] = minuss(a,b)
%MINUS 此处显示有关此函数的摘要
%   此处显示详细说明

[M, N] = size(b);
x = a;
for i = 1 : M
    for j = 1 : N
        if a(i,j) == b(i,j)
            x(i,j) = 255;
        end
    end
end
end

