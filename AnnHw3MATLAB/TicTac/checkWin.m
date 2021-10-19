function win = checkWin(Q,player)

state = Q(1:3,1:3);
win = 0;
for i = 1:3
    if state(:,i) == player
        "Row"
        win = 1;

    elseif state(i,:) == player
        "Col"
        win = 1;

    end
end
if diag(state')==player | diag(flip(state))==player
    "Diag"
    win = 1;
  
end

end

