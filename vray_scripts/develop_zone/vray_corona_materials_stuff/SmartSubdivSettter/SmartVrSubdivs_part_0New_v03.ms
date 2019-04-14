


-- create array of stoppers
function clalcVals min diff amnt:10 = 
(
	for i=amnt to 1 by -1 collect min+diff*(i-1)

)


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
function setVrayMatSubdivs mtl prop: glossValsArr:stoppers =
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




function ProcessMaterial m =
(
	stoppers = clalcVals minSmpl difference

	if isKindOf m VRayMtl then 
	(
		setVrayMatSubdivs m prop:#reflection_glossiness glossValsArr:spinVals
		setVrayMatSubdivs m prop:#refraction_glossiness glossValsArr:spinVals
		--print "reflection_glossiness done"
	)
	else if isKindOf m VRay2SidedMtl then
	(
		ProcessMaterial m.frontmtl
		ProcessMaterial m.backmtl
		--print"2side Done"
	)
	else if isKindOf m Shellac then 
	(
		ProcessMaterial m.shellacMtl1
		ProcessMaterial m.shellacMtl2
	)
	else if isKindOf m VrayMtlWrapper then
	(
		ProcessMaterial  m.baseMtl

	)
	else if isKindOf m VRayBlendMtl then 
	(
		ProcessMaterial m.baseMtl
		for i = 1 to 9 do ProcessMaterial m.coatMtl[i]

	)
	else if isKindOf m VrayOverrideMtl then
	(
		for i in 1 to getNumSubMtls m do
		(
			ProcessMaterial (getSubMtl m i)

		)

	)
	else if isKindOf m VrayCarPaintMtl then 
	(
		setVrayMatSubdivs m prop:#base_glossiness glossValsArr:spinVals

	)
	else if isKindOf m VrayFastSSS2 then
	(
		setVrayMatSubdivs m prop:#specular_glossiness glossValsArr:spinVals

	)
	else if isKindOf m VrayFlakesMtl then
	(
		setVrayMatSubdivs m prop:#flake_glossiness glossValsArr:spinVals

	)
	else if (isKindOf m Multimaterial or isKindOf m CompositeMaterial) then
	(
		for sm in m.materialList where isKindOf sm material do 
		(
			ProcessMaterial sm
		)

	)
	else if isKindOf m Blend then
	(
		ProcessMaterial m.MAP1
		ProcessMaterial m.MAP2
	)
	else if isKindOf m TopBottom then 
	(
		ProcessMaterial m.topmaterial
		ProcessMaterial m.bottomMaterial
	)
	else if isKindOf m Shell_Material then
	(
		ProcessMaterial m.originalMaterial
		ProcessMaterial m.bakedMaterial

	)
)
--------------------------





amount = 5 -- not used 
minSmpl = 8 -- minimum samples 
difference = 10 -- increment per setp 
stoppers = clalcVals minSmpl difference


for zm in scenematerials do ProcessMaterial zm

