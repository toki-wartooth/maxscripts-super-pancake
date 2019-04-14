/*//////////   SCRIPT:   VRayMat Resampler v.1.2   //////////*/
/*//////////   WRITTEN BY:   Branko Zivkovic   //////////*/
/*//////////   EMAIL:   barigazy@hotmail.com   //////////*/
try(destroydialog ::RollSVS)catch()
rollout RollSVS "VRayMat Resampler"
(	
	fn clalcVals min dif = (for i = 10 to 1 by -1 collect min+dif*(i-1))
	local minSmpl = 16, difference = 8, defVals = clalcVals minSmpl difference
	fn inBetween val =
	(
		local arr = #(.0, .1, .2, .3, .4, .5, .6, .7, .8, .9, 1.), y=null, idx = findItem arr val
		y = case idx of
		(
			0: (for i = 1 to 11 where (findItem arr (amin arr[i] val)) == 0 do exit with (i-1))
			11: 10
			default: idx
		)
	)	
	fn setVrayMatSubdivs mtl prop: glossValsArr: =
	(
		local ActualGlossy = getProperty mtl prop
		local subProp = case prop of
		(
			(#reflection_glossiness): #reflection_subdivs
			(#refraction_glossiness): #refraction_subdivs
			(#base_glossiness): #subdivs
			(#specular_glossiness): #specular_subdivs
			(#flake_glossiness): #subdivs
		)
		setProperty mtl subProp glossValsArr[(inBetween ActualGlossy)]
	)	
	group "Material Sample Amounts:" 
	(
		label lbl1 " VRay Glossiness Ranges:" style_sunkenedge:on width:150 height:16 pos:[10,25]
		spinner glossy_00 "[0.0 ÷ 0.1] :" range:[1,1e4,defVals[1]] type:#integer pos:[9,45] fieldwidth:78
		spinner glossy_01 "[0.1 ÷ 0.2] :" range:[1,1e4,defVals[2]] type:#integer pos:[9,65] fieldwidth:78
		spinner glossy_02 "[0.2 ÷ 0.3] :" range:[1,1e4,defVals[3]] type:#integer pos:[9,85] fieldwidth:78
		spinner glossy_03 "[0.3 ÷ 0.4] :" range:[1,1e4,defVals[4]] type:#integer pos:[9,105] fieldwidth:78
		spinner glossy_04 "[0.4 ÷ 0.5] :" range:[1,1e4,defVals[5]] type:#integer pos:[9,125] fieldwidth:78
		spinner glossy_05 "[0.5 ÷ 0.6] :" range:[1,1e4,defVals[6]] type:#integer pos:[9,145] fieldwidth:78
		spinner glossy_06 "[0.6 ÷ 0.7] :" range:[1,1e4,defVals[7]] type:#integer pos:[9,165] fieldwidth:78
		spinner glossy_07 "[0.7 ÷ 0.8] :" range:[1,1e4,defVals[8]] type:#integer pos:[9,185] fieldwidth:78
		spinner glossy_08 "[0.8 ÷ 0.9] :" range:[1,1e4,defVals[9]] type:#integer pos:[9,205] fieldwidth:78
		spinner glossy_09 "[0.9 ÷ 1.0] :" range:[1,1e4,defVals[10]] type:#integer pos:[9,225] fieldwidth:78
		button MultiplySamples "Multiply By" width:60 height:18 pos:[10,243]
		spinner multiVal "" range:[0,1e3,2] type:#float pos:[70,245] fieldwidth:78
		label lbl2 " Setup Sample Amounts:" style_sunkenedge:on width:150 height:16 pos:[10,265]
		spinner min_Smpl "Start With :  " range:[1,1e3,minSmpl] type:#integer pos:[9,285] fieldwidth:78
		spinner dif_Smpl "Difference :  " range:[1,1e3,difference] type:#integer pos:[9,305] fieldwidth:77
		button resetSpinns "Reset Counters" width:152 height:18 pos:[9,325]
	)
	group "Material Properties:" 
	(	
		checkbox cb_refl "Reflection_G. [VRayMtl]" pos:[8,370] checked:on
		checkbox cb_refr "Refraction_G. [VRayMtl]" pos:[8,385] checked:on
		checkbox cb_base "Base_G. [VrayCarPaintMtl]" pos:[8,400] checked:on
		checkbox cb_spec "Specular_G. [VrayFastSSS2]"pos:[8,415] checked:on
		checkbox cb_flake "Flake_G. [VrayFlakesMtl]" pos:[8,430] checked:on
	)
	group "Resample Only:" 
	(	
		radiobuttons optType labels:#("Scene Mtl's", "Selections Mtl's", "MEdit Mtl's") columns:1 pos:[10,470]
		button SetVraySamples "S E T" width:45 height:45 pos:[115,470]
	)
	fn ProcessMaterial m =
	(
		local spinVals = for v in 3 to 12 collect RollSVS.controls[v].value
		if isKindOf m VRayMtl then 
		(
			if cb_refl.checked do setVrayMatSubdivs m prop:#reflection_glossiness glossValsArr:spinVals
			if cb_refr.checked do setVrayMatSubdivs m prop:#refraction_glossiness glossValsArr:spinVals
		)
		else if isKindOf m VRay2SidedMtl then (ProcessMaterial m.frontmtl ; ProcessMaterial m.backmtl)
		else if isKindOf m Shellac then (ProcessMaterial m.shellacMtl1 ; ProcessMaterial m.shellacMtl2)
		else if isKindOf m VrayMtlWrapper then (ProcessMaterial  m.baseMtl)
		else if isKindOf m VRayBlendMtl then (ProcessMaterial m.baseMtl ; for i = 1 to 9 do ProcessMaterial m.coatMtl[i])
		else if isKindOf m VrayOverrideMtl then (for i in 1 to getNumSubMtls m do ProcessMaterial (getSubMtl m i))
		else if cb_base.checked and isKindOf m VrayCarPaintMtl then (setVrayMatSubdivs m prop:#base_glossiness glossValsArr:spinVals)
		else if cb_spec.checked and isKindOf m VrayFastSSS2 then (setVrayMatSubdivs m prop:#specular_glossiness glossValsArr:spinVals)
		else if cb_flake.checked and isKindOf m VrayFlakesMtl then (setVrayMatSubdivs m prop:#flake_glossiness glossValsArr:spinVals)
		else if (isKindOf m Multimaterial or isKindOf m CompositeMaterial) then (for sm in m.materialList where isKindOf sm material do ProcessMaterial sm)
		else if isKindOf m Blend then (ProcessMaterial m.MAP1 ; ProcessMaterial m.MAP2)
		else if isKindOf m TopBottom then (ProcessMaterial m.topmaterial ; ProcessMaterial m.bottomMaterial)
		else if isKindOf m Shell_Material then (ProcessMaterial m.originalMaterial ; ProcessMaterial m.bakedMaterial)
	)
	on resetSpinns pressed do 
	(
		defVals = clalcVals min_Smpl.value dif_Smpl.value
		for v in 3 to 12 do RollSVS.controls[v].value = defVals[v-2]
	)
	on MultiplySamples pressed do
	(
		local spinVals = for v in 3 to 12 collect (RollSVS.controls[v].value * multiVal.value) as integer
		if amin spinVals > 0 and amax spinVals < 1e4 do for v in 3 to 12 do RollSVS.controls[v].value = spinVals[v-2]
	)
	on SetVraySamples pressed do
	(
		with undo off with redraw off
		(
			case optType.state of 
			(
				1: for m in scenematerials do ProcessMaterial m
				2: for o = 1 to selection.count where selection[o].material != null do ProcessMaterial selection[o].material
				3: for n in meditMaterials do ProcessMaterial n
			)
		)
	)
)
createDialog RollSVS 170 525 style:#(#style_titlebar, #style_sysmenu, #style_toolwindow)
