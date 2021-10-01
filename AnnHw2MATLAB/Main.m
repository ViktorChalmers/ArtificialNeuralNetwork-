clc,clear
VALIDATION_SET = csvread("validation_set.csv")';
TRAINING_SET = csvread("training_set.csv")';

validationSet = Standardize(VALIDATION_SET([1 2],:));
Patterns = Standardize(TRAINING_SET([1 2],:));


clc,clear
VALIDATION_SET = csvread("validation_set.csv")';
TRAINING_SET = csvread("training_set.csv")';

Patterns = Standardize(TRAINING_SET([1 2],:)')';
validationPatterns = Standardize(VALIDATION_SET([1 2],:)')';


[numberOfBits numberOfPatterns] = size(Patterns);
targetOutput = TRAINING_SET(3,:);

[valNumberOfBits valNumberOfPatterns] = size(validationPatterns);
valTargetOutput = VALIDATION_SET(3,:);

numberOfNeurons = 15;

weightMatrixOne = InitializeWeightMatrix(2,numberOfNeurons);
weightMatrixOne = Standardize(weightMatrixOne);
thresholdOne = zeros(numberOfNeurons,1);

weightMatrixTwo = InitializeWeightMatrix(1,numberOfNeurons)';
weightMatrixTwo = Standardize(weightMatrixTwo')';
thresholdTwo = zeros(1,1);

etaGradient = 0.03;

outputarray = zeros(1,numberOfPatterns);
correctionError = 1;
while(correctionError > 0.12)
    for i = 1:10000
        randomPatternNumber = randi([1 numberOfPatterns]);
        
        
        randomPattern = Patterns(:,randomPatternNumber);
        target = targetOutput(randomPatternNumber);
        
        neuronLocalField = CalculateLocalField(weightMatrixOne,randomPattern,thresholdOne);
        neuron = tanh(neuronLocalField);
        
        outputLocalField = CalculateLocalField(weightMatrixTwo,neuron,thresholdTwo);
        output = tanh(outputLocalField);
        
        weightError = (target-output)*sech(outputLocalField)^2;
        weightMatrixTwo = weightMatrixTwo + etaGradient*weightError*neuron';
        thresholdTwo = thresholdTwo - etaGradient*weightError;
        
        se = sech(neuronLocalField).^2';
        delta = weightError*weightMatrixTwo.*se;
        delta = delta';
        
        weightMatrixOne = weightMatrixOne + etaGradient*delta*randomPattern';
        thresholdOne = thresholdOne - etaGradient*delta;
        
        outputarray(randomPatternNumber) = sign(output);
    end
    for iterate = 1:valNumberOfPatterns
        tmpPattern = validationPatterns(:,iterate);
        
        validationNeuron = tanh(CalculateLocalField(weightMatrixOne,tmpPattern,thresholdOne));
        validationOutput(iterate) = tanh(CalculateLocalField(weightMatrixTwo,validationNeuron,thresholdTwo));
    end
    correctionError = 1/(valNumberOfPatterns*2)*sum(abs(sign(validationOutput)-valTargetOutput));
end
plot3(validationPatterns(1,:),validationPatterns(2,:),sign(validationOutput),"*")

csvwrite('w2.csv',weightMatrixTwo)
csvwrite('w1.csv',weightMatrixOne)
csvwrite('t1.csv',thresholdOne)
csvwrite('t2.csv',thresholdTwo)
%VALIDATION_SET = csvread("validation_set.csv")';