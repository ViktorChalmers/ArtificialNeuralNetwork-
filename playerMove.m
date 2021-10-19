function Q2Table = playerMove(QTable,epsilon)

r = rand
if r>epsilon
    nextMove = checkActions(QTable)
else
    nextMove = randomAction(QTable)
end
Q2Table = updateQTable(Q2Table,nextMove)

end

