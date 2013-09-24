#!/usr/bin/perl
 
use URI::Escape;
 
#my $string = "Hello world!";
my $encode = uri_escape("$ARGV[0] $ARGV[1] $ARGV[2]");
print $encode;
