function b = getB(randomPattern,weightMatrix) 
[numberOfBits numberOfPatterns] = size(randomPattern);

%i->120
%j->120

b = zeros(numberOfBits,1);
i=1;
for i = 1:numberOfBits
    for j=1:numberOfBits
        b(i) = b(i) + weightMatrix(i,j)*randomPattern(j);
    end
end

be = b;
end