clc
%[xTrain, tTrain, xValid, tValid, xTest, tTest] = LoadMNIST(1);

pattern = xTrain(:,1);


%imshow(pattern,[28 28],'InitialMagnification','fit')
for mu = 1:10000
    classTrain(mu) = find(tTrain(:,mu)==1)-1;
end

csvwrite("classifications.csv",classTrain)
%%
[xTrain, tTrain, xValid, tValid, xTest, tTest] = LoadMNIST(3);
%figure
%imshow(xTrain(:,:,1,25081))

layers = [
    imageInputLayer([28 28 1])
    convolution2dLayer(3,20,'Padding',1,'WeightsInitializer','narrow-normal','BiasInitializer','narrow-normal')
    batchNormalizationLayer
    reluLayer
    maxPooling2dLayer(2,'Stride',2)
    convolution2dLayer(3,30,'Padding',1,'WeightsInitializer','narrow-normal','BiasInitializer','narrow-normal')
    batchNormalizationLayer
    reluLayer
    maxPooling2dLayer(2,'Stride',2)
    convolution2dLayer(3,50,'Padding',1,'WeightsInitializer','narrow-normal','BiasInitializer','narrow-normal')
    batchNormalizationLayer
    reluLayer
    fullyConnectedLayer(10,'WeightsInitializer','narrow-normal','BiasInitializer','narrow-normal')
    softmaxLayer
    classificationLayer];

options = trainingOptions( 'sgdm',...
    'Momentum',0.9, ...
    'MiniBatchSize', 8192, ...
    'ValidationData',{xValid, tValid}, ...
    'ValidationFrequency', 30, ...
    'MaxEpochs', 10, ...
    'ValidationPatience', 5, ...
    'Plots', 'training-progress', ...
    'InitialLearnRate', 0.01, ...
    'L2Regularization', 0, ...
    'Shuffle', 'every-epoch', ...
    'ExecutionEnvironment', 'parallel');

[network,tr] = trainNetwork(xTrain,tTrain,layers,options);
%%
predtTrain = network.classify(xTrain);

TrainAccurracy = sum(predtTrain == tTrain)/numel(tTrain)
%%
tTrain(1:10)
pattern = xTrain(:,:,6);
%imshow(pattern,[28 28],'InitialMagnification','fit')

p = double(string(predtTrain))

csvwrite("classifications.csv",p)
%%
%xTrain(:,:,:);
xTest2 = Load2();
xTest2(:,:,1)
pattern = xTrain(:,:,6);
imshow(pattern,[28 28],'InitialMagnification','fit')
%%
predtTrain = network.classify(xTest2);
p = double(string(predtTrain))
pattern = xTrain(:,:,4);
imshow(pattern,[28 28],'InitialMagnification','fit')
csvwrite("classifications.csv",p)