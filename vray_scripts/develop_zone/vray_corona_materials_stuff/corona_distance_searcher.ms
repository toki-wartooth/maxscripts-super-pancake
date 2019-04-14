
arr =#(1,2,3,4,56,3,12,undefined,23,23,4,134,undefined,undefined,undefined,322,1223,12)


for i = 1 to arr.count do
(
  if arr[i] == undefined do (format "\nbad index % \n" i)
)






------


a = getclassinstances CoronaDistance  -- 

for i in a do
(
  
  if i.nodes.count==0 do print i
    
  checkResult = false
  for x in a[i].nodes do
  ( 
    if x==undefined then checkResult=true
  )
  
  
  
  
  if checkResult==true do print "have delted items"
)








--------



DistanceMap = getclassinstances CoronaDistance  -- list of cor dist maps
--print DistanceMap
for cdist in DistanceMap do  -- iterate over list of maps
(
  --print cdist
  objs=cdist.nodes  -- get objects for each map it is ARRAY
  for z= 1 to objs.count do
  (
    if objs[z] != undefined then 
      (
        
        format "\n ok index % \n" z
      )
    else
      (
        format "\n bad index % \n" z
      )
  )

  print objs
   -- selectionSets["CoronaDistance "+cdist.name] =objs as array
)














--------







a=$Plane001
classOf a.material.texmapDiffuse  -- returns CoronaDistance
corDist = getclassinstances CoronaDistance  -- list of cor dist maps

for mapz in corDist do  -- iterate over list of maps
(
  liz=mapz.nodes  -- get objects for each map
  
    selectionSets["CoronaDistance "+mapz.name] =liz as array
)

--showproperties a.material
--print a.material.texmapDiffuse
--showproperties a.material.texmapDiffuse
lista = a.material.texmapDiffuse.nodes

--for i in lista do
(
  i.wirecolor = red 
)

selectionSets[a.material.texmapDiffuse.name] =lista as array

/*
.colorDiffuse : RGB color
  .colorReflect (colorReflection) : RGB color
  .colorRefract (colorRefraction) : RGB color
  .colorOpacity : RGB color
  .colorTranslucency : RGB color
  .colorSelfIllum (colorSelfIllumination) : RGB color
  .levelDiffuse : float
  .levelReflect : float
  .levelRefract : float
  .levelOpacity : float
  .levelTranslucency : float
  .levelSelfIllum (multiplierSelfIllumination) : float
  .texmapDiffuse : texturemap
  .texmapReflect : texturemap
  .texmapReflectGlossiness : texturemap
  .texmapRefract : texturemap
  .texmapRefractGlossiness : texturemap
  .texmapOpacity : texturemap
  .texmapBump : texturemap
  .texmapTranslucency : texturemap
  .texmapReflectAnisotropy : texturemap
  .texmapReflectAnisotropyRotation : texturemap
  .texmapIor : texturemap
  .texmapFresnelIor : texturemap
  .texmapDisplace (texmapDisplacement) : texturemap
  .texmapReflectBgOverride : texturemap
  .texmapRefractBgOverride : texturemap
  .texmapSelfIllum (texmapSelfIllumination) : texturemap
  .texmapOnDiffuse : boolean
  .texmapOnReflect : boolean
  .texmapOnRefract : boolean
  .texmapOnReflectGlossiness : boolean
  .texmapOnRefractGlossiness : boolean
  .texmapOnOpacity : boolean
  .texmapOnBump : boolean
  .texmapOnTranslucency : boolean
  .texmapOnAnisotropy (texmapOnReflectAnisotropy) : boolean
  .texmapOnAnisotropyRotation (texmapOnReflectAnisotropyRotation) : boolean
  .texmapOnIor : boolean
  .texmapOnFresnelIor : boolean
  .texmapOnDisplacement : boolean
  .texmapOnReflectBgOverride : boolean
  .texmapOnRefractBgOverride : boolean
  .texmapOnSelfIllum (texmapOnSelfIllumination) : boolean
  .mapamountDiffuse : float
  .mapamountReflect : float
  .mapamountRefract : float
  .mapamountReflectGlossiness : float
  .mapamountRefractGlossiness : float
  .mapamountOpacity : float
  .mapamountBump : float
  .mapamountTranslucency : float
  .mapamountAnisotropy (mapamountReflectAnisotropy) : float
  .mapamountAnisotropyRotation (mapamountReflectAnisotropyRotation) : float
  .mapamountIor : float
  .mapamountFresnelIor : float
  .mapamountSelfIllum (mapamountSelfIllumination) : float
  .reflectGlossiness : float
  .refractGlossiness : float
  .fresnelIor : float
  .ior : float
  .absorptionDistance (absorptionDistnace) : worldUnits
  .absorptionColor : RGB color
  .bsdf : integer
  .anisotropy (reflectAnisotropy) : float
  .anisotropyRotation (reflectAnisotropyRotation) : float
  .alphaMode (alphaChannel) : integer
  .gBufferOverride (gBufferIdOverride) : integer
  .displacementMinimum (displacementMinLevel) : worldUnits
  .displacementWaterLevel : float
  .displacementMaximum (displacementMaxLevel) : worldUnits
  .thin (thinNoRefraction) : boolean
  .caustics : boolean
  .texmapTranslucencyFraction : texturemap
  .texmapOnTranslucencyFraction : boolean
  .mapamountTranslucencyFraction : float
  .scatterColor (scatteringColor) : RGB color
  .scatterDirectionality (scatteringDirectionality) : float
  .mapamountAbsorption : float
  .texmapOnAbsorption : boolean
  .texmapAbsorption : texturemap
  .mapamountScatterColor (mapamountScatteringColor) : float
  .texmapOnScatterColor (texmapOnScatteringAlbedo) : boolean
  .texmapScatterColor (texmapScatteringAlbedo) : texturemap
  .visibleInMasks : boolean
  .singleBounceOnly (volumetricSingleBounceOnly) : boolean
  .displacementWaterLevelOn : boolean
  .legacyBrdfNormalization : boolean
  .legacyMode : boolean
  .legacyColoredOpacity : boolean
  .anisotropyOrientationMode : integer
  .anisotropyOrientationUvwChannel : integer
  .pbrMode : boolean
  .opacityCutout (Opacity_cutout_mode) : boolean
  .refractDispersionEnable (enableDispersion) : boolean
  .refractDispersion (dispersion) : float
  .levelSss : float
  .sssScatterColor : RGB color
  .sssRadius : worldUnits
  .texmapOnSssAmount : boolean
  .texmapOnSssRadius : boolean
  .texmapSssAmount : texturemap
  .texmapSssRadius : texturemap
  .mapamountSssAmount : float
  .mapamountSssRadius : float
  .texmapOnSssScatterColor : boolean
  .texmapSssScatterColor : texturemap
  .mapamountSssScatterColor : float
  .materialLibraryId : string
  .mediaMode (Media_scattering_mode) : integer
*/


