def decipher(babyExp):
    # replacing each baby word with corresponding character and passing on
    srcCode = ""
    srcCode = babyExp.replace("pee", "+")
    srcCode = srcCode.replace("gah", "-")
    srcCode = srcCode.replace("milk", "*")
    srcCode = srcCode.replace("heh", "/")
    srcCode = srcCode.replace("mama", "(")
    srcCode = srcCode.replace("dada", ")")
    srcCode = srcCode.replace("baaaaaaaaa", "9")
    srcCode = srcCode.replace("baaaaaaaa", "8")
    srcCode = srcCode.replace("baaaaaaa", "7")
    srcCode = srcCode.replace("baaaaaa", "6")
    srcCode = srcCode.replace("baaaaa", "5")
    srcCode = srcCode.replace("baaaa", "4")
    srcCode = srcCode.replace("baaa", "3")
    srcCode = srcCode.replace("baa", "2")
    srcCode = srcCode.replace("ba", "1")
    srcCode = srcCode.replace("b", "0")
    # finally replacing all the whitespaces with empty string 
    srcCode = srcCode.replace(" ", "")
    return srcCode
