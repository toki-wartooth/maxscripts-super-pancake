masss= getclassinstances VrayMtl

for i in masss do
    if (i.reflection.r > 0 and i.reflection.g > 0 and i.reflection.b > 0) or i.texmap_reflection != undefined do
    (
		
		print i
		
		
		/*
        (
            reflGlossLow= if i.reflection_glossiness>=0.95 do collect i
            reflGlossLowMid= if i.reflection_glossiness>=0.70 do collect i
            reflGlossMid = if i.reflection_glossiness >= 0.50 do collect i
            reflGlossHigh = if i.reflection_glossiness >=0.3 do collect i
        )
	 */
    )
    
	

----------------------

function GlossGet mtlArr glossVal =
(
	TempArray = for i in mtlArr where i.reflection_glossiness >= glossVal collect i
)


----------------------
-- get all Vray mtls in sceene
masss= getclassinstances VrayMtl

-- separate materials with reflections
reflectedMasss  = for mats in masss where (mats.reflection.r > 0 and mats.reflection.g > 0 and mats.reflection.b > 0) or mats.texmap_reflection != undefined collect mats

-- separate materials based on reflection glossy
reflGlossLow = GlossGet reflectedMasss 0.95
reflGlossLowMid= GlossGet reflectedMasss 0.70
reflGlossMid= GlossGet reflectedMasss 0.50
reflGlossHigh= GlossGet reflectedMasss 0.30


format "low %" reflGlossLow
format "lowMid %" reflGlossLowMid
format "mid %" reflGlossMid
format "high %" reflGlossHigh




reflGlossLow = for j in masss where j.reflection_glossiness>=0.95 collect j  -- varian 1 of collect array

reflGlossLow_two = #()

for i in masss do 
	(
		if (i.reflection.r > 0 and i.reflection.g > 0 and i.reflection.b > 0) or i.texmap_reflection != undefined do
		(
			if i.reflection_glossiness>=0.95 do append reflGlossLow_two i
		)

	)
	
format "refGloss method 1 : %" reflGlossLow
format "refGloss_two method 2 : %" reflGlossLow_two

	
print reflGlossLow
print reflGlossLow_two