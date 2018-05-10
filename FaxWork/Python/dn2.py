string = "CVIVS IN HOC RENOVATA LOCO PIA FVLGET IMAGO SIS CVSTOS POPVLI SANCTE IACOBE TVI"
count = 0
for word in string:
    if word == "I":
        count += 1
    elif word == "V":
        count += 5
    elif word == "X":
        count += 10
    elif word == "L":
        count += 50
    elif word == "C":
        count += 100
    elif word == "D":
        count += 500
    elif word == "M":
        count += 1000

print(count)

  