clc;
clear;

%% Load data sets
load('hw4.mat');
x1 = hw4_2_1;
x2 = hw4_2_2;

%% Plot the data set in 2-D
figure(1);
plot(x1(1,:), x1(2,:), 'ro', x2(1,:), x2(2,:), 'o');

%% Plot the data set in 3-D
figure(2);
plot3(x1(1,:), x1(2,:), x1(1,:).*x1(2,:), 'ro',...
    x2(1,:), x2(2,:), x2(1,:).*x2(2,:), 'o');
grid on

%% Batch Perceptron
y1 = [ones(1,100); x1; x1(1,:).*x1(2,:)];
y2 = [ones(1,100); x2; x2(1,:).*x2(2,:)];
y = [y1, -y2];

theta = 1;
ita = 1;
a = sum(y, 2);

while true
    missClass = find((a'*y)<0)
    a=a+ita*sum(y(:,missClass),2);
    if abs(ita*sum(y(:,missClass),2))<theta
        break
    end
end
a

