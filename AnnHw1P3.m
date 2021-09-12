clc,clear
numberOfNeurons = 200;
numberOfRandomPatterns = 45;
numberOfTrials = 100;
stochUpdates = 1000;

betaNoise = 2;
stochasticFunction = @(b) 1/(1+exp(-2*b*betaNoise));

h = waitbar(0,"init");
for trials = 1:numberOfTrials
    
    progress = trials/numberOfTrials;
    waitbar(progress,h,"Loading... " + progress*100 + "%");
    
    randomPatterns = randi([0 1],numberOfNeurons,numberOfRandomPatterns);
    randomPatterns(randomPatterns == 0) = -1;
    feed = randomPatterns(:,1);
    
    weightMatrix = getWeightMatrix(randomPatterns);

    r = rand(1);
    sNext = feedStochasticNetwork(feed,weightMatrix,r,stochasticFunction);
    
    
    for i = 1:stochUpdates
        sNext = feedStochasticNetwork(sNext,weightMatrix,r,stochasticFunction);
    end
    
    m  = zeros(200,1);
    for p = 1:200
        m(p) = m(p) + sNext(p)*feed(p);
    end
    m;
    orderParameter(trials) = mean(m)
    plotBits(sNext,20,10);
end

meanOrderParameter = mean(orderParameter)
