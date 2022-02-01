f = open('config_metric - data.csv', 'r')
next(f)
datadict = {}
for idx,row in enumerate(f):
    data=row.strip().split(',')
    datadict[data[0]]=data[1::]

f.close()
print(datadict)
