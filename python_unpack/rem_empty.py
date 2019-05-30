## remove empty dirs in given dir

import sys, os, subprocess



given_path = os.path.normpath(raw_input("Folder: >>> "))





def rem_empty_folders(given_path):
	path_listing = os.listdir(given_path)
	delete_candidates = list()
	for file in path_listing:
		print file
		if os.path.isdir(os.path.join(given_path, file)):
			test = os.listdir(os.path.join(given_path, file))
			if len(test)==0:
				delete_candidates.append(os.path.join(given_path, file))
	# print delete_candidates
	# print "---- \n"
	for i in delete_candidates:
		# print i
		os.rmdir(i)
#
#rem_empty_folders(......)