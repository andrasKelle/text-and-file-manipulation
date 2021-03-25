#!/bin/bash

list_files () {
	# list copied files in long format
	ls -l compressDir/
	echo
}

# copy files to directory
echo -e "\e[36mCopying files into directory...\e[39m"
mkdir compressDir
cp access.log compressDir/acces_copy_gzip.log
cp employees.json compressDir/employees_copy_bzip2.json
list_files



# compress files with two methods
echo -e "\e[36mCompress files with two methods(gzip/bzip2)\e[39m"
gzip compressDir/acces_copy_gzip.log
bzip2 compressDir/employees_copy_bzip2.json
list_files
# you can see here that the gzip compression works better (size of file is relatively much smaller)

# decompress files
gzip -d  compressDir/acces_copy_gzip.log.gz
bzip2 -d compressDir/employees_copy_bzip2.json.bz2



# compress files with gzip
echo -e "\e[36mCompress with gzip\e[39m"
gzip compressDir/acces_copy_gzip.log
gzip compressDir/employees_copy_bzip2.json
list_files

# decompress once again, using gzip's built in command
gunzip  compressDir/acces_copy_gzip.log.gz
gunzip compressDir/employees_copy_bzip2.json.gz




# compress all files in directory, recursively
echo -e "\e[36mCompress files in directory recurively\e[39m"
gzip -r compressDir/

list_files

# decompress files in dir
gunzip -r compressDir/
