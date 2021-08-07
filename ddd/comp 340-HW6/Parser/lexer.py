import re
import ast
regex=regex = '^[0-9]+$'
def isNumber(string):
    if(re.search(regex,string)):
        return True
    else:
        return False
def convert(e):
    r,s={"Module([":"",")])":"","Expr(":"","BinOp":"","Num":"",", Add(), ":"+",", Sub(), ":"-",", Div(), ":"/",", Mult(), ":"*"},ast.dump(ast.parse(e),annotate_fields=False)
    for f,t in r.iteritems():
        s=s.replace(f,t)
    return s

def tokens(srcCode):
    srcCode="".join(srcCode.split())
    return re.findall(r"(\b\w*[\.]?\w+\b|[\(\)\+\*\-\/])", srcCode)
    
def tokenize(srcCode):
    srcCodeArr=tokens(srcCode);
    res=[]
    i=0
    while i<len(srcCodeArr):
        if(len(res)>0):
            if (isNumber(res[len(res)-1])):
                res.append(srcCodeArr[i].replace("-", "+(0-1)*"))
            else:
                res.append(srcCodeArr[i].replace("-", "(0-1)*"))
        else:
                res.append(srcCodeArr[i].replace("-", "(0-1)*"))

        i+=1
    #res = [sub.replace("-", "(0-1)*") for sub in srcCodeArr]
    newRes=("").join(res)
    newSrcCode=convert(newRes)
    newSrcCodeArr=tokens(newSrcCode)
    result=[]
    i=0
    while i<len(newSrcCodeArr):
        if isNumber(newSrcCodeArr[i]):
            result.pop(len(result)-1);
            result.append(newSrcCodeArr[i])
            i+=2
        else:
            result.append(newSrcCodeArr[i])
            i+=1
    
    return result


        

