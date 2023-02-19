#!/bin/bash

# the script is responsible for exporting the VS Code settings 

# change working directory to the script's location
SCRIPT_DIR=$(dirname "${BASH_SOURCE[0]}")
cd ${SCRIPT_DIR}

# root directory where settings are stored
CONFIG_DIR=~/.config/Code/User

# array of files that are intended to be exported
FILES=("keybindings.json" "settings.json")

echo "Exporting files from ${SCRIPT_DIR} to ${CONFIG_DIR}"
echo "Following files in ${CONFIG_DIR} will be overwritten"
for FILE in ${FILES[@]}; do
  echo ${CONFIG_DIR}/${FILE}
done

while true; do

read -p "Do you want to proceed? (y/n) " INPUT

case ${INPUT} in
  [yY] ) echo OK, proceeding ...;
         break;;
  [nN] ) echo exiting ...;
         exit;;
  *    ) echo invalid option ...;;
esac

done

for FILE in ${FILES[@]}; do
  cp ./temp_${FILE} ${CONFIG_DIR}/${FILE} 
done

echo done!
