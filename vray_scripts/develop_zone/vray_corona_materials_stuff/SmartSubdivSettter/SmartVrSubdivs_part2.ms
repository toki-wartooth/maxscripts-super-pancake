for i in getclassinstances VrayMtl do
    if (i.reflection.r > 0 and i.reflection.g > 0 and i.reflection.b > 0) or i.texmap_reflection != undefined do
    (
        (
            reflGlossLow= if i.reflection_glossiness>=0.95 do collect i
            reflGlossLowMid= if i.reflection_glossiness>=0.70 do collect i
            reflGlossMid = if i.reflection_glossiness >= 0.50 do collect i
            reflGlossHigh = if i.reflection_glossiness >=0.3 do collect i
        )
    )
    
    
function vrReflectSubdiv_FN matArr subdVal = 
(
    for i in matArr do 
    (
        i.reflection_subdivs = subdVal
        
    )

)

vrReflectSubdiv_FN reflGlossLow 8
vrReflectSubdiv_FN reflGlossLowMid 24
vrReflectSubdiv_FN reflGlossMid 64
vrReflectSubdiv_FN reflGlossHigh 128

/*
.reflection : RGB color
.reflection_glossiness : float
.reflection_subdivs : integer
.texmap_reflection : texturemap



*/

if (i.reflection.r > 0 and i.reflection.g > 0 and i.reflection.b > 0) or i.texmap_reflection != undefined do



---


/*
    for i in getClassInstances VRayMtl do
    (
      i.option_cutOff = 0.001
      i.reflection_maxDepth = 15
      i.brdf_type = 4
      i.reflection_lockGlossiness=False
      i.hilight_glossiness=1
      i.option_reflectOnBack=True
    )

    ren=renderers.current

    ren.filter_on=False
    ren.options_overrideDepth_on=False
    ren.options_transpMaxLevels=16
    ren.options_transpCutoff=0.01
    ren.options_ray_bias=0.001




    for i in getClassInstances VRayMtl do
    (
      i.option_cutOff = 0.001
      i.reflection_maxDepth = 15
      i.brdf_type = 4
      i.reflection_lockGlossiness=True
      i.hilight_glossiness=1
      i.option_reflectOnBack=True
    )

    ren=renderers.current

    ren.filter_on=True
    ren.options_overrideDepth_on=False
    ren.options_transpMaxLevels=12
    ren.options_transpCutoff=0.01
    ren.options_ray_bias=0.001
    —----
    —----

    a=renderers.current
    a.dmc_balance_subdivs
    a.twoLevel_baseSubdivs
    a.twoLevel_fineSubdivs
    a.twoLevel_showSamples
    a.twoLevel_threshold

    showproperties a.twoLevel_threshold
    classof a.twoLevel_threshold
    a.twoLevel_adaptiveEnable
    a.dmc_importanceSampling
    a.dmc_earlyTermination_amount
    a.dmc_earlyTermination_threshold
    a.dmc_earlyTermination_minSamples
    a.dmc_subdivs_mult
    a.dmc_pathSampler_type
    a.dmc_useLocalSubdivs
    a.dmc_optimizeShadingRate
    a.options_rgbColorSpace
    a.dmcgi_subdivs
    a.dmcgi_depth
*/

masss= getclassinstances VrayMtl

reflGlossLow = for j in masss where i.reflection_glossiness>=0.95 collect j





for i in getclassinstances VrayMtl do
    


    if (i.reflection.r > 0 and i.reflection.g > 0 and i.reflection.b > 0) or i.texmap_reflection != undefined do
    (
        (
            reflGlossLow= if i.reflection_glossiness>=0.95 do collect i
            reflGlossLowMid= if i.reflection_glossiness>=0.70 do collect i
            reflGlossMid = if i.reflection_glossiness >= 0.50 do collect i
            reflGlossHigh = if i.reflection_glossiness >=0.3 do collect i
        )
    )
