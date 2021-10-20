function [QTable Q] = updateQTable(QTable,Q)
[row col] = size(QTable);

nStates = col/(row/2);

for i = 1:nStates
   if(QTable(1:3,1+3*(i-1):3+3*(i-1)) == Q(1:3,1:3))
       if(QTable(1:6,1+3*(i-1):3+3*(i-1)) ~=Q)
           "updated"
       end
       
       QTable(1:6,1+3*(i-1):3+3*(i-1))=Q;
       QTable(1:6,1+3*(i-1):3+3*(i-1));
       break
   end
   if i == nStates
       QTable = [QTable Q];
   end
end

end

