function be = McCullochPitts(s,weightMatrix) 
[numberOfBits numberOfPatterns] = size(s);

b = zeros(numberOfBits,1);

for i = 1:numberOfBits
    for j=1:numberOfBits
        b(i) = b(i) + weightMatrix(i,j)*s(j);
    end
end

be = b;
end