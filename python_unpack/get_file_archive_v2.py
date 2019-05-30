import sys, os, subprocess, shutil

#
# drop folder to this file to extract contents of all archives flat
#

# uses 7zG.exe and 7z.dll

lib_path = os.getcwd() + "/lib/"
if len(sys.argv) < 1 :
	folder_to_work = os.path.normpath(sys.argv[1])
else:
	folder_to_work = os.path.normpath(raw_input("Folder: >>> "))

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

def getFileList(path, switch):
	'''0 - archive; 1-images '''
	files = os.listdir(path)
	if switch ==0:
		fp = [os.path.join(path,i) for i in files if i.endswith((".rar", ".zip", ".7zip"))==True]
	if switch ==1:
		fp = [os.path.join(path,i) for i in files if i.endswith((".jpg", ".jpeg", ".png"))==True]
	folders = [os.path.join(path, os.path.splitext(i)[0].split(".")[0]) for i in fp]
	FileList = zip(fp, folders)
	return FileList

def createFolders(folder_path):
	if os.path.exists(folder_path) is not True:
		os.makedirs(folder_path)
	return folder_path



# END defenitions #



archive_paths = getFileList(folder_to_work, 0)


for pair in archive_paths:
	
	# print (pair[1])
	createFolders(pair[1])
	extractfiles(pair[0], pair[1])
	rem_empty_folders(pair[1])

#
# copy image to folders
#


image_paths = getFileList(folder_to_work, 1)

for i in image_paths:
	filename = i[0]
	extension = os.path.splitext(i[0])[1] # it is with dot already
	folderpath =i[1]
	newname = folderpath + extension
	os.rename(filename, newname)
	shutil.copy(newname, folderpath)

#
# Archive cleanup 
#
dest_path = os.path.join(folder_to_work, "_archives")



for arc in archive_paths:
	basefilename = os.path.splitext(os.path.basename(arc[0]))[0].split(".")[0] # 12312.qwef3.rar --> 12312 
	extension = os.path.splitext(arc[0])[1] # 12312.qwef3.rar --> .rar
	rename_dest =os.path.join(folder_to_work, basefilename) + extension
	# print (rename_dest)
	os.rename(arc[0], rename_dest)
	shutil.move(rename_dest, createFolders(dest_path))

## 
'''
###  log part
out_file_path = lib_path
out_file_name = "log.txt"
log = open(os.path.join(out_file_path, out_file_name), "w")
log.write("Full filepaths that will be unpacked:\n")
for line in string_lines:
	log.write(line + "\n")
log.close()
'''

print ("DONE!")
