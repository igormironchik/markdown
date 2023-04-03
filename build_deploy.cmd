echo "Installing aqt..."

pip install aqtinstall

mkdir Qt

echo "Installing Qt..."

aqt install-qt --outputdir Qt windows desktop 6.4.3 win64_msvc2019_64 -m qtimageformats qtwebchannel qtwebengine qtwebview qtpositioning

IF %ERRORLEVEL% NEQ 0 (
	exit /B %ERRORLEVEL%
)

set self_dir=%~dp0

echo "Building md-editor..."

set PATH=%PATH%;%self_dir%\3rdparty\Windows\ImageMagick

mkdir build-md-editor

cmake -DCMAKE_BUILD_TYPE=Release -S md-editor -B build-md-editor -DCMAKE_PREFIX_PATH=%self_dir%\Qt\6.4.3\msvc2019_64

IF %ERRORLEVEL% NEQ 0 (
	exit /B %ERRORLEVEL%
)

cmake --build build-md-editor --config Release

IF %ERRORLEVEL% NEQ 0 (
	exit /B %ERRORLEVEL%
)

echo "Building md-pdf..."

mkdir build-md-pdf

cmake -DCMAKE_BUILD_TYPE=Release -S md-pdf -B build-md-pdf -DBUILD_MDPDF_TESTS=OFF -DCMAKE_PREFIX_PATH=%self_dir%\Qt\6.4.3\msvc2019_64

IF %ERRORLEVEL% NEQ 0 (
	exit /B %ERRORLEVEL%
)

cmake --build build-md-pdf --config Release

IF %ERRORLEVEL% NEQ 0 (
	exit /B %ERRORLEVEL%
)

echo "Installing Qt Installer Framework..."

aqt install-tool --outputdir Qt linux desktop tools_ifw qt.tools.ifw.45

IF %ERRORLEVEL% NEQ 0 (
	exit /B %ERRORLEVEL%
)

echo "Copying binaries..."

rmdir /S /Q installer\packages\mironchik.igor.markdown\data\bin

rmdir /S /Q installer\packages\mironchik.igor.markdown\data\lib

rmdir /S /Q installer\packages\mironchik.igor.markdown\data\plugins

rmdir /S /Q installer\packages\mironchik.igor.markdown\data\libexec

rmdir /S /Q installer\packages\mironchik.igor.markdown\data\resources

rmdir /S /Q installer\packages\mironchik.igor.markdown\data\translations

mkdir installer\packages\mironchik.igor.markdown\data\bin

IF %ERRORLEVEL% NEQ 0 (
	exit /B %ERRORLEVEL%
)

mkdir installer\packages\mironchik.igor.markdown\data\lib

IF %ERRORLEVEL% NEQ 0 (
	exit /B %ERRORLEVEL%
)

mkdir installer\packages\mironchik.igor.markdown\data\plugins

IF %ERRORLEVEL% NEQ 0 (
	exit /B %ERRORLEVEL%
)

mkdir installer\packages\mironchik.igor.markdown\data\libexec

IF %ERRORLEVEL% NEQ 0 (
	exit /B %ERRORLEVEL%
)

mkdir installer\packages\mironchik.igor.markdown\data\resources

IF %ERRORLEVEL% NEQ 0 (
	exit /B %ERRORLEVEL%
)

mkdir installer\packages\mironchik.igor.markdown\data\translations

IF %ERRORLEVEL% NEQ 0 (
	exit /B %ERRORLEVEL%
)

copy /Y 3rdparty\Windows\ImageMagick\* installer\packages\mironchik.igor.markdown\data\bin

IF %ERRORLEVEL% NEQ 0 (
	exit /B %ERRORLEVEL%
)

rmdir /S /Q installer\packages\mironchik.igor.markdown\data\bin\images

IF %ERRORLEVEL% NEQ 0 (
	exit /B %ERRORLEVEL%
)

rmdir /S /Q installer\packages\mironchik.igor.markdown\data\bin\include

IF %ERRORLEVEL% NEQ 0 (
	exit /B %ERRORLEVEL%
)

rmdir /S /Q installer\packages\mironchik.igor.markdown\data\bin\lib

IF %ERRORLEVEL% NEQ 0 (
	exit /B %ERRORLEVEL%
)

