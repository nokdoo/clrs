#!/usr/bin/env perl

use strict;
use warnings;

my @input = split ' ', <DATA>;
my $n = @input;
print "@input\n";

for ( my $j = 1; $j <= $n-1; $j++ )
{
	my $key = $input[$j];
	my $i = $j-1;
	while ( $i >= 0 && $input[$i] < $key ) # '>' for increasing, '<' for decreasing
	{
		$input[$i+1] = $input[$i];
		$i = $i-1;
	}
	$input[$i+1] = $key
}

print "@input\n";

__DATA__
31 41 59 26 41 58
