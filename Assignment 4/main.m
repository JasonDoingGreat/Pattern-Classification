clear,
clc,

%% Load data sets
load('hw3.mat');
x1 = hw3_2_1;
x2 = hw3_2_2;

%% Find neighbors
l = 0;
for i = -4:0.1:8
    l = l+1;
    m=0;
    for j = -4:0.1:8
        m=m+1;
        p1(l,m) = 0;
        p2(l,m) = 0;
        [neighbors1, maxDis1] = getNeighbors(x1, [i;j], 10);
        [neighbors2, maxDis2] = getNeighbors(x2, [i;j], 10);
        Vn1 = pi * maxDis1^2;
        Vn2 = pi * maxDis2^2;
        p1(l,m) = 10/100/Vn1;
        p2(l,m) = 10/100/Vn2;
        if i == 1 && j == -2
            p1(l,m)
            p2(l,m)
        end
    end
end

% figure(1);
% mesh(p1);
% figure(2);
% mesh(p2);



