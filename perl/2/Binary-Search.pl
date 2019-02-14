#!/usr/bin/env perl

use strict;
use warnings;

my @arr = split ' ', <DATA>;

print binarysearch( \@arr, 1 )."\n";
print binarysearch( \@arr, 3 )."\n";
print binarysearch( \@arr, 9 )."\n";

sub binarysearch
{
	my ( $a, $v ) = @_;
	my ( $l, $r ) = ( 0, $#$a );
	
	while( $l <= $r )
	{
		my $m = int( ($l + $r)/2 );

		$l = $m+1, next if $a->[$m] < $v;
		
		$r = $m-1, next if $a->[$m] > $v;

		return $m;
	}
	return -1;
}

__DATA__
1 2 4 5 6 7 8 9 10 11
