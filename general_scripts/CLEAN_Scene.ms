-- cleans scene with variuos methods.
-- by toki
-- removes note tracks; animation layers; medit sme; ect. 
--
macroScript CLN
category: "# Scripts"
toolTip: "clean Scene With Scripts"
buttonText: "CLN!!"
(
	function retRem_FN args:0 = (
		-- Function retRem_FN body
		try 
		(
			--retimers
			format "% retimers\n" RetimerMan.numRetimers
			if RetimerMan.numRetimers > 0 then 
			(
				t=trackviewnodes
				n=t[#Retimer_Manager]
				deleteTrackViewController t n.controller
				gc()
				format "retimers removed!!\n"
			)
		) 
		catch (format "--------retimers?\n")	
	)

	function tvRem_FN args:0 = (
		-- Function tvRem_FN body
		try 
		(
			-- trackview garbedge
			format " trackview garbedge\n"
			t=trackviewnodes

			nMCM=t[#Max_MotionClip_Manager]
			nLCM=t[#Anim_Layer_Control_Manager]

			if nMCM!=undefined then deleteTrackViewController t nMCM.controller
			if nLCM!=undefined then deleteTrackViewController t nLCM.controller

			gc()
			gc()
			format "trackview garbedge cleaned!!\n"

		)
		catch (format "----------trackview garbedge?")
	)

	function mixRem_FN args:0 = (
		-- Function mixRem_FN body
		try 
		(
			format "max mixer cleaning\n"
			if theMixer.numMaxMixers()>0 do 
			(
				for i=1 to theMixer.numMaxMixers() do (theMixer.removeMaxMixer 1 false 1)
				format "max mixer cleaned\n"

			)

		)
		catch (format "max mixer??\n")
	)

	function delCA_FN type args:0 = (
		-- removes custom attributes by type
		z = 0
		try(
			while z !=undefined do (
			z = custattributes.getdef type 1
			custAttributes.delete type z
			)
			format "% deleted!\n" type
		) catch (format "\nfail on % type!!!\n" type)
	)

	function smeViews_FN = (

			--MatEditor.mode = #advanced
			MatEditor.Close()
			numViews = trackViewNodes[#sme].numsubs
			for i in 1 to numViews do sme.DeleteView 1 false
			gc()
	)

	---------------------------------------

	format "start cleaning\n-------------\n"

	retRem_FN()
	retRem_FN()

	format "-------------\n"

	tvRem_FN()
	tvRem_FN()

	format "-------------\n"

	mixRem_FN()
	mixRem_FN()

	format "-------------\n"

	delCA_FN rootscene
	delCA_FN rootscene.meditmaterials
	delCA_FN rootscene.scenematerials

	try (
		delCA_FN rootscene.Anim_Layer_Control_Manager
	) catch (format" \n")

	smeViews_FN()

	format "-------------\n"
	format  "all cleaned!\n"
)