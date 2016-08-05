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



my %hash;
open R,"gene_merged_clust.map";
while(<R>){
        chomp;
        my @array=split(/\t/);
        if(!(exists $hash{$array[0]})){$hash{$array[0]}=$array[1];}
        else{push @{$hash{$array[0]}},$array[1];}
        		}
close R;

my $a;
open RE,">>PRR_transcripts.list";
foreach $a (@gene){
        for my $i (0 .. $#{$hash{$a}}){
                print RE "$hash{$a}[$i]\n";
                }
        }
close RE;