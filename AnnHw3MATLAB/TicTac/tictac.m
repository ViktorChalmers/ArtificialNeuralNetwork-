clc,clear,clf

gamma = 1;
alpha = 1;
epsilon = 1;
nGames = 2;
Q1 = zeros(6,3);
Q2 = zeros(6,3);

nextQ1 = zeros(6,3);
nextQ2 = zeros(6,3);

Q1Table = [Q1];
Q2Table = [Q2];

moveList = [5 2;
            4 1;
            5 1;
            6 2;
            5 3;
            1 3];
for iGames = 1:nGames
    iGames;
    Q1 = zeros(6,3);
    Q2 = zeros(6,3);
    
    %Q1Table = [Q1];
    %Q2Table = [Q2];
    onGoingGame = 1;
    iter = 0;
    while(onGoingGame)
        iter = iter+1;
        %nextMove = playerMove(Q1,1,epsilon);
        nextMove = moveList(iter*2-1,:);
        nextQ2 = updateQ(Q1,1,nextMove);
        nextQ2 = fetchQTable(Q2Table,nextQ2);
        Q1Table;
        Q1 = fetchQTable(Q1Table,Q1);
        if(checkWin(nextQ2,1))
            "winner 1";
            nextQ2;
            plotQ(nextQ2);
            % pause(.1)
            Q2;
            Q2Table;
            Q1;
            %Q1 = updateRewardTable(Q1,nextQ2,1);
            %Q2 = updateRewardTable(Q2,nextQ2,-1);
            Q2 = calculate(Q2,nextQ2,-1,-1);
            Q1 = calculate(Q1,nextQ2,1,1);
            [Q1Table Q1] = updateQTable(Q1Table,Q1);
            [Q2Table Q2] = updateQTable(Q2Table,Q2);
            break
        elseif(~checkGame(nextQ2))
            "draw1";
            plotQ(nextQ2);
            %pause(1)
            break
        else
            Q2 = calculate(Q2,nextQ2,1,0);
            [Q2Table Q2] = updateQTable(Q2Table,Q2);
            [Q2Table Q2] = updateQTable(Q2Table,nextQ2);
        end
        
        %nextMove = playerMove(Q2,-1,epsilon);
        nextMove = moveList(iter*2,:);
        nextQ1 = updateQ(Q2,-1,nextMove);
        nextQ1 = fetchQTable(Q1Table,nextQ1);
        Q2 = fetchQTable(Q2Table,nextQ2);
        if(checkWin(nextQ1,-1))
            "winner 2";
            nextQ1;
            plotQ(nextQ1);
            %pause(.1)
            Q1;
            Q1Table;
            Q2;
            %Q2 = updateRewardTable(Q2,nextQ1,1);
            %Q1 = updateRewardTable(Q1,nextQ1,-1);
            Q1 = calculate(Q1,nextQ1,1,-1);
            Q2 = calculate(Q2,nextQ1,-1,1);
            [Q2Table Q2] = updateQTable(Q2Table,Q2);
            [Q1Table Q1] = updateQTable(Q1Table,Q1);
            break
        elseif(~checkGame(nextQ1))
            "draw2"
            plotQ(nextQ1);
            %pause(.1)
            break
        else
            Q1 = calculate(Q1,nextQ1,-1,0);
            [Q1Table Q1] = updateQTable(Q1Table,Q1);
            [Q1Table Q1] = updateQTable(Q1Table,nextQ1);
        end
        
        plotQ(Q2);
        %pause(0.1)
        plotQ(Q1);
        %pause(0.1)
        %waitforbuttonpress
         
    end
   iGames;
   
end
Q1Table;
Q2Table;
