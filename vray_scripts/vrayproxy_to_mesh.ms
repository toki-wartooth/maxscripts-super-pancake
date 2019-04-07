-- convert selected vray proxy to mesh and keep material


target = for q in selection as array where classof q == VRayProxy collect q
for i in target do
(
	mat = i.material
	local obj = vrayMeshImport i
	obj.material = mat
)