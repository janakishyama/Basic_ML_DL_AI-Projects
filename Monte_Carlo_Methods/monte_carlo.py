############## Monte carlo using random sampling ######################

# Estimating the value of PI ............................

import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
import scipy.integrate as integrate

fontsize = 16

def PI_Approx(N):
    np.random.seed(seed=42)
    inside = 0
    PI_approx = []
    rand = []
    rand2 = []
    for i in range(1,N):
        r = np.random.uniform(low=-1,high=1)
        rand.append(r)
        r2 = np.random.uniform(low =-1,high=1)
        rand2.append(r2)

        if (r*r + r2*r2 <1):
            inside = inside +1
            
        
        PI_approx.append(4*inside/i)

        if i == 100 or i == 1000 or i == 10000:
            circle1 = plt.Circle((0,0), 1, color = 'black', fill = False, linewidth = 2, alpha = 0.5)
            fig, ax = plt.subplots(figsize = (7,7))
            color = np.array(rand)*np.array(rand) + np.array(rand2)*np.array(rand2) < 1
            plt.scatter(rand, rand2, c = color, cmap = 'bwr', alpha = 0.5)
            ax.add_patch(circle1)
            plt.title(r'$ N = %s, n = %s \rightarrow \pi \approx \frac{4n}{N} \approx %.2f$' %(i, inside, 4*inside/i), fontsize = fontsize)
            plt.xlim(-1,1)
            plt.ylim(-1,1)
            plt.xlabel('x', fontsize = fontsize)
            plt.ylabel('y', fontsize = fontsize)
            plt.savefig('MC_circle_N-%s.jpg' %i, bbox_inches ='tight', dpi = 300)

    
    PI_approx = pd.DataFrame(PI_approx, columns = ['Estimated PI'])
    PI_approx['real PI'] = np.pi
    PI_approx['Error'] = np.pi - PI_approx['Estimated PI']


    #print(inside)
    #print(PI_approx)
    return PI_approx

    

df_PI = PI_Approx(10000)
print(df_PI)


