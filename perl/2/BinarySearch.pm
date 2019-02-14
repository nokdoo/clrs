package BinarySearch;

use strict;
use warnings;
use Exporter qw(import);
our @EXPORT_OK = qw(binarysearch);

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

1;
