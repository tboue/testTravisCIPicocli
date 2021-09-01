call varSetup.bat

REM ============
REM pre-installs
REM ============

REM choco is needed for this script to work, add the install here if your Windows image doesn't ship it.

REM ====================
REM installs for GraalVM
REM ====================

REM graalvm
REM -------
		   
REM -- mandatory --

if not exist %graalInstallDir%NUL mkdir %graalInstallDir%


REM powershell Expand-Archive graalvm-ce-java8-windows-amd64-21.2.0.zip -DestinationPath %graalInstallDir%

if not exist  %graalInstallDir%%graalVMName% (
    if not exist %graalVMFullName%.zip ( 
        curl -# -L -O %graalURL%
    ) else (
        echo "GraalVM already downloaded"
    )
        powershell Expand-Archive %graalVMFullName%.zip -DestinationPath %graalInstallDir%
) else (
        echo "GraalVM already installed"
)

REM native-image
REM ------------

call gu.cmd install native-image

REM install upx

if not exist upx-3.96-win64 (
    if not exist upx-3.96-win64.zip.zip ( 
        curl -# -L -O https://github.com/upx/upx/releases/download/v3.96/upx-3.96-win64.zip
    ) else (
        echo "GraalVM already downloaded"
    )
        powershell Expand-Archive upx-3.96-win64.zip -DestinationPath picocliExampleProject
) else (
        echo "GraalVM already installed"
)


