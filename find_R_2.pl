#!/usr/bin/perl -w
############get the position informations##############
my %hash1;
my @gene;
open TO,"RLK-PRR.csv";
while(<TO>){
        chomp;
        push @gene,$_;
	}
close TO;



my ($a,$b);
my %hash;
my @file1=glob("specific-module-idpalevioletred2.csv.ann");
foreach(@file1){
	open R, "<","$_";
	open O1,">>$_.PRR";
        while(<R>){
        	chomp;
        	my @array=split(/\t/,$_,2);
        	$hash{$array[0]}=$array[1];
        		}
        foreach $a (keys %hash){
	  foreach $b (@gene){
		if($a=~/$b/ && $b ne ""){print O1 "$a\t$hash{$a}\n";}
		else{next;}
		}
	}
	close O1;
	close R;
}
