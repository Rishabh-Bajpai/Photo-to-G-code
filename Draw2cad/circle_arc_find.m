clear;
M=imread('circle_image.jpg');
J=rgb2gray(M);
imshow(J);
found=0;
[h,w]=size(J);
for i=1:h
    for j=1:w
        if(J(i,j)<125)
            J(i,j)=0;
        else
            J(i,j)=255;
        end
        
    end
end
for i=1:h
    for j=1:w
        if (J(i,j)==0)
            found=1
            i;
            j;
            break;
        end
    end
    
    if(found==1)
        break;
    end
end
num=1;

while ((J(i-1,j-1)&&J(i+1,j-1)&&J(i-1,j+1)&&J(i+1,j+1)&&J(i,j-1)&&J(i-1,j)&&J(i,j+1)&&J(i+1,j)&&J(i+2,j)&&J(i,j+2)&&J(i-2,j)&&J(i,j-2)&&J(i+2,j+1)&&J(i+1,j+2)&&J(i-2,j+1)&&J(i+1,j-2)&&J(i-1,j+2)&&J(i+2,j-1)&&J(i-1,j-2)&&J(i-2,j-1)&&J(i+2,j+2)&&J(i-2,j+2)&&J(i-2,j-2)&&J(i+2,j-2))==0)
    
    J(i,j)=255;
    X_path(num)=j;
    Y_path(num)=i;
    num=num+1;
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
    
end


x(1)=X_path(1);
x(2)=X_path(200);
x(3)=X_path(500);
y(1)=Y_path(1);
y(2)=Y_path(200);
y(3)=Y_path(500);
B=[x y];


X=-10:0.01:10;
m1=(x(1)-x(2))/(y(2)-y(1));
Y1=m1*(X-(x(1)+x(2))/2)+(y(1)+y(2))/2;

m2=(x(2)-x(3))/(y(3)-y(2));
Y2=m2*(X-(x(3)+x(2))/2)+(y(3)+y(2))/2;

Xr=(-m2*((x(3)+x(2))/2)+(y(3)+y(2))/2+m1*((x(1)+x(2))/2)-(y(1)+y(2))/2)/(m1-m2);
Yr=m2*Xr+m2*(-(x(3)+x(2))/2)+(y(3)+y(2))/2;


r=((x(1)-Xr)^2+(y(1)-Yr)^2)^(0.5);
theta=-pi:0.05:pi;
Xc=r*cos(theta)+Xr;
Yc=r*sin(theta)+Yr;
figure;
plot(Xc,Yc);
hold on
plot(X_path,Y_path);

