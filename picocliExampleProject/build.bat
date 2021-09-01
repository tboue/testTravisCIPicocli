rem shell
rem
rem Copyright 2021 MicroEJ Corp. All rights reserved.
rem This library is provided in source code for use, modification and test, subject to license terms.
rem Any modification of the source code will break MicroEJ Corp. warranties on the whole library.

call varSetup.bat

echo "graal build started"
cd target~
cd executables
mkdir META-INF\native-image

java -agentlib:native-image-agent=config-merge-dir=META-INF/native-image -jar primeDecomposition.jar --help

type .\META-INF\native-image\resource-config.json

java -agentlib:native-image-agent=config-merge-dir=META-INF/native-image -jar primeDecomposition.jar --version

type .\META-INF\native-image\resource-config.json

SET buffpath=%PATH%

setx /M PATH %graalInstallDir%%graalVMName%\bin\

echo %PATH%

call RefreshEnv.cmd

echo %PATH%

call "C:\Program Files (x86)\Microsoft Visual Studio\2019\Enterprise\VC\Auxiliary\Build\vcvars64.bat"

native-image.cmd --verbose --initialize-at-build-time --enable-url-protocols=http,https --static --no-fallback -H:+ReportExceptionStackTraces -jar primeDecomposition.jar

echo "graal build ended"

.\upx-3.96-win64\upx-3.96-win64.exe .\primeDecomposition.exe

echo "upx compression ended"

setx /M "PATH=%graalInstallDir%%graalVMName%\bin\;%buffpath%"

call RefreshEnv.cmd
