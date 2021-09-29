function array = StochasticUpdate(neurons)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
p = @(x) 1/(1+exp(-2*x));
array = zeros(size(neurons));
for i = 1:length(neurons)
            r = rand;
            if r<p(neurons(i))
                array(i) = +1;
            else
                array(i) = -1;
            end
end
array = array;
end
