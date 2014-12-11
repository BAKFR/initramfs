

install: clean update_bin
	mount -l | grep /boot || mount /boot
	[ -f /boot/initramfs-$(shell uname -r).img ] && mv /boot/initramfs-$(shell uname -r).img /boot/initramfs-$(shell uname -r).img.old
	find . | cpio -H newc -o | gzip -9 > /boot/initramfs-$(shell uname -r).img

clean:
	rm -f $(shell find . -name '*~')

update_bin:
	cp $(shell which cryptsetup) ./bin/cryptsetup
	cp $(shell which busybox) ./bin/busybox

.PHONY: install clean update_bin
