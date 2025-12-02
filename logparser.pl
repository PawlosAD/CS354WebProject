#!/usr/bin/perl
use strict;
use warnings;

print "Script is running...\n";

# Check arguments
if (@ARGV != 1) {
    die "Usage: perl log_parser.pl <logfile>\n";
}

my $file = $ARGV[0];

open(my $fh, '<', $file) or die "Cannot open $file: $!";

my %counts = (
    INFO  => 0,
    WARN  => 0,
    ERROR => 0,
);

while (my $line = <$fh>) {
    chomp $line;
    $line =~ s/\r$//;     
    $line =~ s/^\s+|\s+$//g;  

    if ($line =~ /INFO/i)  { $counts{INFO}++; }
    if ($line =~ /WARN/i)  { $counts{WARN}++; }
    if ($line =~ /ERROR/i) { $counts{ERROR}++; }
}

close($fh);

print "===== Log Summary =====\n";
print "INFO messages : $counts{INFO}\n";
print "WARN messages : $counts{WARN}\n";
print "ERROR messages: $counts{ERROR}\n";
print "=======================\n";
