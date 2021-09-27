import numpy as np
def McCullochPitts(s, weightMatrix):

    #[numberOfBits numberOfPatterns] = s.shape[0];
    numberOfBits = s.shape[0]

    b = np.zeros(numberOfBits)
    for i in range(len(s)):
        for j in range(len(s)):
            b[i] = b[i] + weightMatrix[i, j] * s[j];

    return b;

def CalculateHiddenLayer(x1,x2,theta,weight):
    #for i in range(len(x1)):
    weight = np.array([x1, x2])
    print(weight.shape)
    McCullochPitts(np.array([1,1,1]), np.array([[1,1,1],[1,1,1]]))
    s = weight.shape
    print(s[0])
    print(weight.shape)

    #for i  in range(3):
    #V = -theta + (weight[0,i]*x1[i]+weight[1,i]*x2[i])
    #print(i)
    #print(x1[i])
    #print(tanh(V))


    return 1
