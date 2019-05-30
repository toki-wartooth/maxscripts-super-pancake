
r'''
input1 = D:\TD\3ddd_workflow\new_batch
input2 = D:\TD\3ddd_workflow\new_batch\804938.5870e29a6854f.rar
requierd output
list original path
list outpath folderpath
list outpath filename?
'''

import sys, os, subprocess, shutil

path = r'D:\TD\3ddd_workflow\new_batch'

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
	return True

archive_paths = getFileList(path, 0)


for pair in archive_paths:
	
	# print (pair[1])
	createFolders(pair[1])
	# extractArchive(pair[0], pair[1])
	# rem_empty_folders(pair[1])

#
# copy image to folders
#
image_paths = getFileList(path, 1)

for i in image_paths:
	filename = i[0]
	extension = os.path.splitext(i[0])[1] # it is with dot already
	folderpath =i[1]
	newname = folderpath + extension
	os.rename(filename, newname)
	shutil.copy(newname, folderpath)

print ("DONE!")
