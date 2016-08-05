#!/usr/bin/perl -w 
my %hash;
open NA,"name-1.txt";
while(<NA>){
	chomp;
	my @array=split(/\t/);
	$hash{$array[0]}=$array[1];
	}
close NA;

open O2,">>combined.RP";
my @file2=glob("specific-module-*.RP");
foreach(@file2){
	open RP, "<","$_";
	my @data1=split(/-/);
	$data1[2]=~s/id//;
	$data1[2]=~s/.csv.ann.RP//;
	my $name=$data1[2];
        while(<RP>){
        	chomp;
        	s/"//g;
        	my @array=split(/\t/,$_,2);
        	print O2 "$array[0]\t$array[1]\t$name\t$hash{$name}\n";
        		}
	close RP;
}
close O2;