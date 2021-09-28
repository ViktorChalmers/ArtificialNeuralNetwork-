clc,clear
VALIDATION_SET = csvread("validation_set.csv")';
TRAINING_SET = csvread("training_set.csv")';

validationSet = Standardize(VALIDATION_SET([1 2],:));
trainingSet = Standardize(TRAINING_SET([1 2],:))

weightMatrix = gaussian(2,3)
numberOfHiddenNeurons = 10

mu = 2

randomPattern = trainingSet(:,mu)
b = CalculateLocalField(weightMatrix,randomPattern)
hiddenLayer = tanh(b)

WeightMatrix = gaussian(1,3)


%%
hiddenLayer
WeightMatrix
mtimes(WeightMatrix',hiddenLayer)


%%
clc,clear
TRAINING_SET = csvread("training_set.csv")';
NUMBER_OF_PATTERNS = 100;
trainingSet = Standardize(TRAINING_SET([1 2],:));
targetArray = TRAINING_SET(3,:);
numberOfNeurons = 100;
weightMatrix = gaussian(2,numberOfNeurons);
WeightMatrix = gaussian(1,numberOfNeurons)';
etaGradient = 0.05
threshold = zeros(1,numberOfNeurons)
Threshold = zeros(1,numberOfNeurons)
%hiddenLayer = []
%for i = 1:1
mu = randi([1 NUMBER_OF_PATTERNS])
target = targetArray(mu)
randomPattern = trainingSet(:,mu);

neuronLocalField = CalculateLocalField(weightMatrix,randomPattern,threshold(mu))
neuron = tanh(neuronLocalField)

outputLocalField = CalculateLocalField(WeightMatrix,neuron,Threshold(mu))
output = tanh(outputLocalField)
weigthedError = GetWeigthedError(target,output,outputLocalField)
searchDirection = weigthedError*neuron
W = gradientDescent(WeightMatrix,etaGradient,searchDirection)


%classificationError = sum(abs(sign(o)-target))/(2*NUMBER_OF_PATTERNS);

%energyFunction = 1/2*sum((target-o).^2)

%end

%%
plot3(VALIDATION_SET(:,1),VALIDATION_SET(:,2),VALIDATION_SET(:,3),"*")
