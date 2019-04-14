

--automatCreator for tests


objs = $ as array

for i in objs do( i.material = vraymtl ())

for j in objs do (j.material.reflection=(color 100 100 100))
	
for s=1 to objs.count do 
(
	objs[s].material.reflection_glossiness=s*0.1
	objs[s].material.name ="Vrm_"+s as string
	
)

