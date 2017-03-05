function [neighbors, maxDis] = getNeighbors(dataSet, Instance, k)
    distances = [];
    for i = 1:size(dataSet,2)
        dist = euclideanDistance(Instance, dataSet(:,i));
        distances = [distances;dist];
    end
    [B, I] = sort(distances);
    neighbors = [];
    for i = 1:k
        neighbors = [neighbors, dataSet(:,I(i))];
    end
    maxDis = euclideanDistance(Instance, neighbors(:,end));
end