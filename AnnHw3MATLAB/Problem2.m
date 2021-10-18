clc,clear
[xTrain, tTrain, xValid, tValid, xTest, tTest] = LoadMNIST(3);
p = reshape(xTrain,28*28,50000);
xTr = double(p)/255;
[numberOfBits numberOfPatterns] = size(xTr)



layers = [
    sequenceInputLayer(784), ...
    fullyConnectedLayer(50,'WeightsInitializer','glorot'), ...
    reluLayer, ...
    fullyConnectedLayer(2,'WeightsInitializer','glorot'), ...
    reluLayer, ...
    fullyConnectedLayer(numberOfBits,'WeightsInitializer','glorot'), ...
    reluLayer, ...
    regressionLayer
    ];

options = trainingOptions('adam', ...
    'InitialLearnRate',0.001, ...
    'MaxEpochs',1200 , ...
    'MiniBatchSize',8192, ...
    'Shuffle', 'every-epoch', ...
    'Plots','training-progress');

[net,tr ] = trainNetwork(xTr,xTr,layers,options);

save autoencoder1

%% Montage
clf,clc
hold on
index = [2 5 4 7 3 27 28 30 33 37];

for i = 1:length(index)
    pattern = xTr(:,index(i));
    
    subplot(2,length(index),i)
    plotPattern(pattern);
    
    subplot(2,length(index),i+10)
    predPattern = net.predict(pattern);
    plotPattern(predPattern);
end
%% LoadNetwork & Break up network (choose autoencoder1 or autoencoder2)

clc,clear
load autoencoder1
clc, clear layersEncode layersDecode
layersEncode = [
    net.Layers(1:5)
    regressionLayer
    ];

layersDecode = [
    sequenceInputLayer(2)
    net.Layers(6:7)
    regressionLayer
    ];

networkEncode = assembleNetwork(layersEncode);
networkDecode = assembleNetwork(layersDecode);
%% Scatterplot of bottleneck of autoencoder1
clf
hold on
tTr = double(tTrain(1:1000));
digit0Index = find(tTr == 1);
digit0 = xTr(:,digit0Index);

digit1Index = find(tTr == 2);
digit1 = xTr(:,digit0Index);

patternIndex = digit0Index

pattern = xTr(:,patternIndex);
output = networkEncode.predict(pattern)
s = scatter(output(1,:),output(2,:),20,'filled')
s.MarkerFaceAlpha = 'flat';

patternIndex = digit1Index

pattern = xTr(:,patternIndex);
output = networkEncode.predict(pattern)
s = scatter(output(1,:),output(2,:),20,'x')
s.MarkerFaceAlpha = 'flat';
axis equal

patternIndex = 1:1000

pattern = xTr(:,patternIndex);
output = networkEncode.predict(pattern)
s = scatter(output(1,:),output(2,:),2,'filled')
s.MarkerFaceAlpha = 'flat';
title("plot for autoencoder 1")
xlabel("Neuron 1")
ylabel("Neuron 2")
fplot(@(x) x,[0 20])
legend("digit 0","digit 1","#1000 first digits","decision boundary")
axis([0 15 0 15])

%% plot well-reproduced for autoencoder2
clf,clc
hold on
tTr = double(tTrain(1:1000));

digit0Index = find(tTr == 1);
digit1Index = find(tTr == 2);
digit2Index = find(tTr == 3);
digit3Index = find(tTr == 4);
digit4Index = find(tTr == 5);
digit5Index = find(tTr == 6);
digit6Index = find(tTr == 7);
digit7Index = find(tTr == 8);
digit8Index = find(tTr == 9);
digit9Index = find(tTr == 10);

output = networkEncode.predict(xTr);

[ma in] = max(output(:,digit8Index))
ones = sum(in(in == 1))
two = sum(in(in == 2))
three = sum(in(in == 3))
four = sum(in(in == 4))

plotIndex = [digit0Index(1) digit1Index(2) digit8Index(5) digit9Index(8)];



for i = 1:length(plotIndex)
    % Plot digit
    subplot(4,2,2*i)
    pat = networkDecode.predict(output(:,plotIndex(i)));
    plotPattern(pat);
    
    % Plot table
    ha = subplot(4,2,i*2-1);
    pos = get(ha,'Position');
    un = get(ha,'Units');
    ou = output(:,plotIndex(i));
    ht = uitable('Units',un,'Data',ou, 'Position',pos);
    title("neurons")
end
