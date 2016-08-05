#!/usr/bin/perl
use strict;
use warnings;
open ED,"CytoscapeInput-edges-m-blue.txt";
open E,">>CytoscapeInput-edges-m-blue-Achn197311_TCONS_00133047.txt";
my $a="Achn197311_TCONS_00133047";
while(<ED>){
	chomp;
	my @array=split(/\t/);
	if($array[0] eq $a || $array[1] eq $a){
		if($array[2]>=0.2){print E "$_\n";}
		else{next;}
		}
	else{next;}
	}
close ED;
close E;