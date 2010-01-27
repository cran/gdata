
set TARGET=Compress-Raw-Zlib-2.024
set SHELL=

echo ** Bulding Perl library %TARGET% ..
cd %TARGET%
perl Makefile.PL PREFIX=../../inst/perl LIB=../../inst/perl 
dmake
dmake install

echo ** Replace Unix symlinks with copies ..
cd ../../inst/perl
del xls2tab.pl.lnk xls2tsv.pl.lnk sheetNames.pl.lnk
copy xls2csv.pl xls2tab.pl
copy xls2csv.pl xls2tsv.pl
copy sheetCount.pl sheetNames.pl

