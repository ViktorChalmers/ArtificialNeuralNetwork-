function nextMove = playerMove(Q,player,epsilon)



r = rand;
if r>epsilon
    nextMove = checkActions(Q);
else
    nextMove = randomAction(Q);
end





end

