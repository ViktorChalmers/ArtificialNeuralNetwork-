function Q1 = updateRewardTable(Q1,nextQ2,reward)

next = Q1(1:3,1:3) ~= nextQ2(1:3,1:3);

QValue = Q1(4:end,1:3);

QValue(next) = reward;

Q1(4:end,1:3) = QValue;

nextQ2;

end

