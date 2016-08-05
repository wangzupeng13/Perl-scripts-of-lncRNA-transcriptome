#!/usr/bin/perl
use strict;
use warnings;

open NA,"specific_module_geneIDs_greenyellow.csv";
my @name;
while(<NA>){
	chomp;
	s/"//g;
	my @array=split(/,/);
	push @name,$array[1];
	}
close NA;

my %hash;
open P,"MMPvalue-greenyellow.csv";
while(<P>){
	chomp;
	s/"//g;
	my @array=split(/,/);
	$hash{$array[0]}=$array[1];
	}
close P;

my $a;
open PV,">>pvalue.csv";
foreach $a (@name) {
	if (exists $hash{$a}) {print PV "$a,$hash{$a}\n";
	}
	else{next;}
}
close PV;