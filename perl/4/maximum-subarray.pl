#!/usr/bin/env perl

use strict;
use warnings;
use lib './';
use MaximumSubarray;

# initialization part
my @price = map { 0 + $_ } split ' ', <DATA>;
my @change;
for(my $i = 1; $i<=$#price; $i++) {	$change[$i-1] = 0 + $price[$i] - $price[$i-1] }
my ( $max, $max_low, $max_high );

print "@change\n";

# function invocation part
( $max, $max_low, $max_high ) = MaximumSubarray::brute_force ( \@change, 0, $#change );

# answer part
print "( $max, $max_low, $max_high ) \n";

# function invocation part
( $max, $max_low, $max_high ) = MaximumSubarray::divide_conquer ( \@change, 0, $#change );

# answer part
print "( $max, $max_low, $max_high ) \n";

# negative infinite number is -99999
__DATA__
100 113 110 85 102 86 63 81 101 94 106 101 79 94 90 97
