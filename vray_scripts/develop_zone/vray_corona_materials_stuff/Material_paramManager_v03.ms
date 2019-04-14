--=Material parametr manager=--
--=by toki wartooth=--


-- updated 24.04.18
	-- managed to make it work on selection and on whole scene.
	-- probably slow methd because of loops and ifs
	--TODO - fix variables names
	-- make it work on uniques
	-- add Corona and vray specific parametrs
	
---===---





--try DestroyDialog test catch()


fn ParamSetter_FN maxVal objSel= 
(
	if classOf objSel != undefined then 
	(
		for i in objSel do
		( 
			if (i.material.reflection_glossiness>0.8) do i.material.reflection_glossiness=maxVal
		)	
		print "done!"
	)
	else
	(
		messageBox "error" title:"omgwtf"
		print "bad \n"
		--return
		--break
	)
)

fn vrMatCounter_FN objSel=
(
	vrmats = for i in objSel where classOf i.material == VrayMtl collect i
	format "amount of vray materials in selection = %\n" vrmats.count
	messageBox (vrmats.count as string) title:"vray materials in selection ="
	return vrmats
)

fn ChangeParam_FN anmt objSel=
(
	a = vrMatCounter_FN(objSel)
	for q in a do q.material.reflection_glossiness=anmt
)

fn ChangeParamSCN_FN anmt objSel=
(
	vrmatsSCN = for i in objSel where classOf i.material == VrayMtl collect i 
	for q in vrmatsSCN do q.material.reflection_glossiness=anmt
)

---===end of functions===---


try DestroyDialog test catch()
--try DestroyDialog ddl_test catch()
rollout test "test"
(
	spinner spin_01 "MaximumValue: " range:[0,1,0.85] type:#float
	--button b1 "all"
	button sel "selected"
	button mtCount "count"
	button prm "change mat param"
	button prmS "SCENE change mat param"
	--checkbox <name> [<caption>] [checked:<boolean>] [triState:<integer>][tooltip:<string>] 	 
	checkbox testCheckbox "caption" checked:false tooltip:"tooltip"
	

	on sel pressed do 
	(
		ParamSetter_FN spin_01.value objects
	)
	on b1s pressed do
	(
		ParamSetter_FN spin_01.value selection
	)
	on mtCount pressed do
	(
		vrMatCounter_FN selection
	)
	on prm pressed do
	(
		ChangeParam_FN spin_01.value selection
	)
	on prmS pressed do
	(
		ChangeParamSCN_FN spin_01.value objects
	)
)




createDialog test

rollout ddl_test "Drop-Down List"
(

  --dropdownlist <name> [<caption>] [items:<array_of_strings>] [selection:<number>] [height:<number>] [tooltip:<string>] 
  dropdownlist scale_dd "Scale" items:#("1/2", "1/4", "1/8", "1/16")
  on scale_dd selected i do
    format "You selected '%'!\n" scale_dd.items[i]
)
--createDialog ddl_test


---

/*
--structure -
dropdownlist
	coronaMtl
		level diffuse
		level reflect
		level refract
		ior
			cutter (if more than 20 - make  value)
			standart 1.55
		reflect.glossynes
		refract.glossynes
		clip opacity
		self-illumination

	VRayMtl
		level dif
		level reflect
		level refract
		reflect glossy
			real mode (hGlossy locked, value transfered)
			custom mode (Hglossy = rGlossy; rglossy = 1; unlocked)
		fresnel
			unlocked
			locked ; = ior
		refract glossy
		opacity mode
		self illum mult
			gi
		
		brdf
			ggs
			blinn
			phong
			ward
		raytrace?

*/


try DestroyDialog massMatManager catch()


rollout massMatManager "fast Material Manager"
(
	dropdownlist MtlType items:#("VrayMtl","CoronaMtl")




)