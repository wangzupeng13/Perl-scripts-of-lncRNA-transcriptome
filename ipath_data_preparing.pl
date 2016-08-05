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

open DE,"specific_module_geneIDs_yellow.csv.ann.diff";
while(<DE>){
	chomp;
	my @array=split(/\t/);
        $ha{$array[0]}="#ff0000";
}
close DE;

open A,">>yellow-diff.ipath";
my $a;
foreach $a (keys %ha) {
	if(exists $hash{$a}){
		print A "$hash{$a}\t$ha{$a}\n";}
	else{next;}
}
close A;

