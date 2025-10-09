# Bash basics
* To run a script called `script_name.sh` in the terminal, do : `./script_name.sh`
* Run `ls`. `..` always refers to the directory of which the current directory is a subdirectory 
* `cd` is the command to change directories. 
# Docker basics 
* To build images for the CHTC, you must build them with the appropriate architecture. To do that, you must use, `docker buildx`. This is an example:
```sh
docker buildx build --platform linux/amd64,linux/arm64 -t multimuscaria/fastqtk:3.0 --push ./
```
* To test run your image under the conditions of the CHTC:
```sh
docker run --rm -it -v $(pwd):$(pwd) -w $(pwd) -u $(id -u):$(id -g) multimuscaria/fastqtk:3.0 /bin/bash
```