clear;
M=imread('1.jpg');
J=rgb2gray(M);

found=0;
num_d=1;
num_l=1;
[h,w]=size(J);
%   converting into 1 and 255
for i=1:h
    for j=1:w
        if(J(i,j)<30)
            J(i,j)=0;
        else
            J(i,j)=255;
        end
        
    end
end

imshow(J);

for i=1:h
    for j=1:w
        if ((J(i,j)==0))