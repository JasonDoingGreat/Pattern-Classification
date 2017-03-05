function y = euclideanDistance(instance1, instance2)
	distance = 0;
    for i = 1:2
        distance = distance + (instance1(i) - instance2(i))^2;
    end
	y = sqrt(distance);
end