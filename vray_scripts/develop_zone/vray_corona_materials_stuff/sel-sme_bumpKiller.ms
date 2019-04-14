
/*
SME VERSION
*/

function Kill_Maps_FN opacity_checkboxARG opacityClip_checkboxARG bumpMap_checkboxARG = 

(
	-- Function Kill_Maps_FN body
	thisView = sme.getView 1


	smeSelected = thisView.GetSelectedNodes()  -- array of selected nodes
	smeSelected[1].reference.texmapOpacity
	--showproperties smeSelected[1].reference

	mateerials= for i in smeSelected collect i.reference

	for x in mateerials do 
	(
		x.texmapOnBump = bumpMap_checkboxARG--False	
		x.texmapOnOpacity = opacity_checkboxARG--False	
		x.opacityCutout = opacityClip_checkboxARG--True
		
		--x.colorOpacity = White
		--x.levelOpacity = 0.5 --1.0
	)
)



try destroyDialog KillerInterface catch()

rollout KillerInterface "SME_Controls" width:105 height:135
(
	button 'GO_BUTTON' "GO!!!" 				pos:[(105/2)-(85/2),100]		width:85 height:25 align:#center
	checkbox 'chk_opa' "" 	checked:False	pos:[80,15] 		--width:30  height:30 align:#left
	checkbox 'chk_clip' "" 	checked:True	pos:[80,15+30]		--width:30  height:30 align:#left
	checkbox 'chk_bump' "" 	checked:False	pos:[80,15+30+30]		--width:30  height:30 align:#left
	label 'lbl2' "OpacityMap" 					pos:[12,15]		--width:96  height:21 align:#left
	label 'lbl3' "Clip" 						pos:[12,15+30]		--width:34  height:19 align:#left
	label 'lbl4' "BumpMap" 						pos:[12,15+30+30] --	width:62  height:20 align:#left





	on GO_BUTTON pressed do
	(
		Kill_Maps_FN chk_opa.checked chk_clip.checked chk_bump.checked

	)
)


-- try destroyDialog KillerInterface catch()
CreateDialog(KillerInterface) -- 























/*
SME VERSION
*/

function Kill_Maps_FN opacity_checkboxARG opacityClip_checkboxARG bumpMap_checkboxARG = 

(
	-- Function Kill_Maps_FN body
	thisView = sme.getView 1


	smeSelected = thisView.GetSelectedNodes()  -- array of selected nodes
	smeSelected[1].reference.texmapOpacity
	--showproperties smeSelected[1].reference

	mateerials= for i in smeSelected collect i.reference

	for x in mateerials do 
	(
		x.texmapOnBump = bumpMap_checkboxARG--False	
		x.texmapOnOpacity = opacity_checkboxARG--False	
		x.opacityCutout = opacityClip_checkboxARG--True
		
		--x.colorOpacity = White
		--x.levelOpacity = 0.5 --1.0
	)
)



try destroyDialog KillerInterface catch()

rollout KillerInterface "SME_Controls" width:160 height:190
(
	button 'GO_BUTTON' "GO!!!" 					pos:[16,128]	width:122 height:51 align:#left
	checkbox 'chk_opa' "" 	checked:False	pos:[125,26] 		width:30  height:30 align:#left
	checkbox 'chk_clip' "" 	checked:True	pos:[125,51]		width:30  height:30 align:#left
	checkbox 'chk_bump' "" 	checked:False	pos:[125,81]		width:30  height:30 align:#left
	label 'lbl2' "OpacityMap" 					pos:[11,31]		width:96  height:21 align:#left
	label 'lbl3' "Clip" 						pos:[38,55]		width:34  height:19 align:#left
	label 'lbl4' "BumpMap" 						pos:[24,86] 	width:62  height:20 align:#left





	on GO_BUTTON pressed do
	(
		Kill_Maps_FN chk_opa.checked chk_clip.checked chk_bump.checked

	)
)


-- try destroyDialog KillerInterface catch()
CreateDialog(KillerInterface) -- 







































/*
SME VERSION
*/




function Kill_Maps_FN opacity_checkbox opacityClip_checkbox bumpMap_checkbox = 

(
	-- Function Kill_Maps_FN body
	thisView = sme.getView 1


	smeSelected = thisView.GetSelectedNodes()  -- array of selected nodes
	smeSelected[1].reference.texmapOpacity
	--showproperties smeSelected[1].reference

	mateerials= for i in smeSelected collect i.reference

	for x in mateerials do 
	(
		x.texmapOnBump = bumpMap_checkbox--False	
		x.texmapOnOpacity = opacity_checkbox--False	
		x.opacityCutout = opacityClip_checkbox--True
		
		--x.colorOpacity = White
		--x.levelOpacity = 0.5 --1.0
	)
)



try destroyDialog KillerInterface catch()

