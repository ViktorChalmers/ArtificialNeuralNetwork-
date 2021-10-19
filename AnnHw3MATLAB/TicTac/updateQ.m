function Q2 = updateQ(Q,player,nextMove)

Q(nextMove(1)-3,nextMove(2)) = player;

Q2 = Q;

stage = Q2(1:3,1:3);

stage(stage==1|stage == -1) = NaN;
Q2(4:end,1:3) = stage;
end

