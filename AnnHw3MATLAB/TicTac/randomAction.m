function nextMove = randomAction(Q)
actions = Q(4:end,1:3);

[row col] = find(isnan(actions) == 0);

possibleMoves = [row col];

[len ~]  = size(possibleMoves);
if(len>1)
random = randi(length(possibleMoves));
possibleMoves=possibleMoves(random,:);
possibleMoves(1)=possibleMoves(1)+3;
else
    possibleMoves(1)=possibleMoves(1)+3;
end
Q;
nextMove = possibleMoves;


% 
% actions = QTable(4:end,1:3);
% ma = max(max(QTable(4:end,1:3)));
% [row col] = find(actions == ma);
% QTable(row,col);
% 
% nextMove = [row+3 col];
% [len ~]  = size(nextMove);
% random = 0;
% if len>1
%     random = randi(len);
%     nextMove = nextMove(random,:);
% end

end

