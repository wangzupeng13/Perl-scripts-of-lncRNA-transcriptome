#!/usr/bin/perl -w
############get the position informations##############
my %hash;
my @gene;
my @file=glob("*.gtf");
foreach(@file){
	open TO, "<","$_";
        while(<TO>){
        	chomp;
        	my @array=split(/\t/);
        	if($array[0]=~m/Chr/ or $array[0]=~m/Unknow/){
        		$array[8]=~s/"//g;
        		$array[8]=~s/gene_id //g;
        		my @array1=split(/;/,$array[8]);
        		if(not exists $hash{$array1[0]}){
        			$hash{$array1[0]}=[$array[0],$array[3],$array[4]];
        			push @gene,$array1[0];
        			}
        		else{
        			if($hash{$array1[0]}[1]>$array[3] and $hash{$array1[0]}[2]>=$array[4]){$hash{$array1[0]}=[$hash{$array1[0]}[0],$array[3],$hash{$array1[0]}[2]]}
        			elsif($hash{$array1[0]}[1]<=$array[3] and $hash{$array1[0]}[2]<$array[4]){$hash{$array1[0]}=[$hash{$array1[0]}[0],$hash{$array1[0]}[1],$array[4]]}
        			elsif($hash{$array1[0]}[1]>$array[3] and $hash{$array1[0]}[2]<$array[4]){$hash{$array1[0]}=[$hash{$array1[0]}[0],$array[3],$array[4]]}
        			else{next;}
        			}
        		
        		}
	}
	close TO;
}
############finding the gene-pairs############
#open O1,">>mRNA_mRNA_trans-80.csv";
#open O2,">>mRNA_lncRNA_trans-80.csv";
#open O3,">>lncRNA_lncRNA_trans-80.csv";
open O4,">>mRNA_mRNA_cis-50.csv";
open O5,">>mRNA_lncRNA_cis-50.csv";
open O6,">>lncRNA_lncRNA_cis-50.csv";
my ($a,$b,$c,$d);	
foreach $a (@gene){
	foreach $b (keys %hash){
		if($a ne $b){
			if($a=~m/XLOC/ and $b=~m/XLOC/){
				if($hash{$a}[0] ne $hash{$b}[0]){next;}
				else{
					if($hash{$a}[1]<$hash{$b}[1]){
						 $c=$hash{$b}[2]-$hash{$a}[1];
						 $d=$hash{$b}[1]-$hash{$a}[2];
						if($c<10000){print O6 "$a,$b\n";}
						#elsif($d>2000000){next;}
						else{next;}
						}
					else{
						 $c=$hash{$a}[2]-$hash{$b}[1];
						 $d=$hash{$a}[1]-$hash{$b}[2];
						if($c<10000){print O6 "$a,$b\n";}
						#elsif($d>2000000){next;}
						else{next;}
					}
				}
			}
		       if($a=~m/XLOC/ && $b=~m/Achn/ or $a=~m/Achn/ && $b=~m/XLOC/){
		       	      if($hash{$a}[0] ne $hash{$b}[0]){next;}
			      else{
					if($hash{$a}[1]<$hash{$b}[1]){
						 $c=$hash{$b}[2]-$hash{$a}[1];
						 $d=$hash{$b}[1]-$hash{$a}[2];
						if($c<10000){print O5 "$a,$b\n";}
						#elsif($d>2000000){print O2 "$a,$b\n";}
						else{next;}
						}
					else{
						 $c=$hash{$a}[2]-$hash{$b}[1];
						 $d=$hash{$a}[1]-$hash{$b}[2];
						if($c<10000){print O5 "$a,$b\n";}
						#elsif($d>2000000){print O2 ",$b\n";}
						else{next;}
					}
				}
		       	}
		      if($a=~m/Achn/ && $b=~m/Achn/){
		      	if($hash{$a}[0] ne $hash{$b}[0]){next;}
				else{
					if($hash{$a}[1]<$hash{$b}[1]){
						 $c=$hash{$b}[2]-$hash{$a}[1];
						 $d=$hash{$b}[1]-$hash{$a}[2];
						if($c<10000){print O4 "$a,$b\n";}
						#elsif($d>2000000){print O1 "$a\$b\n";}
						else{next;}
						}
					else{
						 $c=$hash{$a}[2]-$hash{$b}[1];
						 $d=$hash{$a}[1]-$hash{$b}[2];
						if($c<10000){print O4 "$a,$b\n";}
						#elsif($d>20000000){print O1 "$a,$b\n";}
						else{next;}
					}
				}
		      	}      
		       
		       
		       
		}
	else{next;}
	}
}
close O1;
close O2;
close O3;
close O4;
close O5;
close O6;

