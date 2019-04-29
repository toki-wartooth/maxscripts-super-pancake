-- remove all render elements paths and fileoutput path 


fn remove_all_output_paths = (
   -- Function remove_all_output_paths body
	re = maxOps.GetCurRenderElementMgr()
	for i = 0 to re.NumRenderElements() do re.SetRenderElementFilename i ""
	rendOutputFilename = ""
)

remove_all_output_paths()