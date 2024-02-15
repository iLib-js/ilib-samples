#!/bin/sh

START_TIME=$(date +%s)
cat appList.txt | while read app
#cat appListSimple.txt | while read app
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

echo "It took $(($END_TIME - $START_TIME)) seconds to run the tool..."
echo "----------------- Done -- --------------- "