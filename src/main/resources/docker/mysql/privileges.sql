use mysql;
-- 切换mysql8的密码策略
-- ALTER USER 'root'@'%' IDENTIFIED WITH mysql_native_password BY '123456';
-- alter user 'root'@'%' identified by '123456';
-- flush privileges;
-- select host, user from user;
-- 因为mysql版本是5.7，因此新建用户为如下命令：
-- ALTER USER 'root'@'localhost' IDENTIFIED BY 'Springbootplus666!';
create user 'docker'@'%' identified by '123456';
-- 将docker_mysql数据库的权限授权给创建的docker用户，密码为123456：
-- grant all on spring_boot_plus.* to docker@'%' identified by '123456' with grant option;
grant all privileges on *.* to 'docker'@'%';
-- 这一条命令一定要有：
-- flush privileges;
-- 因为mysql8.0改变了加密方式，使用下面的命令即可解决问题
ALTER USER 'docker'@'%' IDENTIFIED BY '123456' PASSWORD EXPIRE NEVER;
ALTER USER 'docker'@'%' IDENTIFIED WITH mysql_native_password BY '123456';
flush privileges;