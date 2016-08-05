#!/usr/bin/perl -w
my %hash;
open NAT,"NAT.ann";
while(<NAT>){
	chomp;
	my @array=split(/\t/,$_,3);
	$hash{$array[0]}=[$array[1],$array[3]]
	}
close NAT;

my @file=glob("specific*.csv");
foreach(@file){
	open TO, "<","$_";
        open O2,">>$_.NAT";
        while(<TO>){
        	chomp;
        	s/"//g;
        	if(exists $hash{$_}){
        		print O2 "$_\t$hash{$_}[0]\t$hash{$_}[1]\n";
        		}
        	}
        close O2;
	close TO;
	}