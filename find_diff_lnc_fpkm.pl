#!/usr/bin/perl -w
my %hash;
open FP,"fpkm_3.csv";
while(<FP>){
	chomp;
	s/\t/,/g;
	my @array=split(/,/,$_,2);
	$hash{$array[0]}=$array[1];
	}
close FP;

my @file=glob("CytoscapeInput-nodes-m-green-M.txt");
foreach(@file){
	open TO, "<","$_";
        open O2,">>$_.fpkm.txt";
        while(<TO>){
        	chomp;
        	s/"//g;
        	my @array=split(/\t/);
        	$hash{$array[0]}=~s/,/\t/g;
        	print O2 "$array[0]\t$hash{$array[0]}\n";
        	}	
        close O2;
	close TO;
	}

