clc,clear

p = @(x) 1/(1+exp(-2*x));
numberOfVisableNeurons = 3;
hiddenNeurons = [1 2 3 4 6 8 12 16]
for nrIterate = 1:length(hiddenNeurons)
    numberOfHiddenNeurons = hiddenNeurons(nrIterate)
    k = 100;
    learningRate = 0.1;
    %StorePatterns
    patterns = zeros(8,numberOfVisableNeurons);
    patterns(1,:) = [-1 -1 -1];
    patterns(2,:) = [1 -1 1];
    patterns(3,:) = [-1 1 1];
    patterns(4,:) = [1 1 -1];
    patterns(5:8,:) = -patterns(1:4,:);
    [numberOfPatterns numberOfBits] = size(patterns);
    
    neuronVisable = zeros(numberOfVisableNeurons,1);
    neuronHidden = zeros(numberOfHiddenNeurons,1);
    
    weightMatrix = randn(numberOfVisableNeurons,numberOfHiddenNeurons);
    biasVisable = zeros(numberOfVisableNeurons,1);
    biasHidden = zeros(numberOfHiddenNeurons,1);
    
    %deltaWeightMatrix = zeros(numberOfVisableNeurons,numberOfHiddenNeurons);
    %biasVisable = zeros();
    
    
    for TRIALS = 1:100
        deltaWeightMatrix = zeros(numberOfVisableNeurons,numberOfHiddenNeurons);
        deltaBiasVisable = zeros(numberOfVisableNeurons,1);
        deltaBiasHidden = zeros(numberOfHiddenNeurons,1);
        for mu = 1:20
            indexMu = randi(4);
            neuronVisable = patterns(indexMu,:)';
            neuronVisable0 = neuronVisable;
            
            localFieldHidden = (mtimes(neuronVisable',weightMatrix))'-biasHidden;
            neuronHidden = StochasticUpdate(localFieldHidden);
            for j = 1:k
                localFieldVisable = mtimes(weightMatrix,neuronHidden)-biasVisable;
                neuronVisable = StochasticUpdate(localFieldVisable);
                
                localFieldHidden = (mtimes(neuronVisable',weightMatrix))'-biasHidden;
                neuronHidden = StochasticUpdate(localFieldHidden);
            end
            localFieldHidden0 = (mtimes(neuronVisable0',weightMatrix))'-biasHidden;
            
            deltaWeightMatrix = deltaWeightMatrix+learningRate*(neuronVisable0*tanh(localFieldHidden0)'-neuronVisable*tanh(localFieldHidden)');
            deltaBiasVisable = deltaBiasVisable - learningRate*(neuronVisable0-neuronVisable);
            deltaBiasHidden = deltaBiasHidden - learningRate*(tanh(localFieldHidden0)-tanh(localFieldHidden));
        end
        weightMatrix = weightMatrix + deltaWeightMatrix;
        biasVisable = biasVisable + deltaBiasVisable;
        biasHidden = biasHidden + deltaBiasHidden;
    end
    
    
    
    boltzman = zeros(8,1);
    itOuter = 1000;
    itInner = 1000;
    noHit = 0
    hit = 0
    
    wBar = waitbar(0,"init");
    for outer = 1:itOuter
        waitbar(outer/itOuter,wBar,"Loading... " + outer/itOuter*100 + "%")
        mu = randi(8);
        neuron = patterns(mu,:)';
        localFieldHidden = (mtimes(neuron',weightMatrix))'-biasHidden;
        neuronHidden = StochasticUpdate(localFieldHidden);
        for inner = 1:itInner
            localFieldVisable = mtimes(weightMatrix,neuronHidden)-biasVisable;
            neuron = StochasticUpdate(localFieldVisable);
            
            localFieldHidden = (mtimes(neuron',weightMatrix))'-biasHidden;
            neuronHidden = StochasticUpdate(localFieldHidden);
            
            for j = 1:8
                if (neuron==patterns(j,:)')
                    boltzman(j) = boltzman(j) + 1/(itInner*itOuter);
                    hit = hit + 1;
                end
            end
        end
    end
    close(wBar)
    
    boltzmanStore(nrIterate,:) = boltzman
    sum(boltzman)
end

probPatterns(1:4) = 1/4;
probPatterns(5:8) = 0;
boltzman
sum(boltzman)
probPatterns
boltzmanStore(:,5:8) = []
probPatterns(5:8) = []


boltzmanStore(1,:)
for i = 1:length(boltzmanStore(:,1))
    kl(i) = sum(probPatterns.*log(probPatterns./boltzmanStore(i,:)))
end
%%
hold on
plot(hiddenNeurons,kl)
plot(hiddenNeurons,kl,"o")
set(gca,'ytick',[])
ylabel("Dkl")
xlabel("number of hidden neurons")
