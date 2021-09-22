import numpy as np

def Standardization(x):
    shift = np.mean(x)
    x2 = x-shift
    x2 = x2/np.std(x2)
    return x2