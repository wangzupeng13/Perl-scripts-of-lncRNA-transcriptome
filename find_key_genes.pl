#!/usr/bin/perl -w
my (%m,@l);
open NA,"specific_module_geneIDs_blue.csv.ann.diff";
while(<NA>) {
	chomp;
	s/"//g;
	my @array=split(/\t/,$_,2);
	$m{$array[0]}=$array[1];
	}
close NA;	
open A,"specific_module_geneIDs_blue.csv.lnc";
while(<A>) {
	chomp;
	s/"//g;
	my @array=split(/\t/,$_,2);
	push @l,$array[0];
	}
close A;	

open M,"hub-genes-Aa-m.txt";
open RE,">>key-genes-Aa-m.ann";
while(<M>){
	chomp;
	if(exists $m{$_}){print RE "$_\t$m{$_}\n";}
	else{next;}
	}
close M;
close RE;

open L,"hub-genes-Aa-l.txt";
open R,">>key-genes-Aa-l.txt";
while(<L>){
	chomp;
	if($_ ~~ @l){print R "$_\n";}
	else{next;}
	}
close L;
close R;