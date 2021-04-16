echo "test"
cd executables
mkdir META-INF/native-image
ls -R
java -agentlib:native-image-agent=config-output-dir=META-INF/native-image -jar primeDecomposition.jar
ls -R
java -jar primeDecomposition.jar 4543543543
native-image.cmd --verbose --static --no-fallback -H:+ReportExceptionStackTraces -jar primeDecomposition.jar 
echo "ended"