#!/bin/bash

: <<'END'
DIR = /home/goun/Source/swp/localization-data
CONFIG = /home/goun/Source/swp/lintScript/ilib-lint-config.json
./execute.sh ~/Source/swp/localization-data/ /home/goun/Source/ilib-samples/lint-webos/ilib-lint-config.json
END

SAVEIFS=$IFS
IFS=$(echo -en "\n\b")

DIR=${1?param missing - Specify the localization-data path }
CONFIG=${2?param missing - Specify the ilib-llint-config.json file path }
cd $DIR
echo $PWD
appCnt=0
invalidCnt=0
START_TIME=$(date +%s)
arrInvalidDir=()

for appDir in `find . -type d`
do
  if [ "$appDir" == "." ]; then
    arrInvalidDir+=($appDir)
  elif [ "$appDir" == "./git" ]; then
    arrInvalidDir+=($appDir)
  else
    cd $appDir
    appCnt=$((appCnt+1))
    echo "<<< ("$appCnt")" $appDir " >>>"
    node /home/goun/Source/ilib-samples/lint-webos/node_modules/ilib-lint/src/index.js -c $CONFIG -i -f html-formatter -o /home/goun/Source/swp/lintResult-swp/$appDir-result.html -n $appDir
    cd ..
    echo "==========================================================================="
  fi
done

echo "---------------------------------------------------------------------------"
echo "[[ "Number of invalid Directory":" ${#arrInvalidDir[@]} " ]]"
for value in "${arrInvalidDir[@]}"
do
  echo "[" $value "] "
done

END_TIME=$(date +%s)
echo "[[ "Number of valid Directory":" $appCnt " ]]"
echo "<<< It took $(($END_TIME - $START_TIME)) seconds to check xliff files of all app ... >>>"
echo "---------------------------------- Done ----------------------------------"

#restore $IFS(Internal Field Separator)
IFS=$SAVEIFS
