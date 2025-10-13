# Bash basics
* To run a script called `script_name.sh` in the terminal, do : `./script_name.sh`
* Run `ls`. `..` always refers to the directory of which the current directory is a subdirectory 
* `cd` is the command to change directories. 
* To apply an opperation to a number of objects or files without manually iterating, you can use loops. For-loops are the most safe type of loop to use. Here is an example:
```sh
# all of these loops achieve the same end result! 

# Ex. 1
for FILE in ./*.fastq; do 
    /root/FastQC/fastqc ${FILE}
done

# Ex. 2 
for FILE in $(ls); do 
    /root/FastQC/fastqc ${FILE}
done

# Ex. 3 
while read FILE; do
    /root/FastQC/fastqc ${FILE}
done < <(ls)

# Ex. 4 
ls > list_file.txt
while read FILE; do
        /root/FastQC/fastqc ${FILE}
done < list_file.txt
```

# Docker basics 
* To build images for the CHTC, you must build them with the appropriate architecture. To do that, you must use, `docker buildx`. This is an example:
```sh
docker buildx build --platform linux/amd64,linux/arm64 -t multimuscaria/fastqtk:3.0 --push ./
```
* To test run your image under the conditions of the CHTC:
```sh
docker run --rm -it -v $(pwd):$(pwd) -w $(pwd) -u $(id -u):$(id -g) multimuscaria/fastqtk:3.0 /bin/bash
```