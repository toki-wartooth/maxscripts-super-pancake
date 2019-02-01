a = selection as array
ids = #()
for i in a do 
(
	append ids (trimLeft i.name "Point")as string
	)
	
--format "% \n" ids
	
str = ""
for y in ids do(
	str = append str y+" "
	
	)
rendPickupFrames = str
	
