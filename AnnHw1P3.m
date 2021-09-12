clc,clear
numberOfNeurons = 200;
numberOfRandomPatterns = 7;
numberOfTrials = 20000;
betaNoise = 2;

stochasticFunction = @(b) 1/(1+exp(-2*b*betaNoise));

randomPatterns = randi([0 1],numberOfNeurons,numberOfRandomPatterns);
randomPatterns(randomPatterns == 0) = -1;
 
 weightMatrix = getWeightMatrix(randomPatterns,"ZeroDiagonal");

 feed = randomPatterns(:,1);
 b = McCullochPitts(randomPatterns(:,1),weightMatrix);
 
 for k = 1:5
 wBar = waitbar(0,"initiate");
 for j = 1:100
     progress = j/100;
     waitbar(progress,wBar,progress*100 + "%")
     r = rand(1);
     for i = 1:1000

         for iIteration = 1:length(b)
             if r < stochasticFunction(b(iIteration))
                 s(iIteration,1) = 1;
             else
                 s(iIteration,1)=-1;
             end
         end
         b = McCullochPitts(s,weightMatrix);
     end
 m(j) = mean(b);
 end
 mT(k) = mean(m)
 end
 