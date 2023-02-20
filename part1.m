imtool close all
clear;

B = cell(16,1);

B1f = [0 0 0; 0 1 0; 1 1 1];
B1f = strel(B1f);
B{1} = lo2uint(B1f);


B1b = [1 1 1; 0 0 0; 0 0 0];
B1b = strel(B1b);
B{2} = lo2uint(B1b);

B2f = [0 0 0; 1 1 0; 1 1 0];
B2f = strel(B2f);
B{3} = lo2uint(B2f);

B2b = [0 1 1; 0 0 1; 0 0 0];
B2b = strel(B2b);
B{4} = lo2uint(B2b);

B3f = [1 0 0; 1 1 0; 1 0 0];
B3f = strel(B3f);
B{5} = lo2uint(B3f);

B3b = [0 0 1; 0 0 1; 0 0 1];
B3b = strel(B3b);
B{6} = lo2uint(B3b);

B4f = [1 1 0; 1 1 0; 0 0 0];
B4f = strel(B4f);
B{7} = lo2uint(B4f);

B4b = [0 0 0; 0 0 1; 0 1 1];
B4b = strel(B4b);
B{8} = lo2uint(B4b);

B5f = [1 1 1; 0 1 0; 0 0 0];
B5f = strel(B5f);
B{9} = lo2uint(B5f);

B5b = [0 0 0; 0 0 0; 1 1 1];
B5b = strel(B5b);
B{10} = lo2uint(B5b);

B6f = [0 1 1; 0 1 1; 0 0 0];
B6f = strel(B6f);
B{11} = lo2uint(B6f);

B6b = [0 0 0; 1 0 0 ; 1 1 0];
B6b = strel(B6b);
B{12} = lo2uint(B6b);

B7f = [0 0 1; 0 1 1; 0 0 1];
B7f = strel(B7f);
B{13} = lo2uint(B7f);

B7b = [1 0 0; 1 0 0; 1 0 0];
B7b = strel(B7b);
B{14} = lo2uint(B7b);

B8f = [0 0 0; 0 1 1; 0 1 1];
B8f = strel(B8f);
B{15} = lo2uint(B8f);

B8b = [1 1 0; 1 0 0; 0 0 0];
B8b = strel(B8b);
B{16} = lo2uint(B8b);



%f = gif2int(imread('penn256.gif'));
f = gif2int(imread('bear.gif'));
imtool(reverse(f))



[M, N] = size(f);


fg_reverse = uint8(reverse(f));

i = 0;
X = f;
terminate = false;


while (~terminate)
    i = i + 1;
    tempX = X;
    for j = 1:8
        hm = hitnmiss(tempX, uint8(reverse(tempX)), B{2*j - 1}, B{2*j});
        
        tempX = minuss(tempX,hm);
        
    end
    
    if (sum(ismember(i, [2 5 10])) > 0) 
        imtool(reverse(tempX))
        im_overlay = imoverlay(f, reverse(tempX), [1 0 0]);
        imtool(im_overlay)
    end
    
    if X == tempX
        terminate = true;
    end

    X = tempX;
    
end
imtool(reverse(X))
im_overlay = imoverlay(f, reverse(tempX), [1 0 0]);
imtool(im_overlay)