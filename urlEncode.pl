#!/usr/bin/perl
 
use URI::Escape;
 
#my $string = "Hello world!";
my $encode = uri_escape($ARGV[0]);
print "URL Encoded string: $encode\n";
