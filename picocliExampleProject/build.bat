echo "test"
cd executables
java -agentlib:native-image-agent=config-output-dir=META-INF/native-image -jar primeDecomposition.jar
native-image.cmd --verbose  --no-fallback -H:+ReportExceptionStackTraces -jar primeDecomposition.jar 
 