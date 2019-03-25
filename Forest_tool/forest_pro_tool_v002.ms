--toki forest pro tools version 003



/*

	frt = $Forest001
	--showproperties frt
	classof frt

	classof frt.geomlist
	classof frt.arsurfidlist
	classof frt.surflist
	print frt.geomlist


	"instance geometry"
	--frt.namelist
	frt.cobjlist
	"area nodes"
	frt.arnodelist 
	"surface nodes"
	frt.surflist


	print "instance customgeometry"
	frt.geomlist

	print frt.surflist  -- surface list!!!
	select frt.surflist[1]
	--
	
	.geomlist : int array
	.arsurfidlist : string array

	.namelist
	 .surflist (Surface_List) : node array
*/


fn FN_ss_from_array arr parent_n_str type_str  = (
	-- Function FN_ss_from_array body
	local clean_arr = for i in arr where (i != undefined) collect i
	local full_ss_name = "FP_" + (parent_n_str as string) + "_" + (type_str as string)
	selectionSets[full_ss_name] = clean_arr
	format "creted % with % items\n" full_ss_name (selectionSets[full_ss_name].count)
)


fn FN_forestGet type= (
   -- Function FN_forestGet body
	if type == 0 do (
		sel = selection as array	
	)
	if type == 1 do (
		sel = for f in geometry where (classof f == Forest_Pro) collect f
	)
	if sel.count < 1 then (
		if type==0 do (
			messagebox "Select something please."
		)
		if type==1 do(
			messagebox "Do you have Forest pro in current scene?"
		)
	)
	else ( 

		frst = for i in sel where(classof i == Forest_Pro) collect i
		if frst.count < 1 then (
			if type==0 do (
				messagebox "add forest to selection this time"
			)
			if type==1 do(
				messagebox "Do you have Forest pro in current scene?"
			)
		)
		else (
			for frt in frst do (
				geo_arr = for cob in frt.cobjlist where (cob!=undefined) collect cob
				sur_arr = for su in frt.surflist where (su!=undefined) collect su
				are_arr = for ar in frt.arnodelist where (ar!=undefined) collect ar
				all_array = geo_arr + are_arr + sur_arr + frt
				-- FN_ss_from_array geo_arr frt.name "geo"
				FN_ss_from_array geo_arr frt.name "geo"
				FN_ss_from_array sur_arr frt.name "sur"
				FN_ss_from_array are_arr frt.name "area"
				FN_ss_from_array all_array ("!!_"+frt.name) "all"
				--FN_ss_from_array geo_arr frt.name "geo"
			)
		)
		--main stuff
	)

)

fn FN_forestGet_part type part= (
   -- Function FN_forestGet body
	if type == 0 do (
		sel = selection as array	
	)
	if type == 1 do (
		sel = for f in geometry where (classof f == Forest_Pro) collect f
	)
	if sel.count < 1 then (
		if type==0 do (
			messagebox "Select something please."
		)
		if type==1 do(
			messagebox "Do you have Forest pro in current scene?"
		)
	)
	else ( 

		frst = for i in sel where(classof i == Forest_Pro) collect i
		if frst.count < 1 then (
			if type==0 do (
				messagebox "add forest to selection this time"
			)
			if type==1 do(
				messagebox "Do you have Forest pro in current scene?"
			)
		)
		else (
			for frt in frst do (
				geo_arr = for cob in frt.cobjlist where (cob!=undefined) collect cob
				sur_arr = for su in frt.surflist where (su!=undefined) collect su
				are_arr = for ar in frt.arnodelist where (ar!=undefined) collect ar
				all_array = geo_arr + are_arr + sur_arr + frt
				-- FN_ss_from_array geo_arr frt.name "geo"
				--if type == 
				FN_ss_from_array geo_arr frt.name "geo"
				--FN_ss_from_array sur_arr frt.name "sur"
				--FN_ss_from_array are_arr frt.name "area"
				--FN_ss_from_array all_array ("!!_"+frt.name) "all"
				--FN_ss_from_array geo_arr frt.name "geo"
			)
		)
		--main stuff
	)

)









