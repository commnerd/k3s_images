SUBDIRS := $(wildcard */.)
.PHONY all push $(SUBDIRS)

all: $(SUBDIRS)
  $(MAKE) -C $@
