#!/usr/bin/perl -w
############get the position informations##############
my %hash;
my @gene;
my @file=glob("*_gtf");
foreach(@file){
	open TO, "<","$_";
        while(<TO>){
        	chomp;
        	my @array=split(/\t/);
        	push @gene,$array[9];
	}
	close TO;
}

my @file1=glob("specific*.csv.ann");
foreach(@file1){
	open R, "<","$_";
	open O1,">>$_.RP";
        while(<R>){
        	chomp;
        	my @array=split(/\t/,$_,2);
        	if($array[0]~~ @gene){
        		print O1 "$array[0]\t$array[1]\n";
        		}
	}
	close O1;
	close R;
}
