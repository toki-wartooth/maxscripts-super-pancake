
fn FN_sme_background  = (
   -- Function sme_background body

	local smeview = sme.GetView(sme.activeView)
	local viewcount = smeview.getNumNodes()


	local mat_array = #()

	for i = 1 to viewcount do
	(
		matt_node = smeview.GetNode i
		matt = matt_node.reference
		if superClassOf matt == material do append mat_array matt
	)

	for t in mat_array do 
	(
		setMTLMeditFlags t #{1..3,5,7}
	)
)

FN_sme_background()