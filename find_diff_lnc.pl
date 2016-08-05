#!/usr/bin/perl -w
my @gene;
open NA,"diff_lncRNA.csv";
while(<NA>) {
	chomp;
	s/"//g;
	push @gene,$_;
	}
close NA;	

my @file=glob("specific_module_geneIDs_green.csv");
foreach(@file){
	open TO, "<","$_";
        open O2,">>$_.lnc";
        while(<TO>){
        	chomp;
        	s/"//g;
        	my @array=split(/,/);       	
        	if($array[1] ~~ @gene){print O2 "$array[1]\n"}
        	else{next;}      	
        	}
        close O2;
	close TO;
	}