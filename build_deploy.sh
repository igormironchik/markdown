echo "Installing aqt..."

pip install aqtinstall

mkdir Qt

echo "Installing Qt..."

aqt install-qt --outputdir ./Qt linux desktop 6.5.0 gcc_64 -m qtimageformats qtwebchannel qtwebengine qtwebview qtpositioning || exit 1

self_dir=`echo "$(cd "$(dirname ".")" && pwd)"`

echo "Building md-editor..."

mkdir build-md-editor

cmake -DCMAKE_BUILD_TYPE=Release -S md-editor -B build-md-editor -DCMAKE_PREFIX_PATH=${self_dir}/Qt/6.5.0/gcc_64 || exit 1

cmake --build build-md-editor --config Release || exit 1

echo "Building md-pdf..."

mkdir build-md-pdf

cmake -DCMAKE_BUILD_TYPE=Release -S md-pdf -B build-md-pdf -DBUILD_MDPDF_TESTS=OFF -DCMAKE_PREFIX_PATH=${self_dir}/Qt/6.5.0/gcc_64 || exit 1

cmake --build build-md-pdf --config Release || exit 1

echo "Installing Qt Installer Framework..."

aqt install-tool --outputdir ./Qt linux desktop tools_ifw qt.tools.ifw.45 || exit 1

echo "Copying binaries..."

rm -rf ./installer/packages/mironchik.igor.markdown/data/bin

rm -rf ./installer/packages/mironchik.igor.markdown/data/lib

rm -rf ./installer/packages/mironchik.igor.markdown/data/plugins

rm -rf ./installer/packages/mironchik.igor.markdown/data/libexec

rm -rf ./installer/packages/mironchik.igor.markdown/data/resources

rm -rf ./installer/packages/mironchik.igor.markdown/data/translations

mkdir ./installer/packages/mironchik.igor.markdown/data/bin || exit 1

mkdir ./installer/packages/mironchik.igor.markdown/data/lib || exit 1

mkdir ./installer/packages/mironchik.igor.markdown/data/plugins || exit 1

mkdir ./installer/packages/mironchik.igor.markdown/data/libexec || exit 1

mkdir ./installer/packages/mironchik.igor.markdown/data/resources || exit 1

mkdir ./installer/packages/mironchik.igor.markdown/data/translations || exit 1

cp ./build-md-editor/bin/md-editor ./installer/packages/mironchik.igor.markdown/data/bin/md-editor || exit 1

cp -r ./build-md-pdf/bin ./installer/packages/mironchik.igor.markdown/data || exit 1

cp -r ./build-md-pdf/lib ./installer/packages/mironchik.igor.markdown/data || exit 1

rm -f ./installer/packages/mironchik.igor.markdown/data/lib/*.a || exit 1

cp -r ./Qt/6.5.0/gcc_64/lib ./installer/packages/mironchik.igor.markdown/data || exit 1

cp ./Qt/6.5.0/gcc_64/libexec/QtWebEngineProcess ./installer/packages/mironchik.igor.markdown/data/libexec/QtWebEngineProcess || exit 1

cp -r ./Qt/6.5.0/gcc_64/plugins ./installer/packages/mironchik.igor.markdown/data || exit 1

cp -r ./Qt/6.5.0/gcc_64/resources ./installer/packages/mironchik.igor.markdown/data || exit 1

cp -r ./Qt/6.5.0/gcc_64/translations ./installer/packages/mironchik.igor.markdown/data || exit 1

rm -rf ./installer/packages/mironchik.igor.markdown/data/lib/cmake || exit 1

rm -rf ./installer/packages/mironchik.igor.markdown/data/lib/metatypes || exit 1

rm -rf ./installer/packages/mironchik.igor.markdown/data/lib/pkgconfig || exit 1

rm -rf ./installer/packages/mironchik.igor.markdown/data/lib/*.prl || exit 1

echo "Creating installer..."

./Qt/Tools/QtInstallerFramework/4.5/bin/binarycreator -c ./installer/config/config.xml -p ./installer/packages Markdown_Linux_x64.Installer || exit 1
