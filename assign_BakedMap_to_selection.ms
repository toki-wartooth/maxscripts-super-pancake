sel = selection as array
data=RTT_Data  
for i in sel do(
	matname = i.name
	diffmap = bitmaptex()
	
	--diffmap.bitmap = 
	
	p = data.FileOutput_FilePath
	bname = i.name + "Corona_Beauty0000"
	ext = data.FileOutput_FileType
	diffmap.filename = p+"\\"+ bname+ext
	
	mat_to_apply = standardMaterial  name:(matname+"_material") diffuse:(color 128 128 128) diffusemap:diffmap
	i.material = mat_to_apply
	)