% clc,clear
% Q2 = rand(6,3);
% Q2(1:3,1:3) = [0 1 0;
%     1 -1 -1;
%     0 0 0];
% Q2(4) = .3;
% nextQ2 = rand(6,3);
% nextQ2(1:3,1:3) = [1 1 -1;
%     1 -1 -1;
%     0 0 0];
% nextQ2(6) = 1;
% player = 1;
% Q2(4:end,1:3) = zeros(3)
% Q2
% nextQ2
% calculate(Q2,nextQ2,player,1)

function Q = calculate(Q,nextQ,player,R)
%player1&2 and R = 1 if winning.
alpha = 0.1;
gamma = 0.1;



actions = Q(4:end,1:3);
max(nextQ);
k = (Q(1:3,1:3)-nextQ(1:3,1:3));
[row col] = find(k == -player);
Q;
ma = max(max(nextQ));
Q(row+3,col) = Q(row+3,col)+alpha*(R+ma*gamma-Q(row+3,col));

end

