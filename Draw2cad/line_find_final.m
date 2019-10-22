clear;
M=imread('line_circle_image5.jpg');
J=rgb2gray(M);
imshow(J)
found=0;
num_d=1;
num_l=1;
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
figure;
imshow(J);
hold on;
itt=20;
while(itt)
    %cleaning
    
    for i=1:h
        for j=1:w
            if ((J(i,j)==0)&&(sum(J((i-10):(i+10),j-10)==0)||sum(J((i-10):(i+10),j+10)==0)||sum(J((i-10),(j-10):(j+10))==0)||sum(J((i+10),(j-10):(j+10))==0)))
                found=1;
                i;
                j;
                firsti(num_l)=i;
                firstj(num_l)=j;
                break;
            else
                J(i,j)=255;
            end
        end
        if(found==1)
            break;
        end
    end
    
    
    
    valid=0;
    
    while (found&&((J(i-1,j-1)&&J(i+1,j-1)&&J(i-1,j+1)&&J(i+1,j+1)&&J(i,j-1)&&J(i-1,j)&&J(i,j+1)&&J(i+1,j)&&J(i+2,j)&&J(i,j+2)&&J(i-2,j)&&J(i,j-2)&&J(i+2,j+1)&&J(i+1,j+2)&&J(i-2,j+1)&&J(i+1,j-2)&&J(i-1,j+2)&&J(i+2,j-1)&&J(i-1,j-2)&&J(i-2,j-1)&&J(i+2,j+2)&&J(i-2,j+2)&&J(i-2,j-2)&&J(i+2,j-2))==0))
        
        J(i,j)=180;
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
        J(i-1:i+1,j-1:j+1)=180;
        i=ni;
        j=nj;
        
        if(valid<50)
            valid=valid+1;
        else
            slope1=(firsti(num_l)-i)/(firstj(num_l)-j);
            slope2=(i-Y_path(num_d-10))/(j-X_path(num_d-10));
            abs(slope2-slope1)
            if(abs(slope2-slope1)>0.15)
                
                lastj(num_l)=(X_path(num_d-5));
                lasti(num_l)=Y_path(num_d-5);
                
                firstj(num_l+1)=X_path(num_d-5);
                firsti(num_l+1)=Y_path(num_d-5);
                %plot([firstj lastj(length(lastj))],[firsti lasti(length(lasti))],'o')
                %pause;
                num_l=num_l+1;
                valid=0;
                
            end
        end
        
    end
    if(found)
        lastj(num_l)=X_path(num_d-1);
        lasti(num_l)=Y_path(num_d-1);
        found=0;
        num_l=num_l+1;
        num_d=num_d+1;
    end
    
    itt=itt-1;
end
hold on
%plot([firstj lastj(length(lastj))],[firsti lasti(length(lasti))],'o')
%figure;
for i=1:length(firsti)
plot([firstj(i) lastj(i)],[firsti(i) lasti(i)],'b')
pause(0.1)
hold on
end