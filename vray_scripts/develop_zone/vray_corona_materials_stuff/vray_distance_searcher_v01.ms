

sel = selection as array
all = objects as array


-- function that replaces array of objects in distance
fn fixDist distMap = 
(
	okObjs = for i in distMap.objects where i !=undefined collect i
	
	-- replace array if counts are different
	if (distMap.objects.count) > (okObjs.count) do 
	(
		print "fixing"
		distMap.objects=okObjs
		
	)

)

-- dunction that creates named selection set based on material array 
fn selectionSet_FN matArray = 
(
	selME=#()
	for f in matArray do
	(
		for i in all where i.material==f do append selME i	
		
	)
	selectionSets["!!!EmptyDistanceMap"] = selME

)



 -- find objects with materials
objMats = for i in all where (i.material != undefined) collect i.material

-- find materials that have distance in diffuse
distMats = for o in objMats where (classof o.texmap_diffuse==VRayDistanceTex) collect o

-- find materials with empty dist maps
emptyDistMaTs = for z in distMats where (z.texmap_diffuse.objects.count == 0) collect z 

-- find maps with <deleted> entry
badDistMaps = for x in distMats where (finditem x.texmap_diffuse.objects undefined > 0) collect x.texmap_diffuse



-- remove <deleted> entrys
for maps in badDistMaps do 
(
	fixDist(maps)

)

-- create named selection set with ompty distance objects

selectionSet_FN(emptyDistMaTs)
