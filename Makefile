TOPTARGETS := all push clean
SUBDIRS := $(wildcard */.)
.PHONY: $(TOPTARGETS) $(SUBDIRS)

$(TOPTARGETS): $(SUBDIRS)
$(SUBDIRS):
		$(MAKE) -C $@ $(MAKECMDGOALS)
