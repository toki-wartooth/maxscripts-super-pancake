import sys, os, subprocess

#
# drop folder to this file to extract contents of all archives flat
#

# uses 7zG.exe and 7z.dll


lib_path = os.getcwd() + "/lib/"
if len(sys.argv) < 1 :
	folder_to_work = os.path.normpath(sys.argv[1])
else:
	folder_to_work = os.path.normpath(raw_input("Folder: >>> "))

archive_files = os.listdir(folder_to_work)

# d:\TD\3ddd_workflow
####
# os.path.normpath


def extractfiles(zipname, out):
	system = subprocess.Popen([ os.path.join(lib_path, "7zG.exe") , "e", zipname, "-o" + out])
	return(system.communicate())




def rem_empty_folders(given_path):
	path_listing = os.listdir(given_path)
	delete_candidates = list()
	for file in path_listing:
		# print file
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


string_lines = list()
for file in archive_files:
	if file.endswith((".rar", ".zip", ".7zip")):
		string_lines.append(os.path.join(folder_to_work, file))



###  log part
out_file_path = lib_path
out_file_name = "log.txt"
log = open(os.path.join(out_file_path, out_file_name), "w")
log.write("Full filepaths that will be unpacked:\n")
for line in string_lines:
	log.write(line + "\n")
log.close()


for item in string_lines:
	## if no dir exist make dir with base name no extension
	full_folder_name = os.path.splitext(item)[0]
	if os.path.exists(full_folder_name) is not True:
		os.makedirs(full_folder_name)
	# extract with 7zip files
	extractfiles(item, full_folder_name)


#### 
# ERROREE
## remove empty dirs in dir
for folder in string_lines:
	full_folder_name = os.path.splitext(folder)[0]
	rem_empty_folders(full_folder_name)

#


# scriptpath = os.getcwd()
# f = os.path.normpath(scriptpath + "/out/data.txt")
# fp = os.path.split(f)[0]
# if os.path.exists(fp) is not True:
# 	os.makedirs(fp)


# if not os.listdir(dir): 
#     print "Empty"
#      os.rmdir(dir)

# file_obj = open(f, "w")

# for i in xrange(0, len(sys.argv)):
# 	file_obj.write(sys.argv[i] + "\n")


# file_obj.close()



