function ongoingGame = checkGame(Q)
game = Q(4:end,1:3);
ongoingGame = 1;
if isnan(game)
   ongoingGame = 0;
end
end

