import numpy as np
import pandas as pd
 
def myfv(rate, nper, pmt):
    return np.fv(rate, nper, -pmt, -pmt)
 
dx05=[myfv(0.05, x, 1)  for x in range(0,50) ]
dx08=[myfv(0.08, x, 1)  for x in range(0,50)]
dx10=[myfv(0.10, x, 1) for x in range(0,50)]
df=pd.DataFrame(columns=['dx05', 'dx08', 'dx10'])
df['dx05']=dx05[:]
df['dx08']=dx08
df['dx10']=dx10
print(df.tail(1))
df.plot()