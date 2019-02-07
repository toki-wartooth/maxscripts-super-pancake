
sme_count = sme.getNumViews()
sme_status = sme.isOpen()

clist = #(red, green,blue, white-red, white-green, white-blue)


clearListener()

format "\n"
format "sme count %\n" sme_count
format "sme status %\n" sme_status
format "\n"

fn FN_rnd_cd = 
(
   -- Function FN_rnd_cd body
   return (color (random 0 255) (random 0 255) (random 0 255))
)
fn FN_make_MM numsubs = 
(
   -- Function FN_make_MM numsubs

	--numsubs=15

	clist = #(red, green,blue, white-red, white-green, white-blue)
	multisub_mtl = Multimaterial numsubs:numsubs name:"TempMultisub"

	for i=1 to multisub_mtl.material.count do (
		multisub_mtl.material[i].diffuse = FN_rnd_cd()
		)
	for i=1 to clist.count do (multisub_mtl[i].diffuse = clist[i])
	return multisub_mtl
)
fn FN_sme_createview node = 
(
   -- Function sme_createview body

	if (sme_status==False and sme_count < 5) then
	(
		sme.Open()
	)
	else
	 (
	 	if sme_count > 5 do
	 	(
	 		for i in 1 to sme_count do sme.DeleteView 1 false
	 	)
	)

	sname = "MultisubMaterial"
	exist = sme.GetViewByName sname

	if (exist != 0) then 
	(
		material_view = sme.GetView exist
	)
	else
	(
		material_view = sme.GetView (sme.CreateView sname)
	)
	-- [0,0]
	ppp=[0,0]
	material_view.Createnode node &ppp
)

numsubs=6

multisub_mtl = Multimaterial numsubs:numsubs name:"TempMultisub"

for i=1 to multisub_mtl.material.count do 
(
	multisub_mtl.material[i].diffuse = FN_rnd_cd()
)
cntmin = amin #(clist.count, numsubs)
for i=1 to cntmin do (multisub_mtl[i].diffuse = clist[i])

FN_sme_createview multisub_mtl

try(
	for i in selection as Array do 
	(
		i.material = multisub_mtl
	)

) catch (messageBox "error")
----


