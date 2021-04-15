echo "test"

java -agentlib:native-image-agent=config-output-dir=META-INF/native-image -jar ./executables/primeDecomposition.jar
%HOME%/.sdkman/candidates/java/current/bin/native-image.cmd --verbose --static --no-fallback -H:+ReportExceptionStackTraces -jar ./executables/primeDecomposition.jar 
 