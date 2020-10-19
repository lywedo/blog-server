
#!/bin/bash
sleep 20
mysql -uroot -p$MYSQL_ROOT_PASSWORD <<EOF

source /mysql/mysql_blog.sql;

ALTER USER 'root'@'%' IDENTIFIED BY '123456' PASSWORD EXPIRE NEVER;
ALTER USER 'root'@'%' IDENTIFIED WITH mysql_native_password BY '123456';
flush privileges;


