package MaximumSubarray;

use strict;
use warnings;

sub brute_force
{
	my ( $arr, $low, $high ) = @_;
	my ( $max_low, $max_high );
	my $max = 0;

	for ( my $i = $low; $i <= $high; $i++ )
	{
		my $iter_sum = 0;
		for ( my $j = $i; $j <= $high; $j++ )
		{
			$iter_sum += $arr->[$j];
			if ( $max < $iter_sum )
			{
				$max_low = $i;
				$max_high = $j;
				$max = $iter_sum;
			}
		}
	}

	return ($max, $max_low, $max_high);
}

sub divide_conquer
{
	my ( $arr, $low, $high ) = @_;
	return ( $arr->[$low], $low, $high ) if $low == $high;
	
	my $mid = int( ($low+$high)/2 );
	
	my ( $left_max, $left_low, $left_high ) = divide_conquer ( $arr, $low, $mid );
	my ( $right_max, $right_low, $right_high ) = divide_conquer ( $arr, $mid+1, $high );
	my ( $cross_max, $cross_low, $cross_high ) = _cross_subarrays ( $arr, $low, $mid, $high );

	return ( $left_max, $left_low, $left_high ) if $left_max >= $right_max && $left_max >= $cross_max;
	return ( $right_max, $right_low, $right_high ) if $right_max >= $left_max && $right_max >= $cross_max;
	return ( $cross_max, $cross_low, $cross_high );
}

sub _cross_subarrays
{
	my ( $arr, $low, $mid, $high ) = @_;

	my ( $left_max, $right_max ) = ( -99999, -99999 );

	my $sum = 0;
	my $left_low = $mid;
	for ( my $i = $mid; $i >= $low; $i-- )
	{
		$sum += $arr->[$i];
		if ( $sum >= $left_max )
		{
			$left_max = $sum;
			$left_low = $i;
		}
	}

	$sum = 0;
	my $right_high = $mid+1;
	for ( my $i = $mid+1; $i <= $high; $i++ )
	{
		$sum += $arr->[$i];
		if ( $sum >= $right_max )
		{
			$right_max = $sum;
			$right_high = $i;
		}
	}

	my $cross_max = $left_max + $right_max;
	my $cross_low = $left_low;
	my $cross_high = $right_high;

	return ( $cross_max, $cross_low, $cross_high );
}

1;
