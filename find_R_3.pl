#!/usr/bin/perl -w
############get the position informations##############
my @file=glob("diff*_gene.csv");
foreach(@file){
	open TO, "<","$_";
	open O1,">>$_-m.csv";
        while(<TO>){
        	chomp;
        	my @array=split(/,/);
        	my $a=scalar(@array);
        	if($a>1){print O1 "$array[0],$array[1],";}
        	else{print O1 "$array[0],";}
        	open DI,"diff-mRNA.csv";
        	while(<DI>){
	            chomp;
	            my @data=split(/,/);
        		if($array[0] eq $data[0]){print O1 "$data[9],";}
        		else{next;}
        		}
	        print O1 "\n";
                close DI;
       }
       
	close O1;
	close TO;
}
