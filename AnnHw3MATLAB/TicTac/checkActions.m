function nextMove = checkActions(QTable)
actions = QTable(4:end,1:3);
ma = max(max(QTable(4:end,1:3)));
[row col] = find(actions == ma);
QTable(row,col);

nextMove = [row+3 col];
[len ~]  = size(nextMove);
random = 0;
if len>1
    random = randi(len);
    nextMove = nextMove(random,:);
end


end

