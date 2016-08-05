#!/usr/bin/perl -w
############get the position informations##############
my @gene;
open TO,"fpkm_3.csv";
while(<TO>){
        chomp;
        my @array=split(/,/);
        push @gene,$array[0];
	}
close TO;


my ($a,$b);
my %hash;
my @file1=glob("*id");
foreach(@file1){
	open R, "<","$_";
	open O1,">>$_-1";
        while(<R>){
        	chomp;
        	my @array=split(/\t/);
        	if($array[1]~~@gene){print O1 "$_\n";}
		}
	close O1;
	close R;
}
