#!/usr/bin/perl
#

#open(DAT,"test") || die("Cannot Open File");
#flock(DAT, LOCK_NB);
#print DAT "$sitename\|$siteurl\|$description\n"; 
#print DAT "test1";
#close(DAT);

$usage='dstcheck.pl startsec endsec';
$date='02/04/2003 11:50';
$version='0.05';

die "Usage: $usage\n" if $#ARGV != 1 && $#ARGV != -1;
$startsec = $ARGV[0];
$startsec = 733_276_801 if $startsec eq "";
$endsec = $ARGV[1];
$endsec = 1_289_000_000 if $endsec eq "";

$diff = 9999;
print " Testing seconds from $startsec to $endsec...\n";
for ($t=$startsec; $t<=$endsec; $t+=3600) {
  ($sec1,$min1,$hour1,$mday1,$mon1,$year1) = localtime($t);
  ($sec2,$min2,$hour2,$mday2,$mon2,$year2) = gmtime($t);
  $diff2 = $hour1 - $hour2;
  $diff2 += 24 if $diff2 < 0;
  if ($diff != $diff2) {
    $diff = $diff2;
    $plus = ($diff >= 0) ? "+" : "";
    $st = sprintf ("%d/%02d/%02d %02d:%02d:%02d",
      $year1+1900, $mon1+1, $mday1, $hour1, $min1, $sec1);
    $st .= sprintf (" [%d/%02d/%02d %02d:%02d:%02d UTC]",
      $year2+1900, $mon2+1, $mday2, $hour2, $min2, $sec2);
    print "$st $plus$diff - Seconds: $t\n";
  }
}