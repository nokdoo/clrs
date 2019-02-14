#!/usr/bin/env perl

use strict;
use warnings;
use Exporter qw ( import );
our @EXPORT_OK = qw ( mergesort );

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

1;
