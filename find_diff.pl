#!/usr/bin/perl -w
my @name;
open ANN,"diff-gene.txt";
while(<ANN>){
	chomp;
	push @name,$_;
	}
close ANN;

my %hash;
my @file=glob("specific*.csv.ann");
foreach(@file){
	open TO, "<","$_";
        open O2,">>$_.diff";
        while(<TO>){
        	chomp;
        	my @array=split(/\t/,$_,2); 
        	my $a;
                foreach $a (@name){
                	if($array[0] eq $a){print O2 "$a\t$array[1]\n";}
                	else{next;}
                	}	
        	}
        close O2;
	close TO;
	}