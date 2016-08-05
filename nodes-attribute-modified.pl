#!/usr/bin/perl
use strict;
use warnings;
my @rp;
open RP, "specific-module-idturquoise.csv.ann.RP";
while(<RP>){
	chomp;
	my @array=split(/\t/);
	push @rp,$array[0];
	}
close RP;

my @prr;
open PRR, "specific-module-idturquoise.csv.ann.PRR";
while(<PRR>){
	chomp;
	my @array=split(/\t/);
	push @prr,$array[0];
	}
close PRR;

my @tf;
open TF, "specific-module-idturquoise.csv.ann.TF";
while(<TF>){
	chomp;
	my @array=split(/\t/);
	push @tf,$array[0];
	}
close TF;

open NO,"CytoscapeInput-nodes-m-turquoise.txt";
open N,">>CytoscapeInput-nodes-m-turquoise-M.txt";
while(<NO>){
	chomp;
	my @array=split(/\t/);
	if($array[0]=~/^T/){print N "$_\t0\n";}
	elsif($array[0]~~@rp){print N "$_\t1\n";}
	elsif($array[0]~~@prr){print N "$_\t2\n";}
	elsif($array[0]~~@tf){print N "$_\t3\n";}
	else{print N "$_\t4\n";}
	}
close NO;
close N;
