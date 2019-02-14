#!/use/bin/env perl

use strict;
use warnings;
use lib './';
use BinarySearch qw ( binarysearch );

my @arr = split ' ', <DATA>;

print binarysearch( \@arr, 1 )."\n";
print binarysearch( \@arr, 3 )."\n";
print binarysearch( \@arr, 9 )."\n";

__DATA__
1 2 4 5 6 7 8 9 10 11
