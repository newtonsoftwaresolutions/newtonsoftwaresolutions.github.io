#!/usr/bin/perl
#

open(DAT,"test") || die("Cannot Open File");
flock(DAT, LOCK_NB);
#print DAT "$sitename\|$siteurl\|$description\n"; 
print DAT "test1";
close(DAT);