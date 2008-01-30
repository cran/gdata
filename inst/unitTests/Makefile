TOP=../..
PKG=${shell cd ${TOP};pwd}
SUITE=doRUnit.R
R=${R_HOME}/bin/R

all: inst test

inst: # Install package
	cd ${TOP}/..;\
	${R} CMD INSTALL ${PKG}

test: # Run unit tests
	export RCMDCHECK=FALSE;\
	cd ${TOP}/tests;\
	${R} --vanilla --slave < ${SUITE}

echo: # Echo env. variables
	@echo "Package folder: ${PKG}"
	@echo "R binary: ${R}"

help: # Help
	@echo -e '\nTarget: Dependency # Description'; \
	echo '=================================================='; \
	egrep '^[[:alnum:].+_()%]*:' ./Makefile
