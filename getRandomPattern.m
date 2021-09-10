function [randomPattern randomPatternNumber randomPatternBitNumber] = getRandomPattern(X)

[numberOfBits numberOfPatterns] = size(X);

randomPatternNumber = randi([1 numberOfPatterns]);

randomPattern = X(:,randomPatternNumber);
randomPatternBitNumber = randi([1,numberOfBits]);
end