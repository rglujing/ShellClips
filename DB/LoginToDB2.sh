
db2 connect to $DBNAME user $DBUSER using $DBPWD;
for file in `ls *.sql`
do
       echo $file
       db2 -tvf $file -l create.log
done

db2 terminate


 ### db2 bind BNDFILENAME QUALIFIER username
