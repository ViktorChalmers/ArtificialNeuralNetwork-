clc,clear

[xTrain, tTrain, xValid, tValid, xTest, tTest] = LoadMNIST(3);
%%
p = reshape(xTrain,28*28,50000)/255;
xTr = double(p);
[numberOfBits numberOfPatterns] = size(xTr)

%%

layers = [
    sequenceInputLayer(784), ...
    fullyConnectedLayer(50,'WeightsInitializer','glorot'), ...
    reluLayer, ...
    fullyConnectedLayer(4,'WeightsInitializer','glorot'), ...
    reluLayer, ...
    fullyConnectedLayer(numberOfBits,'WeightsInitializer','glorot'), ...
    reluLayer, ...
    regressionLayer
    ];

options = trainingOptions('adam', ...
    'InitialLearnRate',0.001, ...
    'MaxEpochs',800 , ...
    'MiniBatchSize',8192, ...
    'Shuffle', 'every-epoch', ...
    'Plots','training-progress');

[net,tr ] = trainNetwork(xTr,xTr,layers,options);

save autoencoder2
%% LoadNetwork
clc,clear
load autoencoder2
%% Montage
clf
hold on
index = [2 5 4 7 3 27 28 30 33 37];

for i = 1:length(index)
    pattern = xTr(:,index(i));

    subplot(length(index),2,i*2-1)
    plotPattern(pattern)

    subplot(length(index),2,i*2)
    predPattern = net.predict(pattern);
    plotPattern(predPattern)
end
%% Break up network
clc, clear layersEncode layersDecode
layersEncode = [
    net.Layers(1:5)
    regressionLayer
    ];

layersDecode = [
    sequenceInputLayer(4)
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
s = scatter(output(1,:),output(2,:),20,'filled')
s.MarkerFaceAlpha = 'flat';

patternIndex = 1:1000

pattern = xTr(:,patternIndex);
output = networkEncode.predict(pattern)
s = scatter(output(1,:),output(2,:),2,'filled')
s.MarkerFaceAlpha = 'flat';

fplot(@(x) x,[0 10])
legend("digit 0","digit 1","decision boundary")
axis equal

%%
load wellReproducedNinesIndex.mat
patNumber = [2 5 4 7 3 27 28 30 33 37];
patNumber = wellReproducedNinesIndex
%patNumber = 1:100

pattern = xTr(:,patNumber);
output = networkEncode.predict(pattern)
s = scatter(output(1,:),output(2,:),10,'filled')
s.MarkerFaceAlpha = 'flat';
%Describe rule.

%use rule to recreate digits. repeat training. splitting, for 4 hidden
%neurons and use for 4 hidden neurons and use to create digits. will feed 4
%pieces to decoder to get pichures.

%%

%%
wellreproduced = []
for i = 11:50
    pattern = xTr(:,i);
    subplot(1,2,1)
    pat = double(xTr(:,i));
    pat = reshape(pat,[28 28]);
    imshow(pat,[28 28],'InitialMagnification','fit')

    subplot(1,2,2)
    predPattern = net.predict(pattern);
    predPattern = double(predPattern);
    predPattern = reshape(predPattern,[28 28]);
    imshow(predPattern,[28 28],'InitialMagnification','fit')
    wellreproduced(i) = waitforbuttonpress
end

index = [];
for j = 1:length(wellreproduced)
    if (wellreproduced(j) == 1)
        index = [index j];
    end
end
index
for i = 1:length(index)
    pattern = xTr(:,index(i));

    subplot(length(index),2,i*2-1)
    pat = double(xTr(:,index(i)));
    pat = reshape(pat,[28 28]);
    imshow(pat,[28 28],'InitialMagnification','fit')

    subplot(length(index),2,i*2)
    predPattern = net.predict(pattern);
    predPattern = double(predPattern);
    predPattern = reshape(predPattern,[28 28]);
    imshow(predPattern,[28 28],'InitialMagnification','fit')
end

%%
load wellReproducedIndex.mat
wellReproducedIndex = [wellReproducedIndex index]
save wellReproducedIndex.mat wellReproducedIndex
%%
load wellReproducedOnesIndex.mat
wellReproducedOnesIndex = [wellReproducedOnesIndex index]
save wellReproducedOnesIndex.mat wellReproducedOnesIndex
%%
load wellReproducedNinesIndex.mat
wellReproducedNinesIndex = [wellReproducedNinesIndex index]
save wellReproducedNinesIndex.mat wellReproducedNinesIndex

%% autoencoder1
clc
x = linspace(0,3);
y = x;

for i = 1:100
    pat = networkDecode.predict([x(i);y(i)]);
    plotPattern(pat);
    pause(0.01)
end
%%
clf
x = linspace(1,5)
k1 = 1
k2 = 1
k3 = 1
k4 = 1
for i = 1:100
    pat = networkDecode.predict([x(i)*k1;x(i)*k2;x(i)*k3;x(i)*k4]);
    plotPattern(pat);
    pause(0.01)
end