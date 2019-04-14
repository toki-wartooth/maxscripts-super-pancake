

---


vraymtls = getClassInstances VrayMtl  -- array with all vray Mats.


----------------------

--get reflected materials
function Reflected_vrMtls_FN =
(
	arrayMtls = for i in vraymtls where (i.reflection.r > 0.00 and i.reflection.g > 0.00 and i.reflection.b > 0.00) or i.texmap_reflection != undefined collect i
)

/*

compare_operand   >= <compare_operand> -- greater than or equal
<compare_operand> <=
*/

--create array for input gloss values 
function GlossGet mtlArr glossVal glossValMax=
(
	TempArray = for i in mtlArr where ((i.reflection_glossiness >= glossVal) and (i.reflection_glossiness <= glossValMax)) collect i
)




refMtls=Reflected_vrMtls_FN()
format "all mtlList\n"
	for q in refMtls do format "%\n" q
format "all mtlList end\n"
format "---------------\n"



lowGloss= GlossGet refMtls 0.9 1.0
for LG in lowGloss do deleteItem refMtls (findItem refMtls LG)
format "---------------\n"
format "lowGloss"
format "%\n" lowGloss
format "---------------\n"

format "all mtlList AFTERLOW\n"
	for q in refMtls do format "%\n" q
format "all mtlList end\n"
format "---------------\n"

midGloss= GlossGet refMtls 0.5 0.9
for MG in midGloss do deleteItem refMtls (findItem refMtls MG)
format "---------------\n"
format "midGloss"
format "%\n" midGloss
format "---------------\n"


format "all mtlList AFTERMID\n"
	for q in refMtls do format "%\n" q
format "all mtlList end\n"
format "---------------\n"

highGloss= GlossGet refMtls 0.3 0.5
for HG in highGloss do deleteItem refMtls (findItem refMtls HG)

format "---------------\n"
format "highGloss"
format "%\n" highGloss
format "---------------\n"

format "all mtlList AFTERHIGH\n"
	for q in refMtls do format "%\n" q
format "all mtlList end\n"
format "---------------\n"



uberGloss= GlossGet refMtls 0.00 0.30
for UG in uberGloss do deleteItem refMtls (findItem refMtls UG)

format "---------------\n"
format "uberGloss"
format "%\n" uberhGloss
format "---------------\n"

format "all mtlList AFTERHIGH\n"
	for q in refMtls do format "%\n" q
format "all mtlList end\n"
format "---------------\n"





-------


/*
tempArr = #(lowGloss, midGloss, highGloss) -- array with sorted mtls


--format "\n\nglossy matlist = %\n" tempArr
for i in tempArr do 
(
	format "filled categorys = %\n" i.count

	format "category contains: %\n" i
	for j in i do 
	(
		--format "%\n" j.count
		format "%\n" j

	)

)
*/

/*
listOfValues=#(0.3, 0.5, 0.9)

for i in listOfValues do 
(
	sortedArray=#(GlossGet refMtls i)

)
*/





/*
format "\n list of values\n"
format "\n %\n" listOfValues
format "\n\n materials\n"
format "\n %\n" sortedArray
*/