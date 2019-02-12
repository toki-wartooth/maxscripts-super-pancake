-- set clip on all corona materials
(
local a = getclassinstances Coronamtl 

for i in a do (i.opacityCutout=True)
)
