f = open('data.csv', 'r')
datadict = {}
header=[]
for idx,row in enumerate(f):
    if idx==0:
        header=row.strip().split(',')
        # add keys in dictionary
        for h in header:
            datadict[h]=[]
    else:
        data=row.strip().split(',')
        for idx,h in enumerate(header):
            #handle blank values
            if not data[idx]:
                datadict[h].append('N/A')
            else:
                datadict[h].append(data[idx])

f.close()
print(datadict)
