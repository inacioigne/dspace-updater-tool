#!/bin/bash

docker rm -f dspace7-angular
docker rmi -f docker_dspace7-angular



printf '
--------------------------------------

--------------------------------------
\e[1mPT_BR\e[0m: Backend: Recompilando módulo angular
\e[1mEN\e[0m: Backend: Re-compiling the angular mudule
'

if [[ "${FRONTEND_ADDRESS_GIT}" ]]; then

  printf '
  --------------------------------------

  --------------------------------------
  \e[1mPT_BR\e[0m: O frontend está associado a um repositório git, atualizando código-fonte
  \e[1mEN\e[0m: Backend: The angular module is associated with a git repo, updating the source code
  '
  {
    cd source/dspace-angular-dspace-7.5
    docker run --rm -e FRONTEND_ADDRESS_GIT:${FRONTEND_ADDRESS_GIT} -v $(pwd):/git -w /git alpine/git &&
      git pull ${FRONTEND_ADDRESS_GIT} dspace-angular-dspace-7.5
  } >>./execution.log 2>&1
fi

docker compose -f source/dspace-angular-dspace-7.5/docker/docker-compose.yml up --build -d