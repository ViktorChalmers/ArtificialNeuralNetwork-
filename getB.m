function b = getB(randomPattern,weightMatrix) 
[numberOfBits numberOfPatterns] = size(randomPattern);

b = zeros(numberOfBits,1);

for i = 1:numberOfBits
    for j=1:numberOfBits
        b(i) = b(i) + weightMatrix(i,j)*randomPattern(j)/numberOfBits;
    end
end

be = b;
end