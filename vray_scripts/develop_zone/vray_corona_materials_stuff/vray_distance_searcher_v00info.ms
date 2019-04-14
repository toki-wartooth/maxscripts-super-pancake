

---
---
---WORKS
---
---




/*

-- collection of distance objects
sel=selection as array
a = for s in sel where (classof s.material.texmap_diffuse == VRayDistanceTex ) collect s.material.texmap_diffuse.objects


*/

sel=selection as array
all = objects as array
-- badDistObjs = #()
-- badDistMaps= #()

-- get objects with materials assigned
objMats = for i in all where (i.material != undefined) collect i.material -- have materials
distMats = for o in objMats where (classof o.texmap_diffuse==VRayDistanceTex) collect o -- have distance in diffuse
-- material

emptyDistMaps = for z in distMats where (z.texmap_diffuse.objects.count == 0) collect z.texmap_diffuse -- get empty dist maps

badDistMaps = for x in distMats where (finditem x.texmap_diffuse.objects undefined > 0) collect x.texmap_diffuse -- problem


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

for maps in badDistMaps do fixDist(maps)





---
---

-- arrays
objs = selection as array  	-- array of selection
distMatsArray = #()				-- array of materials with distance
distMapsArray= #()				-- array of distance textures
distNodes = #() 					-- array of nodes in distance maps
BIGArray = #(distMatsArray,distMapsArray,distNodes) -- try to get the big one

for o in objs do
(
	mat= o.material
	nodescount = mat.texmap_diffuse.objects.count
)

for z in objs do
(
	if classof z.material.texmap_diffuse == VRayDistanceTex do append distMatsArray z.material --print"dt" 
)




print "distMatsArray"
print distMatsArray
print bigarray
-- print mat
-- print nodescount


----  info

--collect all attached distance objects in sceleciton
/*

-- collection of distance objects
sel=selection as array
a = for s in sel where (classof s.material.texmap_diffuse == VRayDistanceTex ) collect s.material.texmap_diffuse.objects


*/


---
---


a=selection as array 
a[1].material.texmap_diffuse


---
---


/*

-- collection of distance objects
sel=selection as array
a = for s in sel where (classof s.material.texmap_diffuse == VRayDistanceTex ) collect s.material.texmap_diffuse.objects


*/

sel=selection as array
all = objects as array
-- badDistObjs = #()
-- badDistMaps= #()

-- get objects with materials assigned
objMats = for i in all where (i.material != undefined) collect i.material -- have materials
distMats = for o in objMats where (classof o.texmap_diffuse==VRayDistanceTex) collect o -- have distance in diffuse
-- material
badDistMaps = for x in distMats where (classof x.texmap_diffuse.objects==undefined) collect x.texmap_diffuse -- problem


---
---


-- if $plane005.material.texmap_diffuse.objects.count == 0 do print ($plane005.material.texmap_diffuse.objects.count)
-- if $plane005.material.texmap_diffuse.objects.count==undefined then print "ff" else print"ok"

-- print (classof ($plane005.material.texmap_diffuse.objects))
-- deleteitem $plane005.material.texmap_diffuse.objects 1
asd = $plane005.material.texmap_diffuse.objects  --array
asd.count
-- for i=1 to asd.count in asd where asd[i]==undefined do deleteitem asd i

for i=1 to asd.count do 
(
	print i
	print asd[i]
	
	if asd[i]==undefined do (deleteitem asd i)  -- delete item breaks indexes.
)
-- deleteItem asd q


-- for i=1 to asd.count where asd[i] !=undefined do (deleteitem asd asd[i])
-- print "array"
-- print asd


---
---


-- okObjs=#()
texmap = $plane005.material.texmap_diffuse.objects

okObjs = for i in texmap where i !=undefined collect i

format  "texmap.count = % " texmap.count
format  "okObjs.count = % " okObjs.count

-- print okObjs
if texmap.count>okObjs.count do 
(
	print "fixing?"
	$plane005.material.texmap_diffuse.objects=okObjs
)


format  "texmap.count = % " $plane005.material.texmap_diffuse.objects.count
format  "okObjs.count = % " okObjs.count


---
---



$plane005.material.texmap_diffuse.objects
okObjs = for i in $plane005.material.texmap_diffuse.objects where i !=undefined collect i
	

if ($plane005.material.texmap_diffuse.objects.count) > (okObjs.count) do 
(
	print "suka"
-- 	$plane005.material.texmap_diffuse.objects=okObjs
)



---
---




-- $plane005 is an object
	-- it have material
		--material have diffuse slot with texture map
		--texturemap have a collection of objects in array
		

qqq = $plane005.material.texmap_diffuse.objects -- array

-- find undefind objects in array and collect
okObjs = for i in qqq where i !=undefined collect i
	
-- replace array if counts are different
if (qqq.count) > (okObjs.count) do 
(
	print "fixing"
	qqq=okObjs
)

-- looks like it changes variable instead of real array



---
---


-- $plane005 is an object
	-- it have material
		--material have diffuse slot with texture map
		--texturemap have a collection of objects in array
		--$plane002 bad $plane001 ok


qqq = $plane002.material.texmap_diffuse --  texmap; .objects - array

-- find undefind objects in array and collect
okObjs = for i in qqq.objects where i !=undefined collect i
	
-- replace array if counts are different
if (qqq.objects.count) > (okObjs.count) do 
(
	print "fixing"
	qqq.objects=okObjs
)

-- looks like it changes variable instead of real array
-- to fix it you need to add .objects so it will link to real object
