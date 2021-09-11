clc,clear
numberOfNeurons = 200;
numberOfRandomPatterns = 7;
numberOfTrials = 20000;
betaNoise = 2

stochasticFunction = @(b) 1/(1+exp(-2*b*betaNoise));

randomPatterns = randi([0 1],numberOfNeurons,numberOfRandomPatterns);
randomPatterns(randomPatterns == 0) = -1;
 
 weightMatrix = getWeightMatrix(randomPatterns,"ZeroDiagonal");

 
 r = rand(1)
 if r<