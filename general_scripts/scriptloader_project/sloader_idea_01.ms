

script_path = @"d:\toki\GitHub\maxscripts-super-pancake"

fn endswith str =
(
	splitted = filterString str "." splitEmptyTokens:True
	if splitted[splitted.count]!="ms" then 
	(
		return False
	)
	else return True

)

fn get_all_sceipts script_path = (
   -- Function get_all_sceipts body
	dirs = getDirectories(script_path + "\\*")
	-- local files = getfiles(script_path + "\*.*")
	full_script_path = #()
	for i in dirs do
	(
		files=getFiles(i + "\\*")
		if files.count > 0 then
		(
			format "dir = %\n" i
			for q in files do (
				filename = filenameFromPath q
				format "filname = %\n" filename
				if (endswith filename) do append full_script_path q
				)
		)
		else
		(
			format "empty =(  %\n" i
		)
	)
	return full_script_path
)

try DestroyDialog ddl_test

rollout ddl_test "Drop-Down List"
(
  dropdownlist scale_dd "Scale" items:(get_all_sceipts script_path)
  on scale_dd selected i do
    format "You selected '%'!\n" scale_dd.items[i]
  on scale_dd rightClick do scale_dd.items = get_all_sceipts script_path
)
createDialog ddl_test

