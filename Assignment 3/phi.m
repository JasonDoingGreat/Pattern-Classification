function y=phi(x)
    mu = [0 0];
    Sigma = [1 0;0 1];
    [X1,X2] = meshgrid(x(1,:),x(2,:));
    y = mvnpdf([X1(:) X2(:)], mu, Sigma);
end