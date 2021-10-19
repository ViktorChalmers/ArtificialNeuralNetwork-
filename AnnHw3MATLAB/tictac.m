input =  [
    0 0 0;
    0 0 0;
    0 0 0
    ]

Actions = []

gamma = 1;
alpha = 1;
epsilon = 1;

Q1 = zeros(6,3)
Q2 = zeros(6,3)


Q2 = playerMove(Q1)
Q2 = playerMove(Q2)