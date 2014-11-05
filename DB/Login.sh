#用于登录mysql数据库，可以进行一些操作，获取结果之后，进行处理
#
#

ret=`mysql -u root -p123456 << EOF
use test;
show tables;
quit
EOF`

echo "---------------------------"
echo $ret
