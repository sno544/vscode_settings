#!/bin/bash

# the script is responsible for importing the VS Code settings 
# from given config directory (usually it should be just '~/.config/Code/User') to the local repo 
# keep in mind it overwrites existing files in the local repo!

# change working directory to the script's location
SCRIPT_DIR=$(dirname "${BASH_SOURCE[0]}")
cd ${SCRIPT_DIR}

# root directory where settings are stored
CONFIG_DIR=~/.config/Code/User

# array of files that are intended to be imported
FILES=("keybindings.json" "settings.json")

echo "Importing files from ${CONFIG_DIR} to ${SCRIPT_DIR}"
echo "Following files in ${SCRIPT_DIR} will be overwritten"
for FILE in ${FILES[@]}; do
  echo ${SCRIPT_DIR}/${FILE}
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
  cp ${CONFIG_DIR}/${FILE} ./temp_${FILE}
done

echo done!
