



-- todo 
-- find distance with <deleted> objects
-- find distance with on objects at all
-- add ablity to fill empty\deleted distances with placeholder object.


-- add same vray distance support



----------------------
-- for all scene distance textures 
----------------------

DistanceMap = getclassinstances CoronaDistance  -- list of cor dist maps

for cdist in DistanceMap do  -- iterate over list of maps
(
  objs=cdist.nodes  -- get objects for each map
  
    selectionSets["CoronaDistance "+cdist.name] =objs as array
)