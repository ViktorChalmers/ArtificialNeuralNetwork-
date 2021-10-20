function nextQ = fetchQTable(QTable,nextQ)
[row col] = size(QTable);

nStates = col/(row/2);

for i = 1:nStates
   if(QTable(1:3,1+3*(i-1):3+3*(i-1)) == nextQ(1:3,1:3))
       nextQ = QTable(1:6,1+3*(i-1):3+3*(i-1));
       "found";
       break
   end
end




stage = nextQ(1:3,1:3);
stage(stage==1|stage == -1) = NaN;
nextQ(4:end,1:3) = stage;

end