try DestroyDialog toki_FPro_tools catch()

--rightclick
rollout toki_FPro_tools "Forest Pro Tools"
(
	--groupbox ""
	--button 'All_scene' "All FP"
	label 'lbl' "select forest --> look in selection sets"
	button 'Selected' "Selected" toolTip:"Rightclick = all sceene"
	--button 'sel_geo' "geo" across:3
	--button 'sel_sur' "surface"
	--button 'sel_are' "area"

	on All_scene pressed do (
	    -- Do something.
	    messagebox "All_scene"
	)
	
	
	on Selected pressed do (
	    -- Do something.
	    FN_forestGet 0
	    macros.run "Edit" "namedSelSets"
	    --messagebox "Selected"
	)
	on Selected rightclick do (
	    -- Do something.
	    FN_forestGet 1
	    --messagebox "Selected"
	)
	
	
	on sel_geo pressed do (
	    -- Do something.
	    -- messagebox "Selected geometry"
		FN_forestGet_geo 0
	)
	on sel_geo rightclick do (
	    -- Do something.
	    -- messagebox "Selected geometry"
		FN_forestGet_geo 1
	)
	
	
	on sel_sur pressed do (
		-- Do something.
		messagebox "Selected surfaces"
	)
	
	
	on sel_are pressed do (
	    -- Do something.
	    messagebox "Selected areas"
	)




)

createDialog toki_FPro_tools


/*
	--selected part -- 
		if forest in selection -- get 3 arrays ; 
		geo sur are
		creat 3 selection sets with names 
		[FP_NAME_geo][FP_NAME_sur][FP_NAME_are]
		assign 3 arrays to corresponding selection sets
		verbose in console counts and result

	-- all part --
		do this in loop for all scene forest pro object classes


*/

/*
	--selected
	1) check selection for forest obj if none > messagebox
	2) for each forest object collect its contents
	3) check if selection set exist in scene -- if not -- create corresponding selectionsets
	4) assign objects to selection sets
	5) verbose about actions
*/

/*
sel -- current selection as array
frt -- current forest
frts -- forests array
geo_arr -- arrays
sur_arr 
are_arr 


fn FN_ss_from_array arr parent_n_str type_str  = (
	-- Function FN_ss_from_array body
	local clean_arr = for i in arr where (i != undefined) collect i
	local full_ss_name = "FP_" + (parent_n_str as string) + "_" + (type_str as string)
	selectionSets[full_ss_name] = clean_arr
	format "creted % with % items\n" full_ss_name (selectionSets[full_ss_name].count)
)


sel = selection as array
if sel.count < 1 then (
	messagebox "select something please"
)
else ( 

	frst = for i in sel where(classof i == Forest_Pro) collect i
	if frst.count < 1 then (
		messagebox "add forest to selection this time"
	)
	else (
		for frt in frst do (
			geo_arr = for cob in frt.cobjlist where (cob!=undefined) collect cob
			sur_arr = for su in frt.surflist where (su!=undefined) collect su
			are_arr = for ar in frt.arnodelist where (ar!=undefined) collect ar
			all_array = geo_arr + are_arr + sur_arr + frt
			-- FN_ss_from_array geo_arr frt.name "geo"
			FN_ss_from_array geo_arr frt.name "geo"
			FN_ss_from_array sur_arr frt.name "sur"
			FN_ss_from_array are_arr frt.name "area"
			FN_ss_from_array all_array ("!!_"+frt.name) "all"
			--FN_ss_from_array geo_arr frt.name "geo"
		)
	)
	--main stuff
)





	"instance geometry"
	frt.cobjlist
	"area nodes"
	frt.arnodelist 
	"surface nodes"
	frt.surflist
fn FN_ss_from_array arr parent_n_str type_str  = (
	-- Function FN_ss_from_array body
	local clean_arr = for i in arr where (i != undefined) collect i
	local full_ss_name = "FP_" + (parent_n_str as string) + "_" + (type_str as string)
	selectionSets[full_ss_name] = clean_arr
	format "creted % with % items\n" full_ss_name (selectionSets[full_ss_name].count)
)

*/