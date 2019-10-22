clear;
M=imread('line_image5.jpg');
J=rgb2gray(M);

found=0;
[h,w]=size(J);
%   converting into 1 and 255
for i=1:h
    for j=1:w
        if(J(i,j)<125)
            J(i,j)=0;
        else
            J(i,j)=255;
        end
        
    end
end

imshow(J);
hold on;
%for finding first element
for i=1:h
    for j=1:w
        if (J(i,j)==0)
            found=1;
            i;
            j;
            firsti(1)=i;
            firstj(1)=j;
            break;
        end
    end
    
    if(found==1)
        break;
    end
end
num_d=1;


valid=0;
num_l=1;
while (found&&((J(i-1,j-1)&&J(i+1,j-1)&&J(i-1,j+1)&&J(i+1,j+1)&&J(i,j-1)&&J(i-1,j)&&J(i,j+1)&&J(i+1,j)&&J(i+2,j)&&J(i,j+2)&&J(i-2,j)&&J(i,j-2)&&J(i+2,j+1)&&J(i+1,j+2)&&J(i-2,j+1)&&J(i+1,j-2)&&J(i-1,j+2)&&J(i+2,j-1)&&J(i-1,j-2)&&J(i-2,j-1)&&J(i+2,j+2)&&J(i-2,j+2)&&J(i-2,j-2)&&J(i+2,j-2))==0))
    
    J(i,j)=255;
    X_path(num_d)=j;
    Y_path(num_d)=i;
    num_d=num_d+1;
    if(J(i-1,j-1)==0)
        ni=i-1;
        nj=j-1;
    elseif(J(i+1,j-1)==0)
        ni=i+1;
        nj=j-1;
    elseif(J(i-1,j+1)==0)
        ni=i-1;
        nj=j+1;
    elseif(J(i+1,j+1)==0)
        ni=i+1;
        nj=j+1;
    elseif(J(i-1,j)==0)
        ni=i-1;
        nj=j;
    elseif(J(i,j-1)==0)
        ni=i;
        nj=j-1;
    elseif(J(i,j+1)==0)
        ni=i;
        nj=j+1;
    elseif(J(i+1,j)==0)
        ni=i+1;
        nj=j;
    elseif(J(i-2,j)==0)
        ni=i-2;
        nj=j;
    elseif(J(i,j-2)==0)
        ni=i;
        nj=j-2;
    elseif(J(i+2,j)==0)
        ni=i+2;
        nj=j;
    elseif(J(i,j+2)==0)
        ni=i;
        nj=j+2;
    elseif(J(i+2,j+1)==0)
        ni=i+2;
        nj=j+1;
    elseif(J(i+1,j+2)==0)
        ni=i+1;
        nj=j+2;
    elseif(J(i+1,j-2)==0)
        ni=i+1;
        nj=j-2;
    elseif(J(i-2,j+1)==0)
        ni=i-2;
        nj=j+1;
    elseif(J(i-1,j+2)==0)
        ni=i-1;
        nj=j+2;
    elseif(J(i+2,j-1)==0)
        ni=i+2;
        nj=j-1;
    elseif(J(i-1,j-2)==0)
        ni=i-1;
        nj=j-2;
    elseif(J(i-2,j-1)==0)
        ni=i-2;
        nj=j-1;
    elseif(J(i+2,j+2)==0)
        ni=i+2;
        nj=j+2;
    elseif(J(i-2,j-2)==0)
        ni=i-2;
        nj=j-2;
    elseif(J(i+2,j-2)==0)
        ni=i+2;
        nj=j-2;
    elseif(J(i-2,j+2)==0)
        ni=i-2;
        nj=j+2;
    end
    J(i-1:i+1,j-1:j+1)=255;
    i=ni;
    j=nj;
    
    if(valid<20)
    valid=valid+1;
    else
        slope1=(firsti-i)/(firstj-j);
        slope2=(i-Y_path(num_d-10))/(j-X_path(num_d-10));
        if(abs(slope2-slope1)>0.75)
            
            lastj(num_l)=(X_path(num_d-5));
            lasti(num_l)=Y_path(num_d-5);
            
            firstj(num_l+1)=X_path(num_d-5);
            firsti(num_l+1)=Y_path(num_d-5);
            %plot([firstj(num_l) lastj(num_l)],[firsti(num_l) lasti(num_l)],'r')

            num_l=num_l+1;
            valid=0;
        end
    end
    
end

lastj(num_l)=X_path(num_d-1);
lasti(num_l)=Y_path(num_d-1);
hold on
plot([firstj lastj(length(lastj))],[firsti lasti(length(lasti))],'r')
