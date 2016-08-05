#!/usr/bin/perl -w
my @name;
open NA,"geneModuleMembership[moduleGenes-grrenyellow.csv";
while(<NA>) {
	chomp;
	s/"//g;
	my @array=split(/,/);
	if($array[2]>=0.9){
	   push @name,$array[1];}
	else{next;}
	}
close NA;	

my %hash;
open FP,"fpkm_3.csv";
while(<FP>){
	chomp;
	my @array=split(/,/,$_,2);
	$hash{$array[0]}=$array[1];
	}
close FP;

my $a;
open P,">>fpkm_greenyellow.csv";
foreach $a (@name){
	if(exists $hash{$a}){
		print P "$a,$hash{$a}\n";}
	else{next;}
		} 
close P;