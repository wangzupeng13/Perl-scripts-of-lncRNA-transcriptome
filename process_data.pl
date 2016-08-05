#!/usr/bin/perl -w
my %ann;
my %ann1;
my %ann2;
open ANN,"mRNA.trans.anno";
while(<ANN>){
	chomp;
	my @array=split(/\t/);
	$ann{$array[0]}=$array[16];
	$ann1{$array[0]}=$array[28];
	$ann2{$array[0]}=$array[29];	
	}
close ANN;

my %hash;
my @file=glob("specific*.csv");
foreach(@file){
	open TO, "<","$_";
        open O2,">>$_.ann";
        while(<TO>){
        	chomp;
        	s/"//g;
        	my @array=split(/,/);       	
        	if(exists $ann{$array[1]}){print O2 "$array[1]\t$ann{$array[1]}\t$ann1{$array[1]}\t$ann2{$array[1]}\n"}
        	else{next;}      	
        	}
        close O2;
	close TO;
	}