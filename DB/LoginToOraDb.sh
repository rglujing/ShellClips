# Login to mysql
# Oracle databse use sqlplus
#

ret=`mysql -u root -p123456 << EOF
use test;
show tables;
quit
EOF`

echo "---------------------------"
echo $ret
