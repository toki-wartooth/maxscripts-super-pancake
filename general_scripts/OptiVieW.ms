-- Macroscript OptiVieW
-- category: "SkapScript"
-- toolTip: "OptiVieW"
-- buttonText: "Optiview"
(


	--nviews = viewport.numViews
	-- <render_level>viewport.GetRenderLevel() 
	-- <void>viewport.SetRenderLevel <render_level> 
	-- <integer>viewport.GetTransparencyLevel() 
	--<void>viewport.SetTransparencyLevel <transp_level> 



	fn OptiView  = (
	   -- makes viewport more responsive
	   displayColor.shaded = #object -- turn vp textures off
	   viewport.EnableSolidBackgroundColorMode(True) -- set bg color to flat color
	   for i in objects do 
	   (
	   		i.displaybylayer = off -- set viewport display by object
	   		i.backfaceCull = off  -- no backface culling evar!

	   )
	   gc()
	   freeSceneBitmaps()
	)

	OptiView()
)

/*
	--<node>.backFaceCull Boolean default: false -- backFaceCull
	displayColor.shaded = #object -- ?????? display color -> shaded object colo 
	viewport.EnableSolidBackgroundColorMode(true) -- ?????? solid
	select $* -- ????????? ???? ????????
	$.displaybylayer = off -- ?????? ???????? byobject
	$.backFaceCull = off -- ??????? backface	
	--???? ??? ??????
	----------------------------------------------------
	gc()
	FreeSceneBitmaps()
	----------------------------------------------------
	messagebox ("Lord! Slaves completed your designation!") -- ???? ? ?????????? ??????????
*/