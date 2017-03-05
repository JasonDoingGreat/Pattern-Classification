function y = getResponse(neighbors)
	classVotes = containers.Map('KeyType', 'int32', 'ValueType','any');
    classVotes = initializeMap(classVotes);
	for i = size(neighbors,2)
		response = neighbors[x][-1]
		if response in classVotes:
			classVotes[response] += 1
		else:
			classVotes[response] = 1
        end
	end
	sortedVotes = sorted(classVotes.iteritems(), key=operator.itemgetter(1), reverse=True)
	return sortedVotes[0][0]
end