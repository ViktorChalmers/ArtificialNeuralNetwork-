clc,clear,clf

p = @(x) 1/(1+exp(-2*x));
numberOfVisableNeurons = 3;
probPatterns(1:4) = 1/4;
hiddenNeurons = [2]
boltzmanStore = zeros(length(hiddenNeurons),8)
AVG = 5
wBar = waitbar(0,"init");
for average = 1:AVG
    waitbar(average/AVG,wBar,"Loading... " + average/AVG*100 + "%")
    for nrIterate = 1:length(hiddenNeurons)
        numberOfHiddenNeurons = hiddenNeurons(nrIterate);
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
        
        for outer = 1:itOuter
            
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
                    end
                end
            end
        end
        boltzmanStore(nrIterate,:) = boltzmanStore(nrIterate,:) + boltzman'/AVG
    end
    
    for i = 1:length(numberOfPatterns)
        kl(i) = sum(probPatterns(1:4).*log(probPatterns(1:4)./boltzmanStore(i,1:4)));
    end
    kl
    
    plot(hiddenNeurons,kl)
end
close(wBar)

probPatterns(5:8) = 0;
boltzman;
sum(boltzman);
probPatterns;
boltzmanStore(:,5:8) = [];
probPatterns(5:8) = [];



for i = 1:length(numberOfPatterns)
    kl(i) = sum(probPatterns.*log(probPatterns./boltzmanStore(i,:)))
end
%%
clf
hold on
title("Average over 50 realisations of Kullback-Leibler divergence")
plot(hiddenNeurons,kl)
plot(hiddenNeurons,kl,"o")
ylabel("Dkl")
xlabel("number of hidden neurons")
talbe(kl)

%% latest
B = [0.0971    0.2374    0.1656    0.1313    0.1134    0.0968    0.0755    0.0829;
    0.2194    0.1158    0.1650    0.1444    0.0512    0.0849    0.0878    0.1315;
    0.2655    0.2243    0.2125    0.2622    0.0077    0.0131    0.0130    0.0018;
    0.2445    0.2523    0.2500    0.2442    0.0025    0.0024    0.0008    0.0034]

j = [0.5132    0.4662    0.0408    0.0092]
%%
N = 3
M=2
log(2)*(N-log2(M+1)-(M+1)/(2^(log2(M+1))))
log2(4)

