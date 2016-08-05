#!/usr/bin/perl -w
############get the position informations##############
open O1,">>TF-gene.dis";
my @file1=glob("specific*.TF");
foreach(@file1){
	open R, "<","$_";
	my @data=split(/_/);
	my $a=$data[3];
        while(<R>){
        	chomp;
        	my @array=split(/\t/);
		print O1 "$array[0]\t$a\t$array[1]\t$array[2]\t$array[3]\n";	
	}
	close R;
}
close O1;