#!/usr/bin/env perl

use strict;
use warnings;
use lib './';
use MergeSort qw ( mergesort );
use BinarySearch qw ( binarysearch );

my @arr = split ' ', <DATA>;

# 1134 = 345 + 789;
print "exists\n" if determine ( \@arr, 1134 );
print "not exists\n" unless determine ( \@arr, 1135 );

sub determine
{
	my ( $a, $x ) = @_;
	mergesort ( $a, 0, $#$a );

	for ( my $i = 0; $i <= $#$a; $i++ )
	{
		my $first = $a->[$i];
		my $second = $x - $first;
		return 1 if binarysearch( $a, $second ) != -1;
	}
	return ;
}


__DATA__
23 56 68 2534 486 124 468 3456 5467 789 345 132 678 284 5790 213 5 4357 247
