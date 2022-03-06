local lfs = require("lfs")
 
--读取路径
local path ="/home/book/work/istore-package-master"
 
function attrdir(path)
	for file in lfs.dir(path) do
		--过滤"."和".."目录
		if file ~= "." and file ~= ".." then
			if file == ".svn" then 
				os.execute("cd "..path..";svn up;cd -")
				print("svn up  "..path)
			elseif file == ".git" then
				os.execute("cd "..path..";git pull;cd -")
				print("git pull  "..path)
		   end
		end
	end
end

function run_attrdir(path)
	for file in lfs.dir(path) do
		--过滤"."和".."目录
		if file ~= "." and file ~= ".." then
			local f = path.. '/' ..file
			local attr = lfs.attributes (f)
			--如果是是目录，就递归调用，否则就写入文件
			if attr.mode == "directory" then
				print(f)
				attrdir(f)
			end
		end
	end
end
 
run_attrdir(path)