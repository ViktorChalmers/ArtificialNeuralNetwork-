function mc = getMcCullochPitts(s,weightMatrix)
for i = 1:length(s)
    for j = 1:length(s)
        sNext(i) = s(i) + weightMatrix(i,j)*s(j);
    end
end
mc = sNext;
end
