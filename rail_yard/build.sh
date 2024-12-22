#!/bin/bash
flutter build web --base-href "/pages/rail_yard/"
echo "Removing current web build"
rm -rf ~/Documents/jakee417.github.io/pages/rail_yard/
echo "Copying new web build"
cp -r build/web/ ~/Documents/jakee417.github.io/pages/rail_yard/