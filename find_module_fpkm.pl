#!/usr/bin/perl
use strict;
use warnings;

open NA,"q.txt";
my @name;
while(<NA>){
	chomp;
	s/"//g;
	my @array=split(/,/);
	push @name,$array[0];
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
open RE,">>qPCR.csv";
foreach $a (@name){
	print RE "$a,$hash{$a}\n";
	}
close RE;

