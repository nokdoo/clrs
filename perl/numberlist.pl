#!/usr/bin/env perl

use strict;
use warnings;

my @rand = map { 
		my $rand = int (rand(100));
		$rand *= -1 if int ( rand(10) ) % 7 == 0;
		$rand
	} reverse ( 1..25 ); 

print "@rand";
