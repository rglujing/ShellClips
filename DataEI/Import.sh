
   . Config.ini
   TABLE_NAME=$1

   if [ X"${TABLE_NAME}" = X ]; then
      echo $0 tablename
      exit
   fi

   COLS_FILE=/tmp/${TABLE_NAME}.cols
   TMPDATA=${TABLE_NAME}.data
   rm -rf ${COLS_FILE}
   db2 connect to $DBNAME user $DBUSER using $DBPWD;

###Get Columns

   cfg_cols=${!TABLE_NAME}
   if [ "${cfg_cols}" = "all" ] ; then

      db2 -x describe table ${TABLE_NAME} > ${COLS_FILE}        
      tc1=`cat ${COLS_FILE} | awk '{print $1}' | tr -s ["\n"]`
      tc2=`echo ${tc1} | awk '{ for(i=1;i<=NF;i++) {print  $i; if(i<NF) print "," } }'`
      COLS=`echo ${tc2}`
   elif [ X"${cfg_cols}" = X ]; then
      echo "Need Config in Config.ini"
      exit
   else    
      COLS=${cfg_cols}
   fi


   echo $TABLE_NAME
   echo ${cfg_cols}
   echo $COLS


   db2 import from ${TMPDATA} of DEL COMMITCOUNT 500  insert into ${TABLE_NAME} \( ${COLS} \)

