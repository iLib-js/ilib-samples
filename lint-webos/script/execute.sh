#!/bin/bash

: <<'END'
DIR = /home/goun/Source/swp/localization-data
CONFIG = /home/goun/Source/swp/lintScript/ilib-lint-config.json
./execute.sh ~/Source/swp/localization-data/ ~/Source/swp/lintScript/ilib-lint-config.json 
END

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
  elif [ "$appDir" == "./vid" ]; then
    arrInvalidDir+=($appDir)
  elif [ "$appDir" == "./Enact" ]; then
    arrInvalidDir+=($appDir)
  elif [ "$appDir" == "Framework" ]; then
    arrInvalidDir+=($appDir)
  elif [ "$appDir" == "./chromecast" ]; then
    arrInvalidDir+=($appDir)
  elif [ "$appDir" == "built-in" ]; then
    arrInvalidDir+=($appDir)
  else
    cd $appDir
    appCnt=$((appCnt+1))
    echo "<<< ("$appCnt")" $appDir " >>>"
    node ~/Source/ilib-lint/src/index.js -c $CONFIG -i
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

echo "<<< It took $(($END_TIME - $START_TIME)) seconds to check xliff files of all app ... >>>"
echo "---------------------------------- Done ----------------------------------"