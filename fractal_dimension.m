clc
tic
clear N
% The number of step
ss=8;
% The data which we want to colculate the fractal dimension
% Before run the program we have to load our data and put the name of it infront of "data="
% The data which we want to use must be double
data=rand(1,100);
% I have chosen a random vector "rand(1,100)" which you have to change
x=data(1:end-1);
y=data(2:end);
minx=min(x);
maxx=max(x);
miny=min(y);
maxy=max(y);
dx=maxx-minx;
dy=maxy-miny;
%%
for i1=1:ss
    I1=i1-1;
    X=minx;
    count=0;
    dxi=dx/(2^I1);
    dyi=dy/(2^I1);
    for i2=1:2^I1
        X=X+dxi;
        Y=miny;
        for i2=1:2^I1
            Y=Y+dyi;
            L=length(find(x<=X & x>=(X-dxi) & y<=Y & y>=(Y-dyi)));
            if L>0
               count=count+1;
            end
        end
    end
    N(i1)=count;
end
N;
clear x y
for i=0:ss-1
    b(i+1)=dx/(2^i); 
end
x=log2(b);
y=log2(N);
clear N;
N=size(x,2);
a=[N*x*y'-sum(x)*sum(y)]/[N*sum(x.^2)-sum(x)^2];
b=[sum(x.^2)*sum(y)-x*y'*sum(x)]/[N*sum(x.^2)-sum(x)^2];
FD=abs(a)
toc
