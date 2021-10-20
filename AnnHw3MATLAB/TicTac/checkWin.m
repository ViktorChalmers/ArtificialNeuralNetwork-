function win = checkWin(Q,player)

state = Q(1:3,1:3);
win = 0;
for i = 1:3
    if isequal(state(i,:),[player player player])
        "Row";
        state(i,:);
        state;
        win = 1;

    elseif isequal(state(:,i),[player; player; player])
        "Col";
        state(i,:);
        state;
        win = 1;

    end
end
if isequal(diag(state'),[player; player; player]) | isequal(diag(flip(state)),[player; player; player])
    diag(flip(state));
    diag(state');
    "Diag";
    state;
    win = 1;
  
end

end