/*
  .nodes : node array
  .colorNear : RGB color
  .colorFar : RGB color
  .texmapNear : texturemap
  .texmapFar : texturemap
  .distanceNear : worldUnits
  .distanceFar : worldUnits
  .distanceScaleTexmap : texturemap
  .texmapNearOn : boolean
  .texmapFarOn : boolean
  .distanceScaleTexmapOn : boolean
  .colorInside : RGB color
  .texmapInside : texturemap
  .texmapInsideOn : boolean
  .useInside : boolean
  .scatterWarning : boolean
*/











--- old


a=$Plane001
classOf a.material.texmapDiffuse  -- returns CoronaDistance
corDist = getclassinstances CoronaDistance

for mapz in corDist do
(
  
)

--showproperties a.material
--print a.material.texmapDiffuse
--showproperties a.material.texmapDiffuse
lista = a.material.texmapDiffuse.nodes

--for i in lista do
(
  i.wirecolor = red 
)

selectionSets[a.material.texmapDiffuse.name] =lista as array

/*
.colorDiffuse : RGB color
  .colorReflect (colorReflection) : RGB color
  .colorRefract (colorRefraction) : RGB color
  .colorOpacity : RGB color
  .colorTranslucency : RGB color
  .colorSelfIllum (colorSelfIllumination) : RGB color
  .levelDiffuse : float
  .levelReflect : float
  .levelRefract : float
  .levelOpacity : float
  .levelTranslucency : float
  .levelSelfIllum (multiplierSelfIllumination) : float
  .texmapDiffuse : texturemap
  .texmapReflect : texturemap
  .texmapReflectGlossiness : texturemap
  .texmapRefract : texturemap
  .texmapRefractGlossiness : texturemap
  .texmapOpacity : texturemap
  .texmapBump : texturemap
  .texmapTranslucency : texturemap
  .texmapReflectAnisotropy : texturemap
  .texmapReflectAnisotropyRotation : texturemap
  .texmapIor : texturemap
  .texmapFresnelIor : texturemap
  .texmapDisplace (texmapDisplacement) : texturemap
  .texmapReflectBgOverride : texturemap
  .texmapRefractBgOverride : texturemap
  .texmapSelfIllum (texmapSelfIllumination) : texturemap
  .texmapOnDiffuse : boolean
  .texmapOnReflect : boolean
  .texmapOnRefract : boolean
  .texmapOnReflectGlossiness : boolean
  .texmapOnRefractGlossiness : boolean
  .texmapOnOpacity : boolean
  .texmapOnBump : boolean
  .texmapOnTranslucency : boolean
  .texmapOnAnisotropy (texmapOnReflectAnisotropy) : boolean
  .texmapOnAnisotropyRotation (texmapOnReflectAnisotropyRotation) : boolean
  .texmapOnIor : boolean
  .texmapOnFresnelIor : boolean
  .texmapOnDisplacement : boolean
  .texmapOnReflectBgOverride : boolean
  .texmapOnRefractBgOverride : boolean
  .texmapOnSelfIllum (texmapOnSelfIllumination) : boolean
  .mapamountDiffuse : float
  .mapamountReflect : float
  .mapamountRefract : float
  .mapamountReflectGlossiness : float
  .mapamountRefractGlossiness : float
  .mapamountOpacity : float
  .mapamountBump : float
  .mapamountTranslucency : float
  .mapamountAnisotropy (mapamountReflectAnisotropy) : float
  .mapamountAnisotropyRotation (mapamountReflectAnisotropyRotation) : float
  .mapamountIor : float
  .mapamountFresnelIor : float
  .mapamountSelfIllum (mapamountSelfIllumination) : float
  .reflectGlossiness : float
  .refractGlossiness : float
  .fresnelIor : float
  .ior : float
  .absorptionDistance (absorptionDistnace) : worldUnits
  .absorptionColor : RGB color
  .bsdf : integer
  .anisotropy (reflectAnisotropy) : float
  .anisotropyRotation (reflectAnisotropyRotation) : float
  .alphaMode (alphaChannel) : integer
  .gBufferOverride (gBufferIdOverride) : integer
  .displacementMinimum (displacementMinLevel) : worldUnits
  .displacementWaterLevel : float
  .displacementMaximum (displacementMaxLevel) : worldUnits
  .thin (thinNoRefraction) : boolean
  .caustics : boolean
  .texmapTranslucencyFraction : texturemap
  .texmapOnTranslucencyFraction : boolean
  .mapamountTranslucencyFraction : float
  .scatterColor (scatteringColor) : RGB color
  .scatterDirectionality (scatteringDirectionality) : float
  .mapamountAbsorption : float
  .texmapOnAbsorption : boolean
  .texmapAbsorption : texturemap
  .mapamountScatterColor (mapamountScatteringColor) : float
  .texmapOnScatterColor (texmapOnScatteringAlbedo) : boolean
  .texmapScatterColor (texmapScatteringAlbedo) : texturemap
  .visibleInMasks : boolean
  .singleBounceOnly (volumetricSingleBounceOnly) : boolean
  .displacementWaterLevelOn : boolean
  .legacyBrdfNormalization : boolean
  .legacyMode : boolean
  .legacyColoredOpacity : boolean
  .anisotropyOrientationMode : integer
  .anisotropyOrientationUvwChannel : integer
  .pbrMode : boolean
  .opacityCutout (Opacity_cutout_mode) : boolean
  .refractDispersionEnable (enableDispersion) : boolean
  .refractDispersion (dispersion) : float
  .levelSss : float
  .sssScatterColor : RGB color
  .sssRadius : worldUnits
  .texmapOnSssAmount : boolean
  .texmapOnSssRadius : boolean
  .texmapSssAmount : texturemap
  .texmapSssRadius : texturemap
  .mapamountSssAmount : float
  .mapamountSssRadius : float
  .texmapOnSssScatterColor : boolean
  .texmapSssScatterColor : texturemap
  .mapamountSssScatterColor : float
  .materialLibraryId : string
  .mediaMode (Media_scattering_mode) : integer
*/


/*
  .nodes : node array
  .colorNear : RGB color
  .colorFar : RGB color
  .texmapNear : texturemap
  .texmapFar : texturemap
  .distanceNear : worldUnits
  .distanceFar : worldUnits
  .distanceScaleTexmap : texturemap
  .texmapNearOn : boolean
  .texmapFarOn : boolean
  .distanceScaleTexmapOn : boolean
  .colorInside : RGB color
  .texmapInside : texturemap
  .texmapInsideOn : boolean
  .useInside : boolean
  .scatterWarning : boolean
*/