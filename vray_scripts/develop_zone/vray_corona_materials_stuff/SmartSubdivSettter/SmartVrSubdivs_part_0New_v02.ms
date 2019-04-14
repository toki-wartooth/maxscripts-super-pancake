

---
----------------------

--get reflected materials
function Reflected_vrMtls_FN vraymtls=
(
	arrayMtls = for i in vraymtls where (i.reflection.r > 0.00 and i.reflection.g > 0.00 and i.reflection.b > 0.00) or i.texmap_reflection != undefined collect i
)


-- create array of stoppers
function clalcVals min diff amnt:10 = 
(
	q = for i=amnt to 1 by -1 collect min+diff*(i-1)

)


amount = 5 -- not used 
minSmpl = 8 -- minimum samples 
difference = 10 -- increment per setp 
stoppers = clalcVals minSmpl difference

--get inbetween stuff like double compare  a< x <b
function inBetween val =
(
	arr = #(.0, .1, .2, .3, .4, .5, .6, .7, .8, .9, 1.)
	y=null
	idx = findItem arr val

	y = case idx of
	(
		0: (for i = 1 to 11 where (findItem arr (amin arr[i] val)) == 0 do exit with (i-1))
		11: 10
		default: idx
	)
)	


-- mighty subdiv setter
function setVrayMatSubdivs mtl prop: glossValsArr: =
(
	ActualGlossy = getProperty mtl prop
	subProp = case prop of
		(
			(#reflection_glossiness): #reflection_subdivs
			(#refraction_glossiness): #refraction_subdivs
			(#base_glossiness): #subdivs
			(#specular_glossiness): #specular_subdivs
			(#flake_glossiness): #subdivs
		)
	setProperty mtl subProp glossValsArr[(inBetween ActualGlossy)]
)	




fn ProcessMaterial m spinVals:stoppers=
(
	--spinVals -- get stopper array
	if isKindOf m VRayMtl then 
	(
		setVrayMatSubdivs m prop:#reflection_glossiness glossValsArr:spinVals
		setVrayMatSubdivs m prop:#refraction_glossiness glossValsArr:spinVals
		--print "reflection_glossiness done"
	)
	else if isKindOf m VRay2SidedMtl then (ProcessMaterial m.frontmtl ; ProcessMaterial m.backmtl; /*print"2side Done"*/)
	else if isKindOf m Shellac then (ProcessMaterial m.shellacMtl1 ; ProcessMaterial m.shellacMtl2)
	else if isKindOf m VrayMtlWrapper then (ProcessMaterial  m.baseMtl)
	else if isKindOf m VRayBlendMtl then (ProcessMaterial m.baseMtl ; for i = 1 to 9 do ProcessMaterial m.coatMtl[i])
	else if isKindOf m VrayOverrideMtl then (for i in 1 to getNumSubMtls m do ProcessMaterial (getSubMtl m i))
	else if isKindOf m VrayCarPaintMtl then (setVrayMatSubdivs m prop:#base_glossiness glossValsArr:spinVals)
	else if isKindOf m VrayFastSSS2 then (setVrayMatSubdivs m prop:#specular_glossiness glossValsArr:spinVals)
	else if isKindOf m VrayFlakesMtl then (setVrayMatSubdivs m prop:#flake_glossiness glossValsArr:spinVals)
	else if (isKindOf m Multimaterial or isKindOf m CompositeMaterial) then (for sm in m.materialList where isKindOf sm material do ProcessMaterial sm)
	else if isKindOf m Blend then (ProcessMaterial m.MAP1 ; ProcessMaterial m.MAP2)
	else if isKindOf m TopBottom then (ProcessMaterial m.topmaterial ; ProcessMaterial m.bottomMaterial)
	else if isKindOf m Shell_Material then (ProcessMaterial m.originalMaterial ; ProcessMaterial m.bakedMaterial)
)
--------------------------


-- stoppers= clalcVals minSmpl difference
-- setVrayMatSubdivs $.material

/*
--vraymtls = getClassInstances VrayMtl  -- array with all vray Mats.
amount = 5 -- not used 
minSmpl = 8 -- minimum samples 
difference = 10 -- increment per setp 
*/

for zm in scenematerials do ProcessMaterial zm




/*
-- get mtls with reflect 
reflecters = Reflected_vrMtls_FN vraymtls
stoppers= clalcVals minSmpl difference
for x in reflecters do setVrayMatSubdivs x
-- 
*/




/*

	compare_operand   >= <compare_operand> -- greater than or equal
	<compare_operand> <=
*/


/*
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
*/


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


