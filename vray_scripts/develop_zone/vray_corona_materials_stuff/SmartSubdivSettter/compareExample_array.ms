
format "---start--\n"
format "--------\n"
--Vmin <= val < Vmax
arr=#()
for i=1 to 10 do (append arr (i*(random 0.1 10)))
format "%\n" arr

testA = for j in arr where (10.0<=j and j<30.0) collect j

print testA

sortedAr = deepcopy arr
sort sortedAr
print sortedAr


format "-------\n"
format "---end---\n"
format "\n"
