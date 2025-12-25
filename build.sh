#

git config --global url."https://github.com/".insteadOf "git@github.com:"
git config --global url."https://github.com/".insteadOf "ssh://git@github.com/"

git clone --depth 1 --recursive --shallow-submodules https://github.com/OpenEmu/OpenEmu

cd OpenEmu
build_dir=$(pwd)

cd OpenEmu-SDK
git checkout master
git pull origin master

cd $build_dir
git apply ../1.patch
xcodebuild -workspace "OpenEmu.xcworkspace" -scheme "OpenEmu (Experimental)" -configuration Release -sdk macosx -arch x86_64 -derivedDataPath DerivedData
