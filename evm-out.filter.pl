#! /usr/bin/perl
my $file = shift;

my $mark=0;
my %supports;
my %details;
my %order;
my %key;
open(FILE,"<$file") or die;
while(<FILE>){
    chomp $_;
    if($_ =~ /^# EVM/){
       $_ =~ /(\d+)-(\d+)/;
       $key = $1."-".$2;
       $mark++;
       $order{$key} = $mark;
       $details{$key} .= $_."\n";
    }elsif($_ !~ /^$/){
       $details{$key} .= $_."\n";
       if($_ =~ /AUGUSTUS/){
          if($supports{$key} !~ /AUGUSTUS/){
             $supports{$key} .= "AUGUSTUS;";
          }
       }
       if($_ =~ /GeneMark/){ 
          if($supports{$key} !~ /GeneMark/){
             $supports{$key} .= "GeneMark;";
          }
       }
       if($_ =~ /SNAP/){
          if($supports{$key} !~ /SNAP/){
             $supports{$key} .= "SNAP;";
          }      
       }
       if($_ =~ /Cufflinks/){
          if($supports{$key} !~ /Cufflinks/){
             $supports{$key} .= "Cufflinks;";
          }
       }
       if($_ =~ /exonerate/){
          if($supports{$key} !~ /exonerate;/){
             $supports{$key} .= "exonerate;";
          }
       }
       if($_ =~ /GlimmerHMM/){
          if($supports{$key} !~ /GlimmerHMM/){
             $supports{$key} .= "GlimmerHMM;";
          }
       }
       
    }
}
close(FILE);


open(FILTER,">evm.out.filter") or die;
open(DETAILS,">evm.out.details") or die;
open(DISCARD,">evm.out.discard") or die;
print FILTER "!! Predictions spanning range 699 - 98948 [R1]\n";
foreach $ccc (sort {$order{$a} <=> $order{$b}} keys %order){
     if($supports{$ccc} eq "AUGUSTUS;" || $supports{$ccc} eq "GeneMark;" || $supports{$ccc} eq "SNAP;" || $supports{$ccc} eq "GlimmerHMM;"){
          print DISCARD "$details{$ccc}\n";
     }else{
          print FILTER "$details{$ccc}\n";
     }
     print DETAILS "$ccc\t$supports{$ccc}\n";
}
close(FILTER);
close(DETAILS);
