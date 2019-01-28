-- this will make all cproxy to become a mesh.
-- can take significant time.

for i in geometry where(classof i == Cproxy ) do (Cproxy.ProxyFp.duplicateToMesh i)
