




/******************* Check for Render Hidden Geometry ******************/
if rendHidden then (
                addProblem #warn #RenderSetup "!!! Render Hidden Geometry is turned on" )


/*********************** Check for Region Render ***********************/
local regiontest = vfbControl(#getregion) as string

if not (matchPattern regiontest pattern:"*0, 0, 0, 0*") then (
                addProblem #warn #RenderSetup "!!! VFB Region Render is turned on" )

)


vfbControl #showcc false	
vfbControl #setregion "reset"
vfbControl #setregion 64 64 62 62
-- 
--
/*Here comes hudge list of vfbControll method*/
--
vfbControl()
Usage: vfbControl [#help] [#rgb|#red|#green|#blue|#alpha|#mono|#trackmouse|#linkpdp <BOOLEAN>]
                          [#swapab <BOOLEAN>] [#setcompareab "h"|"hor"|"horizontal"|"v"|"ver"|"vertical"]
                          [#loadimage|#saveimage|#saveallimage|#savemultiimage <FILENAME STRING>]
                          [#setregion <left top right bottom>]
                          [#getregion] Returns <left top right bottom>
                          [#setregion "reset"] To reset/disable region.
                          [#clearimage|#duplicate|#hide]
                          [#show <BOOLEAN>] Shows/hides VFB. If it's called without params displays VFB state.
                          [#getchannelnames] Returns a string[]. Indices correspond with #get/setchannel.
                          [#getchannel] Returns the index of the current channel.
                          [#setchannel <INTEGER>]
                          [#pos <INTEGER> <INTEGER> | "reset"]  <left> <top> - moves the window to the provided coordinates
                                                                 "reset" - moves the VFB window to it's default coordinates
                                                                 Without parameters returns the current coordinates.

                          For Color Corrections:
                          [#showcc <BOOLEAN>] [#clamp|#viewclamp|#info|#history|#pixelaspect <BOOLEAN>]
                          [#exposure|#whitebalance|#huesat|#colorbalance|#levels|#curve|#bkgr|#lut|#ocio|#icc|#srgb <BOOLEAN>]
                          [#ccociovt|#ccocioics|#ccociodd <INTEGER>]
                          [#ocioinputcolorspace|#ociodisplaydevice|#ocioviewtransform <STRING>]
                          [#itemsociocs|#itemsociodd|#itemsociovt|#itemsiccri] Returns list of combo box items
                          [#colorbalancemode 0|1|2|3] 0 - All 1 - Shadows 2 - Midtones 3 - Highlights
                          [#colorbalancevalue <INTEGER|FLOAT INTEGER|FLOAT INTEGER|FLOAT>]
                          [#huesaturationvalue <INTEGER|FLOAT INTEGER|FLOAT INTEGER|FLOAT>]
                          [#cclevels_rgb|#cclevels_red|#cclevels_green|#cclevels_blue|#bkgrimgasforegr|#lutconverttolog|#cciccblackpoint <BOOLEAN>]
                          [#stereo 0|1|2]  mode 0 - inactive current mode  mode 1 - red/cyan  mode 2 - green/magenta
                          [#cciccrenderintent 1|2|3|4]  1 - Perceptual  2 - Relative colorimetric 3 - Saturation 4 - Absolute colorimetric
                          [#setexposure|#setcontrast|#setlevelsmin|#setlevelsmax|#setwhitebalanceval <FLOAT NUM>]
                          [#getexposure|#getcontrast|#getlevelsmin|#getlevelsmax|#getwhitebalanceval] Returns <FLOAT NUM>
                          [#loadbkgrimage|#loadlut|#loadocio|#loadicc|#loadcurve|#savecurve <FILENAME STRING>]
                          [#saveglobalccpreset|#loadglobalccpreset|#saveccpreset|#loadccpreset <FILENAME STRING>]
                          [#resetcc|#resetccexp|#resetccwb|#resetcchsl|#resetccbal|#resetcclvl|#resetcccrv|#resetcclut|#resetccicc|#resetccocio|#resetccbgimg
                          [#bkgrimgfile|#lutfile|#iccfile|#ociofile] Returns <FILENAME STRING>

                          For VFB History:
                          [#showhistory <BOOLEAN>] [#history <BOOLEAN>] [#historytemppath <PATH STRING>] [#historymaxsize <INTEGER>]
                          [#historyselect <INTEGER>] To select a history image (0-based index) for the commands on the next line.
                          [#historyload|#historysave|#historyseta|#historysetb|#historyremove|#historyclear]
                          [#historycomment <STRING>]

                          For Lens Effects:
                          [#bloom|#glare|#bloomfill|#glarefill <BOOLEAN>]
                          [#bloommode "image"|"both"|"renderelem"]
                          [#glaretype "image"|"rendercam"|"camparams"]
                          [#glaremode "image"|"both"|"renderelem"]
                          [#bloomweight|#bloomsize|#bloomshape|#glareweight|#glaresize <FLOAT NUM>]
                          [#bloomintensity|#bloomobject|#bloommaterial|#glareintensity|#glareobject|#glarematerial <BOOLEAN>]
                          [#bloomsetintensity|#glaresetintensity <FLOAT NUM>]
                          [#bloomgetintensity|#glaregetintensity] Returns <FLOAT NUM>
                          [#bloomsetobject|#bloomsetmaterial|#glaresetobject|#glaresetmaterial <INTEGER>]
                          [#bloomgetobject|#bloomgetmaterial|#glaregetobject|#glaregetmaterial] Returns <INTEGER>
                          [#glarediffraction|#glareuseobstacle|#glareblades <BOOLEAN>]
                          [#glaresetblades|#glarebladesrot|#glarefnumber <FLOAT NUM>]
                          [#glaregetblades] Returns <FLOAT NUM>
                          [#glareimage|#glareobstacleimage <FILENAME STRING>]

                          For Stamps:
                          [#stamp <BOOLEAN>]
                          [#stamphalign "left"|"center"|"right"] [#stampvalign "top"|"bottom"]
                          [#stamptext <STRING>]

                          Where <BOOLEAN> is true|false 
                                and <left top right bottom> are integers.

                          Note: Successfully loading a file or setting a numerical value
                                implicitly enables the corresponding option.
                                If you want to disable it, do it after the load/set command.
                                All commands, that make sense to return values,
                                written without arguments return value or list of values depend on comand type.
OK


