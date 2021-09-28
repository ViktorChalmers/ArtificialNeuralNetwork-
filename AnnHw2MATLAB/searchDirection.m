
function outputArg1 = searchDirection(neuron, localField, target, output)
%searchDirection(neuron, localField, target, output)
%   Detailed explanation goes here

outputArg1 = (target-output).*sech(localField).^2.*neuron
end

