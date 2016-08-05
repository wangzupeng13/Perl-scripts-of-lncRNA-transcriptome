#!/usr/bin/perl -w
	
my @file1=glob("*.diff");
foreach(@file1){
	open TO, "<","$_";
	my @na=split(/\./);
        open O2,">>diff-mRNA.csv";
        while(<TO>){
        	chomp;
        	my @array=split(/\t/);
        	if($array[8]<0.05){print O2 "$array[0],$array[1],$array[2],$array[3],$array[4],$array[5],$array[6],$array[7],$array[8],$na[2]\n"}
        	else{next;}
        	}
        close O2;
	close TO;
	}
	
	
my %de;
open DE,"diff-mRNA.csv";
while(<DE>){
	chomp;
        my @array=split(/,/);
	if(exists $de{$array[0]}){
		push @{ $de{$array[0]} },$array[12];
		}
	else{$de{$array[0]}=$array[12];}
	}
close DE;	
	
open O3,">>diff-mRNA-combin.csv";
for $fa (keys %de){
	print O3 "$fa,";
	for $i (0 .. $#{$de{$fa}}){
		print O3 "$de{$fa}[$i],";
		}
	print O3 "\n";
	}
close O3;
	