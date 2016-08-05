#!/usr/bin/perl
use strict;
use warnings;
my %hash;
open GENE,"gene_merged_clust.map";
while(<GENE>){
	chomp;
	my @array=split(/\t/);
	$hash{$array[1]}=$array[0];
}
close GENE;

my(%tran,$a);
my @file=glob("key-genes-*-l.txt");
foreach(@file){
	open TO,"<","$_";
	open GE,">>gene.$_";
	while(<TO>){
		chomp;
		print GE "$_\t$hash{$_}\n";
		
	}
close TO;
close GE;
}


