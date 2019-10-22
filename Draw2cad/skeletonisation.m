clear;
M=imread('1.jpg');
J=rgb2gray(M);

found=0;
num_d=1;
num_l=1;
[h,w]=size(J);
Jm=J;
%   converting into 1 and 255
n=0;
for i=1:h
    for j=1:w
        if(J(i,j)<30)
            J(i,j)=0;
            Jm(i,j)=1;
            n=n+1;
            visited(:,n)=[i j];
        else
            J(i,j)=255;
            Jm(i,j)=0;
        end
        
    end
end

imshow(J);
J1=J;

change=0;
n=0;
visitedt=visited;
visitedf=visited;
Jmt=Jm;
while(~isempty(visitedt))
    m=0;
    n=0;
    visitedt=[];
    
    while(n<length(visited(1,:)))
        n=n+1;
        
        i=visited(1,n);
        j=visited(2,n);
        temp=min([Jm(i-1,j) Jm(i-1,j+1) Jm(i+1,j-1) Jm(i-1,j-1) Jm(i+1,j+1) Jm(i+1,j) Jm(i,j-1) Jm(i,j+1)])+1;
        if(Jm(i,j)~=temp)
            Jmt(i,j)=temp;
            m=m+1;
            visitedt(:,m)=[i j];
        end
    end
    
    visited=visitedt;
    Jm=Jmt;
end

Jf=Jm;

for i=1:h
    for j=1:w
        Jf(i,j)=255;
        
        
    end
end

n=0;
while(n<length(visitedf))
    n=n+1;
    
    i=visitedf(1,n);
    j=visitedf(2,n);
    temp=max([Jm(i,j) Jm(i-1,j) Jm(i-1,j+1) Jm(i+1,j-1) Jm(i-1,j-1) Jm(i+1,j+1) Jm(i+1,j) Jm(i,j-1) Jm(i,j+1)]);
    if(Jm(i,j)==temp)
        Jf(i,j)=0;
    end
end
