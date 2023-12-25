 #!/bin/bash

 echo "###### THIS IS THE INIT SCRIPT! ######"
 echo "###### CURRENT DIRECTORY: $(pwd) ######"
 echo "###### LISTING EVERYTHING! ######"
 ls -l

 pg_restore -U ${POSTGRES_USER} -d ${POSTGRES_DB} /tmp/${BACKUP_NAME}