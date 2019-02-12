--unloads corona proxy from ram and sets display to shaded box

cpr = for i in geometry where(classof i == Cproxy) collect i
badprx = for y in cpr where( y.cacheInRam==true) collect y
if badprx.count > 0 do 
(
	--selectionsets["unloaded_proxy"]=badprx
	
	for t in badprx do 
	(
		t.previzType=0
		t.cacheInRam = false
	)
)