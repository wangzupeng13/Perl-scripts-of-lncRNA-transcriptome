#!/usr/bin/perl
use strict;
use warnings;
my @name;
my %hash;
open LNC,"specific-transcripts-iddarkgrey.csv";
while(<LNC>){
	chomp;
	s/"//g;
	my @array=split(/,/);
	if($array[1]=~/^TCONS/){push @name,$array[1];}
	else{next;}
	$hash{$array[0]}=$array[1];
	}
close LNC;

foreach my $a (@name){
	open ED,"CytoscapeInput-edges-m-darkgrey.txt";
	open E,">>edges-darkgrey-$a.txt";
	while(<ED>){
		chomp;
		my @array=split(/\t/);
		if($array[0] eq $a || $array[1] eq $a){
			print E "$_\n";
			}
		else{next;}
		}
	close ED;
	close E;
	}