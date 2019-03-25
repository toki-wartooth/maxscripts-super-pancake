
-- Link selected sme bitmap nodes with controller in u and v tiling
-- only works with selected nodes for now 

-- created by toki

fn sme_Add_TileController locked = (
   -- Function sme_Add_TileController body

	local slate = smeview.GetSelectedNodes()
	local nodes = #()



	for n in slate do
	(	

		append nodes n.reference
	)
	if locked!=False then
	(

		local controller = linear_float()


		for bm in nodes do
		(
			bm.coords.u_Tiling.controller = controller
			bm.coords.v_Tiling.controller = controller
		)
	)
	else 
	(
		qwe

		local controller_u = linear_float()
		local controller_v = linear_float()

		for bm in nodes do
		(
			bm.coords.u_Tiling.controller = controller_u
			bm.coords.v_Tiling.controller = controller_v
		)
	)
)


try(DestroyDialog uv_link)
catch()

rollout uv_link "Slate UV linking"
(
	label 'lbl' "select bitmap nodes in SME"
	button 'locked' "locked" toolTip:"make uv tileing link"
	button 'unlocked' "unlocked" toolTip:"separated u and v links"



	on locked pressed do sme_Add_TileController True
	on unlocked pressed do sme_Add_TileController False
)

CreateDialog uv_link
