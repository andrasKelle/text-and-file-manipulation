#!/bin/bash

# Makes a directory and copies access.log and employees.json into it

save_into_directory () {

	mkdir archive_compress
	cp access.log archive_compress/
	cp employees.json archive_compress/

}

create_tar_file_from_directory () {
	echo -e "\e[36mcreate_tar_file_from_directory\e[39m"
	echo "$ tar -cf archive.tar archive_compress/"
	tar -cf archive.tar archive_compress/
	ls -lh archive_compress/
	ls -lh | grep archive.tar
	rm archive.tar
	echo
}

create_tar_gz_from_directory () {
	echo -e "\e[36mcreate_tar_gz_from_directory\e[39m"
        echo "$ tar czf compressed.tar.gz archive_compress/"
	tar czf compressed.tar.gz archive_compress/
	ls -lh archive_compress/
	ls -lh | grep compressed.tar.gz
	rm compressed.tar.gz

}

clean_up () {
	rm -r archive_compress/
}

save_into_directory
create_tar_file_from_directory
create_tar_gz_from_directory

clean_up
