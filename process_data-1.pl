#!/usr/bin/perl -w 
my (%ann);
open ANN,"mRNA.trans.go";
while(<ANN>){
	chomp;
        my @array=split(/\t/);
        $array[1]=~s/,/\t/g;
        $ann{$array[0]}=$array[1];
	}
close ANN;

my @file=glob("specific*.csv");
foreach(@file){
	open TO, "<","$_";
        open O2,">>$_.GO";
        while(<TO>){
        	chomp;
        	s/"//g;
        	my @data=split(/,/);
        	if(exists $ann{$data[1]} and $data[1]=~m/Achn/){print O2 "$data[1]\t$ann{$data[1]}\n"}
         	else{next;}
        	}	
        close O2;
	close TO;
	}