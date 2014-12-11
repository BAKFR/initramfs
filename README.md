Initramfs
=========

This is my personal initramfs.

It uses *busybox* to execute the ``init`` shell script, and *cryptsetup* to
decrypt encrypted partitions.

This script first decrypts the ``luks.key`` file (not added to git), which is a
luks container with a very small ext4 partition in it.
This container asks for a password, and provides a key file.
Then, *cryptsetup* decrypts three real partitions and mounts the root one.
Finally, it cleans the environment and switch to the real root partition.

This method asks only one time for a password, and decrypts several partitions
on several disks.

Usage
-----

 just type `make install` and it will generate and install the initram image in `/boot`


You are free to copy it and to adapt it to your needs.
