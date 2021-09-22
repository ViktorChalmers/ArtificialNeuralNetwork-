import numpy as np

def CalculateHiddenLayer(x1,x2,theta,weight):
    #for i in range(len(x1)):
    weight = np.array([x1, x2])
    for i  in range(3):
        V = -theta + (weight[0,i]*x1[i]+weight[1,i]*x2[i])
        #print(i)
        #print(x1[i])
        print(tanh(V))


    return 1
