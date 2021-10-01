function output = InitializeWeightMatrix(inputArg1,numberOfNeurons)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here


x = linspace(-10,10,numberOfNeurons);
y = normpdf(x,0,1/sqrt(2));

mu = 0; 
sd = 1/sqrt(2); 
x = linspace(-4*sd,4*sd,numberOfNeurons);
y = 1/(2*pi*sd)*exp(-(x-mu).^2/(2*sd^2));



for i = 1:inputArg1
R = normrnd(0,1,1,numberOfNeurons);
R = R/max(R)
    out(:,i) = R;
end
rand = randi([1 numberOfNeurons],inputArg1,numberOfNeurons)';



output = out(rand);
end

