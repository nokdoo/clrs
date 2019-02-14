#!/usr/bin/env perl

use strict;
use warnings;

my @arr = split ' ', <DATA>;

mergesort ( \@arr, 0, $#arr );

print "@arr\n";

sub mergesort
{
	my ( $a, $l, $r ) = @_;
	return if $l >= $r;

	my $m = int( ( $l+$r )/2);

	mergesort( $a, $l, $m );
	mergesort( $a, $m+1, $r );
	merge( $a, $l, $m, $r );
}

sub merge
{
	my ( $a, $l, $m, $r ) = @_;
	my @L = @$a[ $l..$m ];
	my @R = @$a[ $m+1..$r ];

	my $i;
	for ( $i = $l; @L && @R; $i++ )
	{
		$a->[ $i ] = ( $L[ 0 ] <= $R[ 0 ] ) ? shift @L : shift @R;
	}

	@$a[ $i..$r ] = ( @L, @R );
}

__DATA__
3 41 52 26 38 57 9 49
