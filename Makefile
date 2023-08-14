PROGS = bee bgupload bigtile cal3 copytvoc ddg diptych efetchy \
        exifsort fastyt fetchy jfetchy lk minute mkjpg mkpng mkppm \
	mkthnail nullhttpd nums pbget pbset pfactor pic-sync pizza \
	pnminfo psp-preview showmem tvoc-parse voc1 \
	termux-file-editor termux-url-opener

TASKER = tvoc-parse
TASKERDIR = $(HOME)/.termux/tasker
DESTDIR = $(HOME)/bin

SUBFILE = basic-tools.subs
SUBTOOL = perl MKSUBS -c $(SUBFILE)

install: $(SUBFILE) installtasker
	for p in $(PROGS); do $(SUBTOOL) < $$p > $(DESTDIR)/$$p && chmod 755 $(DESTDIR)/$$p ; done

installtasker: $(TASKER)
	mkdir -p $(TASKERDIR)
	for p in $(TASKER); do ln -s $(DESTDIR)/$$p $(TASKERDIR)/$$p || : ; done
