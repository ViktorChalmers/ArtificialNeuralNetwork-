clc,clear

[xTrain, tTrain, xValid, tValid, xTest, tTest] = LoadMNIST(3);
%%
p = reshape(xTrain,28*28,50000)/255;
xTr = double(p);
[numberOfBits numberOfPatterns] = size(xTr)

tTr = double(tTrain)



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
    'MaxEpochs',800 , ...
    'MiniBatchSize',8192, ...
    'Shuffle', 'every-epoch', ...
    'Plots','training-progress');

[net,tr ] = trainNetwork(xTr,xTr,layers,options);

save autoencoder1
%%
clc,clear
load autoencoder1
%%
clf
hold on
%
index = [2 5 4 7 3 27 28 30 33 37]
%index = [1]


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

%%Montage
xTr;
imshow(xTr(1),[28 28],'InitialMagnification','fit')
