#!/usr/bin/perl -w
############get the position informations##############
my @name;
my @gene;
my @file=glob("*shared_R_diff.csv");
foreach(@file){
	open TO, "<","$_";
        while(<TO>){
        	chomp;
        	my @array=split(/\t/);
        	push @gene,$array[0];
	}
	close TO;
}

open FP,"shared.csv";
while(<FP>){
	chomp;
	my @array=split(/,/,$_,2);
	push @name,$array[0];
	}
close FP;

my $a;
open RE,">>shared_R_diff-1.csv";
foreach $a (@gene){
	if ($a ~~ @name){print RE "$a\n";}
	else{next;}
	}
close RE;