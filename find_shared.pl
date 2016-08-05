#!/usr/bin/perl -w
############get the position informations##############
my @name;
my %gene;
my @file=glob("A*-specific.csv");
foreach(@file){
	open TO, "<","$_";
        while(<TO>){
        	chomp;
        	my @array=split(/,/,$_,2);
        	$gene{$array[0]}=$array[1];
	}
	close TO;
}

open FP,"specific_module_geneIDs_yellowgreen.csv";
while(<FP>){
	chomp;
	s/"//g;
	my @array=split(/,/);
	push @name,$array[1];
	}
close FP;

my $a;
open RE,">>shared_yellowgreen.csv";
foreach $a (keys %gene){
	if ($a ~~ @name){print RE "$a,$gene{$a}\n";}
	else{next;}
	}
close RE;