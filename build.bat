call "C:\Program Files (x86)\Microsoft Visual Studio\2017\BuildTools\VC\Auxiliary\Build\vcvarsall.bat"
echo "test"
java -agentlib:native-image-agent=config-output-dir=META-INF/native-image -jar primeDecomposition.jar
%HOME%/.sdkman/candidates/java/current/bin/native-image.cmd --verbose --static --no-fallback -H:+ReportExceptionStackTraces -jar primeDecomposition.jar 
