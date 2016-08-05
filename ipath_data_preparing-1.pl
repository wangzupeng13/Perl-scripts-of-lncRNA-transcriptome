#!/usr/bin/perl
use strict;
use warnings;
my (%hash,%ha);
open ANN,"mRNA.trans.anno";
while(<ANN>){
	chomp;
	my @array=split(/\t/);
	#$array[10]=~s/UniRef90_/UNIPROT:/;
	$hash{$array[0]}=$array[28];
}
close ANN;

open AN,"fpkm_3.csv";
while(<AN>){
	chomp;
	my @array=split(/,/,$_,2);
	$ha{$array[0]}=$array[1];
}
close AN;

open DE,"specific_module_geneIDs_green.csv.ann.diff";
my @name;
while(<DE>){
	chomp;
	my @array=split(/\t/);
	push @name,$array[0];
}
close DE;

open A,">>Vanted-green.csv";
my $a;
foreach $a (@name) {
	print A "$hash{$a},RNA-seq,fpkm,$ha{$a}\n";
}
close A;

