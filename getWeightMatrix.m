function wMatrix = getWeightMatrix(patterns)

X = patterns;
[numberOfBits numberOfPatterns] = size(X);
W = zeros(numberOfBits,numberOfBits);

for i = 1:numberOfPatterns
    W = W+mtimes(X(:,i),X(:,i)');
end

wMatrix = (W/numberOfBits);
end