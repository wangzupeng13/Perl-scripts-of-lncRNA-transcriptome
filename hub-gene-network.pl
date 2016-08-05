#!/usr/bin/perl
use strict;
use warnings;
my @name;
my %hash;
open LNC,"hub-gene-green";
while(<LNC>){
	chomp;
	my @array=split(/\t/);
	push @name,$array[0];
	$hash{$array[0]}=$array[1];
	}
close LNC;

open ED,"CytoscapeInput-edges-m-green.txt";
foreach my $a (@name){
	open ED,"CytoscapeInput-edges-m-green.txt";
	open E,">>$a-green.txt";
	while(<ED>){
		chomp;
		my @array=split(/\t/);
		if($array[0] eq $a && $array[2]>0.2){print E "$array[1]\n";}
		elsif($array[1] eq $a && $array[2]>0.2){print E "$array[0]\n";}
		else{next;}
		}
	close ED;
	close E;
	}