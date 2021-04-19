# testTravisCIPicocli #

## Outline ##

The goal of this project is to propose a working [TRAVIS CI](https://travis-ci.com/) configuration that will compile a java project into a jar and a windows executable thought [graalVM](https://www.graalvm.org/docs/getting-started/) compilation. The command line interactions are created by using [picocli](https://picocli.info/).   

## How to use ##

If you want to use this project as example you will have some changes to make:

#### On the ant build ####

The ant build can be generated with eclipse, it has to build a .jar, for this example, in the 'executables' folder.  

#### On the folders paths ####

These changes are up to you and your project needs. You can check [the travis builds](https://travis-ci.com/github/tboue/testTravisCIPicocli), a `ls -R` is performed at the end so that you can see the folder structure.

#### On the secure API_token ####

The GitHub token for upload is a secure personal access token. To use this type of security you will need to generate a [personal access token in your GitHub settings](https://docs.github.com/en/github/authenticating-to-github/creating-a-personal-access-token). After that you will have to [encrypt it with the Travis CI tool](https://docs.travis-ci.com/user/encryption-keys/), in this example the variable name is GITHUB_SECURE_TOKEN, to encrypt your token for travis.com you will use the command :

	travis encrypt --pro GITHUB_SECURE_TOKEN="<your personal token>" 
	

## Known issues ##

Sometimes the line `source $HOME/.sdkman/bin/sdkman-init.sh` fail. Restarting the build on travis.com usually works.