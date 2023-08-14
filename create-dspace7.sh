#!/bin/bash

source ./backend_remove.sh
source ./backend_build.sh default-ibict

printf '
--------------------------------------
\U0001F180
--------------------------------------
\e[1mPT_BR\e[0m: Frontend: Removendo arquivos e container de execuções antigas (caso eles existam).
Sua senha root será solicitada.

\e[1mEN\e[0m: Frontend: Deleting old files and containers from previous executions (in case they exists).
Your root password will be requested.
'

{
rm dspace-7.5.zip || true > /dev/null 2>&1 > /dev/null
sleep 1
rm -rf ./source/dspace-angular-dspace-7.5

docker rm -f dspace7-angular || true > /dev/null 2>&1 > /dev/null
docker rmi -f docker_dspace7-angular || true > /dev/null 2>&1 > /dev/null
} >> ./execution.log 2>&1

source ./frontend_build.sh  default-ibict


printf '
--------------------------------------
\U00023F3
--------------------------------------
\e[1mPT_BR\e[0m: Crie o seu primeiro usuário administrador do DSpace
\e[1mEN\e[0m: Create the fist admin user
'
docker exec -it dspace7 /dspace/bin/dspace create-administrator