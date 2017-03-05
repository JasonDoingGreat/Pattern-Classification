clear;
clc;
load('hw3.mat');
data1 = hw3_2_1;
hn = 0.2;
s=0;
r=0;
t=0;
for i=-4:0.1:8
    r=r+1;
    for j=-4:0.1:8
        t=t+1;
        for m=1:100
            d=sqrt((i-data1(1,m))^2+(j-data1(2,m))^2)/hn;
            y = 1/sqrt(2*pi)*exp(-d^2/2)/hn;
            s=s+y;
        end
        p(r,t) = s/100;
        s=0;
    end
    t=0;
end
meshgrid(p);