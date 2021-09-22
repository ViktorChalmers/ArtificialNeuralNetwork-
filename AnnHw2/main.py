import numpy as np
import Standardization
from Standardization import *
from CalculateHiddenLayer import *
import statistics

TRAINING_SET = np.genfromtxt('training_set.csv', delimiter=',')
VALIDATION_SET = np.genfromtxt('validation_set.csv', delimiter=',')



x1 = TRAINING_SET[:,0]
x2 = TRAINING_SET[:,1]
target = TRAINING_SET[:,2]





x1 = Standardization(x1)
x2 = Standardization(x2)
print('str: x1 = ' + str(np.std(x1)) + ', x2 = ' + str(np.std(x2)) +
      ' mean: x1 = ' + str(np.mean(x1)) + ', x2 = ' + str(np.mean(x2)))
w = np.array([x1,x2])
print(w.shape)
print(CalculateHiddenLayer(x1,x2,x1,1))