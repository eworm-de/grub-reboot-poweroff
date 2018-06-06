# Makefile for grub-reboot-poweroff

VERSION=0.1.0

all:
	@echo "Just run make install..."

.PHONY: install
install:
	install -D -m0755 90_reboot $(DESTDIR)/etc/grub.d/90_reboot
	install -D -m0755 91_poweroff $(DESTDIR)/etc/grub.d/91_poweroff

release:
	git archive --format=tar.xz --prefix=grub-reboot-poweroff-$(VERSION)/ $(VERSION) > grub-reboot-poweroff-$(VERSION).tar.xz
	gpg -ab grub-reboot-poweroff-$(VERSION).tar.xz
	git notes --ref=refs/notes/signatures/tar add -C $$(git archive --format=tar --prefix=grub-reboot-poweroff-$(VERSION)/ $(VERSION) | gpg --armor --detach-sign | git hash-object -w --stdin) $(VERSION)