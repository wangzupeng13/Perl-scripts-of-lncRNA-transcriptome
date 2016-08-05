#!/usr/bin/perl -w
my %ann;
open ANN,"mRNA.trans.anno";
while(<ANN>){
	chomp;
	my @array=split(/\t/);
	$array[10]=~s/UniRef90_//g;
	$ann{$array[0]}=$array[10];
	}
close ANN;

my @file=glob("specific*.csv");
foreach(@file){
	open TO, "<","$_";
        open O2,">>$_-un.csv";
        while(<TO>){
        	chomp;
        	s/"//g;
        	my @array=split(/,/);       	
        	if(exists $ann{$array[0]}){print O2 "$ann{$array[0]}\n"}
        	else{next;}      	
        	}
        close O2;
	close TO;
	}