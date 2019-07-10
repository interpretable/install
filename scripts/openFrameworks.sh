#!/bin/sh


# Get Current Path
currentPath="$PWD"

echo "-----------------------------------UPDATING APT"
# update packages
sudo apt-get update 
sudo apt install cmake
sudo apt install curl
echo "-----------------------------------CREATING FOLDERS"
cd $HOME/Documents
# create folder for the project
mkdir interprettable
cd interprettable
echo "-----------------------------------DOWNLOADING OF"
# download openframeworks
curl https://openframeworks.cc/ci_server/versions/nightly/of_v20190324_linux64gcc6_nightly.tar.gz --insecure -O
tar -xvzf of_v20190324_linux64gcc6_nightly.tar.gz
mv ./of_v20190324_linux64gcc6_release ./openFrameworks
rm of_v20190324_linux64gcc6_nightly.tar.gz
echo "-----------------------------------INSTALL OF DEPENDENCIES"
# install dependencies
cd openFrameworks/scripts/linux/ubuntu
sudo ./install_dependencies.sh
sudo ./install_codecs.sh
sudo apt-get install gstreamer1.0-plugins-bad
echo "-----------------------------------COMPILE OF"
#compile OF 
cd ..
sh ./compileOF.sh

# at this point we should have OF compiled properly
# we remove addons and add base addons 
echo "-----------------------------------INSTALL ADDONS"
cd ../../
rm -rf addons
git clone https://github.com/interpretable/InterprettableAddons addons

# adding feature detector
cd addons
git clone https://github.com/martial/ofxFeatureDetector
echo "-----------------------------------INSTALL PROJECT"
# let's clone the main repo<
cd ../apps
git clone https://github.com/interpretable/InterprettableApp.git


cp $currentPath/scripts/build-opencv.sh $HOME/Documents/interprettable/


sh ./$HOME/Documents/interprettable/build-opencv.sh

cd $HOME/Documents/interprettable/openFrameworks/apps/InterprettableApp/Interprettable/

make clean

make -j4

make RunRelease