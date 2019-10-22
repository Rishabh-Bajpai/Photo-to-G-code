% clear;
% M=ones(400,400);
% r=100;
% Xr=200;
% Yr=200;
% theta=-pi:0.001:pi;
% Xc=r*cos(theta)+Xr;
% Yc=r*sin(theta)+Yr;
% for i=1:6284
%     
%     M(ceil(Xc(i)),ceil(Yc(i)))=0;
% end
% 
% j=mat2gray(M);
% imshow(j)
% 

clear;
M=ones(800,800);
theta=200:400;
Xc=theta;
Yc=theta;
X=Xc;
Y=Yc;
for i=1:201
    
    M(ceil(Xc(i)),ceil(Yc(i)))=0;
end
theta=0:200;
Xc=400-theta;
Yc=400+theta;
X=[X Xc];
Y=[Y Yc];
for i=1:201
    
    M(ceil(Xc(i)),ceil(Yc(i)))=0;
end

theta=0:200;
Xc=200+0.02*theta;
Yc=600-theta;
X=[X Xc];
Y=[Y Yc];
for i=1:201
    
    M(ceil(Xc(i)),ceil(Yc(i)))=0;
end

theta=0:200;
Xc=204+theta;
Yc=400-theta;
X=[X Xc];
Y=[Y Yc];
for i=1:201
    
    M(ceil(Xc(i)),ceil(Yc(i)))=0;
end



j=mat2gray(M);
imshow(j)
hold on
% for i=1:804
%     
%     plot(ceil(Y(i)),ceil(X(i)),'o');
%     pause (0.0004);
% end
hold on
pause
for i=1:(length(X)-6)
    for j=(i+5):length(X)
        if (abs(X(i)-X(j))<0.01)
            if(abs(Y(i)-Y(j))<0.01)
                i
                (X(i)-X(j))
                plot(Y(i),X(i),'o');
            end
        end
    end
end