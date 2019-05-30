import subprocess

def sevenzip(filename, zipname, password):
    print("Password is: {}".format(password))
    system = subprocess.Popen(["d:\\TD\\3ddd_workflow\\7z\\7zG.exe", "a", zipname, filename, "-p{}".format(password)])
    return(system.communicate())

def extractfiles(zipname, out):
	system = subprocess.Popen(["d:\\TD\\3ddd_workflow\\7z\\7zG.exe", "e", zipname, "-o"+out])
	return(system.communicate())


archivepath = "d:\\TD\\3ddd_workflow\\2360903.zip"
outpath = "d:\\TD\\3ddd_workflow\\2360903"

extractfiles(archivepath, outpath)

