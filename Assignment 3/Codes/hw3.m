clear;
clc;
load('/Users/zezhouli/Documents/2016-2017 Fall Semester/CPE646-Pattern Recognition/Assignments/Assignment 3/hw3.mat');

x = hw3_1;
n = size(x, 2);
dimension = n / 2;

sum1_x = sum(x(:,1:50), 2);
u1_hat = sum1_x / dimension;
delta21_hat = (x(:,1:50)-repmat(u1_hat,1,50))*(x(:,1:50)-repmat(u1_hat,1,50))' / dimension;

sum2_x = sum(x(:,51:end), 2);
u2_hat = sum2_x / dimension;
delta22_hat = (x(:,51:100)-repmat(u2_hat,1,50))*(x(:,51:100)-repmat(u2_hat,1,50))' / dimension;

% EM Algorithm
tol = 1e-6;
maxiter = 500;
llh = -inf(1,maxiter);

model.mu = [u1_hat,u2_hat];
model.Sigma(:,:,1) = delta21_hat;
model.Sigma(:,:,2) = delta22_hat;
model.w = [0.5 0.5];

for iter = 2:maxiter
    disp(['iteration step: ',num2str(iter)]);
    [R, llh(iter)] = expectation(x,model);
    [~,label(1,:)] = max(R,[],2);
    R = R(:,unique(label));   % remove empty clusters
    model = maximization(x,R);
    if abs(llh(iter)-llh(iter-1)) < tol*abs(llh(iter)); break; end;
end
llh = llh(2:iter);

figure(1);
plot(llh);
figure(2);
plotClass(x,label);

mu1 = model.mu(:,1);
mu2 = model.mu(:,2);
Sigma1 = model.Sigma(:,:,1);
Sigma2 = model.Sigma(:,:,2);
w = model.w;
