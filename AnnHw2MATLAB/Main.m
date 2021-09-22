VALIDATION_SET = csvread("validation_set.csv");
TRAINING_SET = csvread("training_set.csv");

validationSet = Standardize(VALIDATION_SET(:,[1 2]))
trainingSet = Standardize(TRAINING_SET(:,[1 2]))

plot3(VALIDATION_SET(:,1),VALIDATION_SET(:,2),VALIDATION_SET(:,3),"*")