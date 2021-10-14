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

%%

predtTrain = net.predict(xTr);
pat = double(predtTrain(:,3))
pat = reshape(pat,[28 28])
imshow(pat,[28 28])
%imshow(pattern,[28 28],'InitialMagnification','fit')







%%
save autoencoder1