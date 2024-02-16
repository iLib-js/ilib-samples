#!/bin/bash

START_TIME=$(date +%s)

#DIR = /home/goun/Source/swp/localization-data
DIR=$1
cd $DIR
echo $PWD
appCnt=0
invalidCnt=0
for appDir in `find . -type d`
do
  if [ "$appDir" == "." ]; then
    invalidCnt=$((invalidCnt+1))
    echo $appDir " Invalid Directory"
  elif [ "$appDir" == "./vid" ]; then
    invalidCnt=$((invalidCnt+1))
    echo $appDir " Invalid Directory"
  elif [ "$appDir" == "./Enact" ]; then
    invalidCnt=$((invalidCnt+1))
    echo $appDir " Invalid Directory"
  elif [ "$appDir" == "./chromecast" ]; then
    invalidCnt=$((invalidCnt+1))
    echo $appDir " Invalid Directory"
  elif [ "$appDir" == "./git" ]; then
        invalidCnt=$((invalidCnt+1))
    echo $appDir " Invalid Directory"
  elif [ "$appDir" == "Framework" ]; then
    invalidCnt=$((invalidCnt+1))
    echo $appDir " Invalid Directory"
  else
    cd $appDir
    appCnt=$((appCnt+1))
    echo "<<< ("$appCnt")" $appDir " >>>"
    node ~/Source/ilib-lint/src/index.js -c /home/goun/Source/swp/lintScript/ilib-lint-config.json -i
    cd ..
    echo "===========================================================================\n\n"
  fi
done
echo "<<< ("invalidCnt")" $invalidCnt " >>>"
echo "It took $(($END_TIME - $START_TIME)) seconds to check xliff files of all app ..."
echo "----------------- Done -- --------------- "

:<<'END'
cat appList.txt | while read app
do
    echo "$app"
    cd ../localization-data
    if [ -d "$app" ]; then
      cd $app
      node ~/Source/ilib-lint/src/index.js -c ../../lintScript/ilib-lint-config.json -i
      cd ..
      echo "===========================================================================\n\n"
    fi
done
END_TIME=$(date +%s)

echo "It took $(($END_TIME - $START_TIME)) seconds to check xliff files of all app ..."
echo "----------------- Done -- --------------- "
END