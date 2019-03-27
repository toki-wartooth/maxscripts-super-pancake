rndr = renderers.current
classof rndr
if matchPattern (rndr as string) pattern:"*V_RAY*" do
(
-- showproperties a
	rndr.camera_type = 10 -- set cubemap 6x1
)
