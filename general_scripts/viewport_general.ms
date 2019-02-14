-- sets viewport basic properties and makes all by object basis excludeing render settings


fn VP_fix_FN = 
(
	by_layer = for i in objects where \
				(	i.colorByLayer!=False or \
					--i.renderByLayer !=False or \
					i.motionByLayer !=False or \
					i.displayByLayer !=False ) \
					collect i
	for t in by_layer do 
	(
		t.colorByLayer = False
		--t.renderByLayer = False
		t.motionByLayer = False
		t.displayByLayer = False
	)
	for op in objects do 
	(
		op.backFaceCull = False
	)
)
VP_fix_FN()