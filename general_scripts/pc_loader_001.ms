sel = selection as array

get = getSavePath caption:"select folder for pc"
pcpath = get

for i in sel do (

	pcfile = pcpath +"\\"+ ((i.name)as string ) + ".pc2" 
	--a = Point_Cache()
	
	addmodifier i (Point_cache filename:pcfile)
	--a.cache_file = pcfile
	
)




