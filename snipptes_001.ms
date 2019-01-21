-- scenewidde corona proxy display as box




prxy = for i in geometry where(classof i ==CProxy) collect i
for p in prxy do (
	p.previzType = 0
	p.cacheInRam=False
)




----
 // all selection sets to one selection set
--selectionsets.count
--selectionsets[3].count
tempss = #()

for i=1 to selectionsets.count do (
	for s=1 to selectionsets[i].count do (
		append tempss selectionsets[i][s]
		)
)

selectionsets["all_objects"] = tempss

for sset in selectionsets do (
	--print sset
	group sset name:sset.name
)


----
----

// group selection set 


for sset in selectionsets do (
	--print sset
	group sset name:sset.name
)


----
----

--selection.pivot = [0,0,0]

--sel = selection as array

grps = for i in Helpers where (classof i == Dummy ) collect i
for g in grps do (
	g.pos.x = 0
	g.pos.y = 0
	g.pivot = [0,0,0]
	
)

----
----