del /Q installer\packages\mironchik.igor.markdown\data\bin\*.exe

IF %ERRORLEVEL% NEQ 0 (
	exit /B %ERRORLEVEL%
)

del /Q installer\packages\mironchik.igor.markdown\data\bin\*.txt

IF %ERRORLEVEL% NEQ 0 (
	exit /B %ERRORLEVEL%
)

del /Q installer\packages\mironchik.igor.markdown\data\bin\*.html

IF %ERRORLEVEL% NEQ 0 (
	exit /B %ERRORLEVEL%
)

del /Q installer\packages\mironchik.igor.markdown\data\bin\*.icc

IF %ERRORLEVEL% NEQ 0 (
	exit /B %ERRORLEVEL%
)

del /Q installer\packages\mironchik.igor.markdown\data\bin\*.ico

IF %ERRORLEVEL% NEQ 0 (
	exit /B %ERRORLEVEL%
)

del /Q installer\packages\mironchik.igor.markdown\data\bin\*.md

IF %ERRORLEVEL% NEQ 0 (
	exit /B %ERRORLEVEL%
)

del /Q installer\packages\mironchik.igor.markdown\data\bin\*.rdf

IF %ERRORLEVEL% NEQ 0 (
	exit /B %ERRORLEVEL%
)

copy /Y build-md-editor\bin\md-editor.exe installer\packages\mironchik.igor.markdown\data\bin\md-editor.exe

IF %ERRORLEVEL% NEQ 0 (
	exit /B %ERRORLEVEL%
)

copy /Y build-md-pdf\bin installer\packages\mironchik.igor.markdown\data

IF %ERRORLEVEL% NEQ 0 (
	exit /B %ERRORLEVEL%
)

copy /Y Qt\6.4.3\msvc2019_64\bin installer\packages\mironchik.igor.markdown\data

IF %ERRORLEVEL% NEQ 0 (
	exit /B %ERRORLEVEL%
)

copy /Y Qt\6.4.3\msvc2019_64\libexec\QtWebEngineProcess.exe installer\packages\mironchik.igor.markdown\data\libexec\QtWebEngineProcess.exe

IF %ERRORLEVEL% NEQ 0 (
	exit /B %ERRORLEVEL%
)

copy /Y Qt\6.4.3\msvc2019_64\plugins installer\packages\mironchik.igor.markdown\data

IF %ERRORLEVEL% NEQ 0 (
	exit /B %ERRORLEVEL%
)

copy /Y Qt\6.4.3\msvc2019_64\resources installer\packages\mironchik.igor.markdown\data

IF %ERRORLEVEL% NEQ 0 (
	exit /B %ERRORLEVEL%
)

copy /Y Qt\6.4.3\msvc2019_64\translations installer\packages\mironchik.igor.markdown\data

IF %ERRORLEVEL% NEQ 0 (
	exit /B %ERRORLEVEL%
)

copy /Y 3rdparty\Windows\VC_Redist\VC_redist.x64.exe installer\packages\mironchik.igor.markdown\bin\VC_redist.x64.exe

IF %ERRORLEVEL% NEQ 0 (
	exit /B %ERRORLEVEL%
)

rmdir /S /Q installer\packages\mironchik.igor.markdown\data\lib\cmake

IF %ERRORLEVEL% NEQ 0 (
	exit /B %ERRORLEVEL%
)

rmdir /S /Q installer\packages\mironchik.igor.markdown\data\lib\metatypes

IF %ERRORLEVEL% NEQ 0 (
	exit /B %ERRORLEVEL%
)

rmdir /S /Q installer\packages\mironchik.igor.markdown\data\lib\pkgconfig

IF %ERRORLEVEL% NEQ 0 (
	exit /B %ERRORLEVEL%
)

del /Q installer\packages\mironchik.igor.markdown\data\lib\*.prl

IF %ERRORLEVEL% NEQ 0 (
	exit /B %ERRORLEVEL%
)

echo "Creating installer..."

Qt\Tools\QtInstallerFramework\4.5\bin\binarycreator.exe -c installer\config\config.xml -p installer\packages Markdown_Windows_x64.Installer.exe

IF %ERRORLEVEL% NEQ 0 (
	exit /B %ERRORLEVEL%
)
