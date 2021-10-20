clc,clear

gamma = 1;
alpha = 1;
epsilon = 1;
nGames = 1;
for iGames = 1:nGames
Q1 = zeros(6,3);
Q2 = zeros(6,3);

Q1Table = [Q1];
Q2Table = [Q2];
onGoingGame = 1;


while(onGoingGame)
    nextMove = playerMove(Q1,1,epsilon);
    nextQ2 = updateQ(Q1,1,nextMove);
    if(checkWin(nextQ2,1))
        "winner 1"
        nextQ2;
        plotQ(nextQ2);
        pause(.1)
        Q2;
        Q2Table;
        Q1;
        Q1 = updateRewardTable(Q1,nextQ2,1)
        Q2 = updateRewardTable(Q2,nextQ2,-1);
        [Q1Table Q1] = updateQTable(Q1Table,Q1);
        [Q2Table Q2] = updateQTable(Q2Table,Q2);
        break
    else
        Q2 = calculate(Q2,nextQ2,1,0)
        [Q2Table Q2] = updateQTable(Q2Table,Q2);
        [Q2Table Q2] = updateQTable(Q2Table,nextQ2);
    end
    if(~checkGame(Q2))
        "draw1"
        plotQ(Q2);
       pause(1)
        break
    end
    nextMove = playerMove(Q2,-1,epsilon);
    nextQ1 = updateQ(Q2,-1,nextMove);
    if(checkWin(nextQ1,-1))
        "winner 2"
        nextQ1;
        plotQ(nextQ1);
        pause(.1)
        Q1;
        Q1Table;
        Q2;
        Q2 = updateRewardTable(Q2,nextQ1,1);
        Q1 = updateRewardTable(Q1,nextQ1,-1)
        [Q2Table Q2] = updateQTable(Q2Table,Q2);
        [Q1Table Q1] = updateQTable(Q1Table,Q1);
        break
    else
        [Q1Table Q1] = updateQTable(Q1Table,nextQ1);
    end
    if(~checkGame(Q1))
        "draw2"
        plotQ(Q1);
        pause(.1)
        break
    end
    plotQ(Q2);
    pause(0.1)
    plotQ(Q1);
    pause(0.1)
    
end
end
Q1Table
Q2Table
