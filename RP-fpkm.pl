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

my @file1=glob("fpkm_3.csv");
foreach(@file1){
	open R, "<","$_";
	open O1,">>$_-RP.csv";
        while(<R>){
        	chomp;
        	my @array=split(/,/,$_,2);
        	if($array[0] ~~ @gene){
        		print O1 "$array[0],$array[1]\n";
        		}
        	else{next;}
	}
	close O1;
	close R;
}
