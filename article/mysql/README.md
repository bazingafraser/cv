# Func : Mysql基本操作

#Mysql中数据导出到excel文件语句\
方法一：\
select d.*,a.* from departmentinfo d left JOIN affiliatestake a on d.id=a.deptid into outfile ’d:test.xls’;\
方法二：\
mysql -h127.0.0.1 -uroot -p123 -e “select d.*,a.* from departmentinfo d left JOIN affiliatestake a on d.id=a.deptid” >/tmp/test.xls\
方法三：\
echo "select d.*,a.* from departmentinfo d left JOIN affiliatestake a on d.id=a.deptid;"| /usr/local/mysql/bin/mysql -hlocalhost -uroot -pxxxxx > /tmp/test.xls\
导出excel中乱码解决：\
如果导出的xls文件中出现乱码\
1、点击文件右击打开方式使用记事本打开\
2、在打开的记事本点击左上角 文件-->另存为\
3、文件名称自定义为test.xls，保存类型选择所有文件（*.*），编码选择UTF-8\
4、使用excel打开另存的文件查看内容已经显示正常


