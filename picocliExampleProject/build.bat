echo "test"
cd executables
java -agentlib:native-image-agent=config-output-dir=META-INF/native-image -jar primeDecomposition.jar
ls -R
java -jar primeDecomposition.jar 4543543543

call "C:\Program Files (x86)\Microsoft Visual Studio\2017\BuildTools\VC\Auxiliary\Build\vcvars64.bat"

native-image.cmd --verbose --static --no-fallback -H:+ReportExceptionStackTraces -jar primeDecomposition.jar 

sha256sum primeDecomposition.jar > sha256sumJar.txt
sha256sum primeDecomposition.exe > sha256sumExe.txt