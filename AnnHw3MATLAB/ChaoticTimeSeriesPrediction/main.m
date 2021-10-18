clc,clear
xTest = csvread("test-set-4.csv");
xTrain = csvread('training-set.csv');

nNeurons = 500;

feed = xTrain;

timeTrain = length(feed(1,:));

weightIn = InitializeWeightMatrix([nNeurons,3],0,0.002);
weight = InitializeWeightMatrix([nNeurons,nNeurons],0,2/nNeurons);
weightOut = InitializeWeightMatrix([3,nNeurons],0,0.002);

r(:,1) = zeros(nNeurons,1);
R = zeros(nNeurons,timeTrain);


for t = 1:timeTrain    
    r = tanh(mtimes(weight,r)+mtimes(weightIn,feed(:,t)));
    R(:,t) = r;
end


k = 0.01
weightOut = xTrain*R'*inv(R*R'+k*eye(nNeurons,nNeurons));

out = mtimes(weightOut,R);


feed = xTest;

timeTest = length(feed(1,:));

r = [];
r(:,1) = zeros(nNeurons,1);


for t = 1:timeTest
    r = tanh(mtimes(weight,r)+mtimes(weightIn,feed(:,t)));
end

y = [];
out = mtimes(weightOut,r);
clf
for t = 1:500
    y = [y out];
    r = tanh(mtimes(weight,r)+mtimes(weightIn,out));
    out = mtimes(weightOut,r);
end

clf

plot3(feed(1,:),feed(2,:),feed(3,:))
hold on
plot3(y(1,:),y(2,:),y(3,:))
csvwrite("prediction.csv",y(2,:))
