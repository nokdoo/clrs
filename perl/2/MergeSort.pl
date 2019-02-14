#!/usr/bin/env perl

use strict;
use warnings;
use lib './';
use MergeSort qw ( mergesort );

my @arr = split ' ', <DATA>;

mergesort ( \@arr, 0, $#arr );

print "@arr\n";

__DATA__
3 41 52 26 38 57 9 49
