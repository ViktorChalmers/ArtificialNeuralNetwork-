
function nextMove = randomAction(Q)
actions = Q(4:end,1:3);
%[row col]  = find(isnan(QTable) == 1);


%X = ones(10,4);
%X(3,4) = NaN;
%[row col] = find(isnan(QTable) == 1)

[row col] = find(isnan(actions) == 0);
possibleMoves = [row col];

random = randi(length(possibleMoves),1,2);
possibleMoves=possibleMoves(random);
possibleMoves(1)=possibleMoves(1)+3;

nextMove = possibleMoves;
end

