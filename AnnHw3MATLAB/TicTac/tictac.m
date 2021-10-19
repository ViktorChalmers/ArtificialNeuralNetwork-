clc,clear

gamma = 1;
alpha = 1;
epsilon = 0;

Q1 = zeros(6,3);
Q2 = zeros(6,3);

Q1Table = [Q1];
Q2Table = [Q2];

for i = 1:10
nextMove = playerMove(Q1,1,epsilon);
nextQ2 = updateQ(Q1,1,nextMove);
if(checkWin(nextQ2,1))
    "winner 1"
    nextQ2
    Q2;
    Q2Table;
    Q1
    Q1 = updateRewardTable(Q1,nextQ2,1);
    Q2 = updateRewardTable(Q2,nextQ2,-1);
    [Q1Table Q1] = updateQTable(Q1Table,Q1)
    [Q2Table Q2] = updateQTable(Q2Table,Q2)
    break
else
    [Q2Table Q2] = updateQTable(Q2Table,nextQ2);
end

nextMove = playerMove(Q2,-1,epsilon);
nextQ1 = updateQ(Q2,-1,nextMove);
if(checkWin(nextQ1,-1))
    "winner 2"
    
    %Q1 = updateRewardTable(Q1,Q2)
    %[Q1Table Q1] = updateQTable(Q1Table,Q1)
    break
else
    [Q1Table Q1] = updateQTable(Q1Table,nextQ1);
end
end
