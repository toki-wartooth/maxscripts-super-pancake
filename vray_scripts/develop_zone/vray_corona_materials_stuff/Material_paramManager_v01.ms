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


fn glossKnife maxVal objASD= 
(
	if calssOf objASD != undefined then 
	(
		for i in objASD do
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



fn vrMatCounter_FN objz=
(
	vrmats = for i in objz where classOf i.material == VrayMtl collect i
	format "amount of vray materials in selection = %\n" vrmats.count
	messageBox (vrmats.count as string) title:"vray materials in selection ="
	return vrmats
)


fn ChangeParam_FN anmt objzz=
(
	a = vrMatCounter_FN(objzz)
	for q in a do q.material.reflection_glossiness=anmt
)

fn ChangeParamSCN_FN anmt objzz=
(
	vrmatsSCN = for i in objzz where classOf i.material == VrayMtl collect i 
	for q in vrmatsSCN do q.material.reflection_glossiness=anmt
)

---===end of functions===---


try DestroyDialog test catch()

rollout test "test"
(
	spinner spinerDiff "DeiffLevelMax: " range:[0,1,0.85] type:#float
	--button b1 "all"
	button b1s "selected"
	button mtCount "count"
	button prm "change mat param"
	button prmS "SCENE change mat param"
	on b1 pressed do 
	(
		glossKnife spinerDiff.value objects
	)
	on b1s pressed do
	(
		glossKnife spinerDiff.value selection
	)
	on mtCount pressed do
	(
		vrMatCounter_FN selection
	)
	on prm pressed do
	(
		ChangeParam_FN spinerDiff.value selection
	)
	on prmS pressed do
	(
		ChangeParamSCN_FN spinerDiff.value objects
	)
)



createDialog test