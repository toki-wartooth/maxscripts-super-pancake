---задача

	--- на выбранных обьектах изменить параметры материала

	---список искомых параметров
		--- vray
			--- cutoff  .option_cutOff : float
			--- trace reflect    .option_traceReflection : boolean
			--- trace refract   .option_traceRefraction : boolean
			--- use irmap   .option_useIrradMap : boolean
			--- opacity mode clip    .option_opacityMode : integer
			--- reflect color
			--- reflect Depth   .reflection_maxDepth : integer
			---                 .refraction_maxDepth : integer
			--- refract color
			--- opacity map        .texmap_opacity_on : boolean
			--- gi self illum checkbox     .selfIllumination_gi : boolean
			--- 

	/*
		getClassInstances
		classOf
		showProperties  $.material
	*/

	/*
		for m in getclassinstances CoronaMtl do ( 
				if (m.levelDiffuse>0.8) do 
			(
				m.levelDiffuse = 0.8
				
			)
			
		)
	*/





MatDepth = 5  -- trace depth
Cutt = 0.003 -- porog
Opac = 1    -- [0Normal  1Clip 2Stochastic]

--------------------------------------------------------------
-- on all objects method -- brutal!!!


for i in getclassinstances VRayMtl do 
	( 
		i.option_cutOff = Cutt
		--i.option_traceReflection = false
		--i.option_traceRefraction = false
		--i.option_useIrradMap = true
		i.option_opacityMode = Opac
		i.reflection_maxDepth = MatDepth
		--i.refraction_maxDepth = MatDepth
		--i.texmap_opacity_on = false
		i.selfIllumination_gi = false
		
	)


MatDepth = 3  -- trace depth
Cutt = 0.053
Opac = 1    -- [0Normal  1Clip 2Stochastic]

--------------------------------------------------------------
-- on all objects method -- brutal!!!


for i in getclassinstances VRayMtl do 
	( 
		i.option_cutOff = Cutt
		i.option_traceReflection = false
		i.option_traceRefraction = false
		i.option_useIrradMap = true
		i.option_opacityMode = Opac
		i.reflection_maxDepth = MatDepth
		i.refraction_maxDepth = MatDepth
		i.texmap_opacity_on = false
		i.selfIllumination_gi = false
		
	)

-----------------------

--method A -- over collection
/*
	material_collection = #()

	for i in $ where i.material != undefined do
	join material_collection (getClassInstances VRayMtl target:i.material)

	makeUniqueArray material_collection
	for x in material_collection do
		(
			x.option_cutOff = 0.001
			print (x)
		)
*/

------------------------------

-- method B over target:$
/*


	Cutt = 1

	for i in getclassinstances VRayMtl target:$ do 
		(	
			i.option_cutOff = Cutt		
			print (i)
		)
*/