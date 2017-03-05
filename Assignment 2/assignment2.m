clear;
clc;
D1=[[1;2],[-3;-1],[4;5],[-1;1]];
D2=[[0;-2],[5;2],[-1;-4],[3;1]];
D = [D1,D2];
m=[sum(D(1,:));sum(D(2,:))]/8;
S=[0 0;0 0];
for k=1:8
    T = D(:,k)-m;
    S = S + T*T';
end

e=[sqrt(2)/2;sqrt(2)/2];
a = [];
for i=1:8
    a(i)=e'*(D(:,i)-m);
end

xk=[];
for i=1:8
    xk=[xk,m+a(i)*e];
end
m1=[sum(D1(1,:));sum(D1(2,:))]/4;
m2=[sum(D2(1,:));sum(D2(2,:))]/4;
S1=[0 0;0 0];
S2=[0 0;0 0];
for i=1:4
    T1=D1(:,i)-m1;
    T2=D2(:,i)-m2;
    S1 = S1+T1*T1';
    S2 = S2+T2*T2';
end
Sw=S1+S2;
w=Sw^(-1)*(m1-m2);
yk=w'*D;
xk = [];
for i = 1:8
    xk = [xk,yk(i)*w];
end
xk