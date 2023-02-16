% ==============================================================
% Module: dilation.m
%
% Usage: Helper function.
%
% Purpose:
%   Perform a dilation opteration on a given image with structing 
% element
%
% Input Variables:
%   img Target image
%   se Structing element
%
% Returned Results:
%   output The image after dilation
%
% Processing Flow:
%   (a) Pad the image
%   (b) Apply dilation with structing element se
%   (c) store result
%
% Author: Junzhe Huang, Yiyang Mei, Tianhui Li
% Date: 01/29/2023
% ===============================================================*

function [output] = dilation(img, se)
[M,N] = size(img);
[r,c] = size(se);
rpad = fix(r/2);
cpad = fix(c/2);
output = zeros(M+2*rpad,N+2*cpad);

for i = 1:M
    for j = 1:N
        if img(i,j) == 255
            output(i:i+rpad+rpad,j:j+cpad+cpad) = se;
        end
    end
end

output = output(1+rpad:rpad + M,1+ cpad:cpad + N);
end

