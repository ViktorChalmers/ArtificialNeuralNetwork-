clc,clear
input = [1 3 1 2 1;1 3 1 2 1]';
weightMatrix = fix(rand(4,2)*2+1);
weightMatrix(weightMatrix == 2) = -1;
getHiddenLayer(input,weightMatrix);
function neurons = getHiddenLayer(input,weightMatrix,bias)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
[numberOfNeurons ~] = size(weightMatrix);

if nargin == 2 || isempty(bias)
    bias = 0;
end

for j = 1:numberOfNeurons
   V(j) = -bias+sum([weightMatrix(j,:),input(j,:)]);
   V(j) = tanh(V(j))
end

neurons = 1;
end

