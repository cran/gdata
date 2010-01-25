TARGET=Compress-Raw-Zlib-2.024

default:
	tar xzf ${TARGET}.tar.gz
	cd ${TARGET} ; \
	perl Makefile.PL PREFIX=${PWD}/../inst/perl LIB=${PWD}/../inst/perl ; \
	make; \
	make install
	#
	make clean

clean:
	rm -rf ${TARGET}
	rm -rf ../inst/perl/share

distclean:
	rm -rf ../inst/perl/darwin-2level
