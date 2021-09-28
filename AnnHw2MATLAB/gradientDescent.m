function updated = gradientDescent(weightMatrix, eta, searchDirection)
%gradientDescent(weightMatrix, eta, searchDirection)
%   Detailed explanation goes here

updated = weightMatrix + eta.*searchDirection
end

