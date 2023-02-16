% ==============================================================
% Module: erosion.m
%
% Usage: Helper function.
%
% Purpose:
%   Perform a erosion opteration on a given image with structing 
% element
%
% Input Variables:
%   img Target image
%   se Structing element
%
% Returned Results:
%   output The image after erosion
%
% Processing Flow:
%   (a) Pad the image
%   (b) Apply erosion with structing element se
%   (c) store result
%
% Author: Junzhe Huang, Yiyang Mei, Tianhui Li
% Date: 01/29/2023
% ===============================================================*

function [output] = erosion(img, se)
[M,N] = size(img);
[r,c] = size(se);
rpad = fix(r/2);
cpad = fix(c/2);
output = zeros(M,N);
% use erosion to achieve dilation
for i = 1+rpad:M -rpad
    for j = 1+cpad : N-cpad
        if img(i-rpad:i+rpad,j-cpad:j+cpad) == se
            output(i,j) = 255;
        end
    end
end


end