rollout KillerInterface "SME_Controls" width:160 height:190
(
	button 'GO_BUTTON' "GO!!!" 		pos:[16,128]			 width:122 height:51 align:#left
	checkbox 'chk3' "" 						pos:[125,26] 		 	width:30 height:30 align:#left
	checkbox 'chk4' "" 						pos:[125,51]			 width:30 height:30 align:#left
	checkbox 'chk5' "" 						pos:[125,81] 			width:30 height:30 align:#left
	label 'lbl2' "OpacityMap" 				pos:[11,31] 			width:96 height:21 align:#left
	label 'lbl3' "Clip" 							pos:[38,55]				 width:34 height:19 align:#left
	label 'lbl4' "BumpMap" 					pos:[24,86] 			width:62 height:20 align:#left





	on GO_BUTTON pressed do
	(
		Kill_Maps_FN(True True True)

	)
)





-- try destroyDialog KillerInterface catch()
CreateDialog(KillerInterface) -- 









thisView = sme.getView 1


smeSelected = thisView.GetSelectedNodes()  -- array of selected nodes
smeSelected[1].reference.texmapOpacity
--showproperties smeSelected[1].reference

mateerials= for i in smeSelected collect i.reference

for x in mateerials do 
(
	x.texmapOnBump = bumpMap_checkbox--False	
	x.texmapOnOpacity = opacity_checkbox--False	
	x.opacityCutout = opacityClip_checkbox--True
	
	--x.colorOpacity = White
	--x.levelOpacity = 0.5 --1.0
)




/*
SME VERSION
*/


thisView = sme.getView 1

--<IObject:IFP_NodeViewImp>
smeSelected = thisView.GetSelectedNodes()  -- array of selected nodes
--#(<MixinInterface:Node>, <MixinInterface:Node>, <MixinInterface:Node>, <MixinInterface:Node>)
showproperties smeSelected[1].reference

--maaaats = for i in smeSelected collect trackViewNodes[#sme][thisView][i].reference
mateerials= for i in smeSelected collect i.reference
--mateerials[1].texmapOnBump = False

for x in mateerials do 
(
	x.texmapOnBump = True--False	
	x.opacityCutout = False--True
	x.colorOpacity = White
	x.levelOpacity = 0.5 --1.0
	x.texmapOnOpacity = True--False	
	
)



/*
SELECTED OBJECTS version
*/

-- get material of selected objects
--get map slot \ checker
-- get opacity checker


objs = selection as Array

mats = for i in objs where (classof i.material == CoronaMtl ) collect i.material

for x in mats do 
(
	x.texmapOnBump = True--False	
	x.opacityCutout = -False--True
	x.colorOpacity = White
	x.levelOpacity = 0.5--1.0
	x.texmapOnOpacity = True--False	
	
)



----------------------------------------------------------
----------------------find materials with opacity map-----
--------------make unique array with this materials-------
objs = objects as array
materials = for obj in objs where obj.material != undefined collect obj
opaMaterialsTEMP = for i in materials where i.material.texmapOpacity != undefined collect i.material
opaMaterials = makeUniqueArray opaMaterialsTEMP

/*
function FindMapedMats mapType = (
	-- Function FindMapedMats body
	objs = objects as array
	materials = for obj in objs where obj.material != undefined collect obj
	opaMaterialsTEMP = for i in materials where i.material.texmapOpacity != undefined collect i.material
	opaMaterials = makeUniqueArray opaMaterialsTEMP
)
*/
----------------------------------------------------------
----------------------------------------------------------


-- get material of selected objects
--get map slot \ checker
-- get opacity checker










objs = selection as Array

mats = for i in objs where ( classof i == CoronaMaterial ) collect i

for x in mats do 
	

---


thisView = sme.getView 1

sme.GetSelectedNodes()

<Interface by value array>GetSelectedNodes()




-----



thisView = sme.getView 1

--<IObject:IFP_NodeViewImp>
smeSelected = thisView.GetSelectedNodes()  -- array of selected nodes
--#(<MixinInterface:Node>, <MixinInterface:Node>, <MixinInterface:Node>, <MixinInterface:Node>)
showproperties smeSelected[1]

--maaaats = for i in smeSelected collect trackViewNodes[#sme][thisView][i].reference
mateerials=#()
for i in smeSelected do 
(
	append mateerials trackViewNodes[#sme][thisView][i].reference

)



-----
v = sme.activeView -- id of current view
ref = trackViewNodes[#sme][v][n].reference  -- probably material object
----

sme.Open()
testname = "MXS Selection Test"
existing  = sme.GetViewByName testname
if existing > 0 then (
 sme.DeleteView existing false
)
sme.activeView  =  (sme.CreateView testname)
v = sme.activeView
view = sme.GetView v
pos = [0,0]
numsubs = 10
MultiMat = MultiMaterial name:"multimaterial" numsubs:numsubs
view.CreateNode MultiMat pos
 for m = 1 to numsubs do (
  mat = multiMat.materialList[m]
  mat.diffuseMap = checker name: ("tex"+m as string)
  mat.name = ("Mat "+ (m as string))
  multiMat.names[m] = ("Mat "+ (m as string))
)
view.SetSelectedNodes (#((multiMat.materialList[random 1 numsubs])))



numNodes = view.GetNumNodes()


for n = 1 to numNodes do 

(
 nd = view.GetNode n
 if nd.selected == true then (
  ref = trackViewNodes[#sme][v][n].reference
  format "% > % > % \n" n nd ref
)


)