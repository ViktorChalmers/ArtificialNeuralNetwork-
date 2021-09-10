clear,clc
patterns = [12,24,48,70,100,120];
numberOfBits = 120;
trials = 10e5;
X = randi([0 1],numberOfBits,patterns(1));
X(X == 0) = -1;
weightMatrix = zeros(numberOfBits,numberOfBits);
mtimes(X(:,1),X(:,1)');

%for j = 1:trials
for i = 1:12
   %W = W+outerproduct
   %W = ntimes(Xi,Xi)
    weightMatrix = (weightMatrix+mtimes(X(:,i),X(:,i)'))/numberOfBits;
end

for i = 1:numberOfBits
    weightMatrix(i,i) = 0;
end

bRand=zeros(2)
for j=1:2
    
    
randomNumber = randi([1,patterns(1)]);
randomPattern = X(:,randomNumber);
randomBit = randomPattern(randi([1,numberOfBits]));
weightMatrix(:,1);

length(X(120,1));
length(weightMatrix(1,:));
%b = zeros(1,12);

bRand = 0

for i = 1:12
    bRand(j) = bRand(j)+weightMatrix(randomNumber,i)*randomPattern(i);
end

end


randomPattern;
if (sign(b) == sign(randomPattern));
"hej"
end

