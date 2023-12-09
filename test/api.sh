#!/bin/bash 

{

  if ! [[ $1 ]]; then
    source ./upgrade-variables.properties
  else
    source ./ibict_upgrade-variables.properties
    source ./_default_instalation_variables.properties
  fi

  docker pull intel/qat-crypto-base:qatsw-ubuntu
  docker pull kubeless/unzip
  docker pull alpine/git
} >>./execution.log 2>&1

printf '
--------------------------------------
\U0001F171
--------------------------------------
\e[1mPT_BR\e[0m: Gerando uma nova senha do PostgreSQL para esta nova instalação. Você poderá encontrar a nova senha no arquivo localizado em "dspace-install-dir/config/local.cfg"
\e[1mEN\e[0m: Generating a new PostgreSQL password for this installation. You will be able to find this new password in "dspace-install-dir/config/local.cfg"
'