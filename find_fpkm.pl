#!/usr/bin/perl
use strict;
use warnings;
my %hash;
open FP,"fpkm_3.csv";
while(<FP>){
	chomp;
	my @array=split(/,/,$_,2);
	$hash{$array[0]}=$array[1];
	}
close FP;
my @file1=glob("specific-transcripts-id*.csv");
foreach(@file1){
	open R, "<","$_";
	open O1,">>fpkm-$_";
        while(<R>){
        	chomp;
        	s/"//g;
        	my @array=split(/,/);
        	print O1 "$array[1],$hash{$array[1]}\n";
	}
	close O1;
	close R;
}