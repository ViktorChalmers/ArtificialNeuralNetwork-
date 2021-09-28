function nextNeuron = Propagate(weightMatrix,neuron)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
V = mtimes(weightMatrix,neuron)-threshold;
V = tanh(V);
nextNeuron = V;
end

