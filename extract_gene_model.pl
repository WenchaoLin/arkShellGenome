#!/usr/bin/perl
if(@ARGV < 3){
	print "perl extract_gene_model.pl <genome> <gff> <prefix>\n";
	exit;
}

my $genome = shift;
my $gff = shift;
my $prefix = shift;

system("/work/daihui/software/my-usr/Euk_Gene/script/NCBI_genome/gffread $gff -g $genome -x $prefix.ffn -y $prefix.faa")==0 or die "gffread error...\n";
system("perl /work/daihui/software/my-usr/Euk_Gene/script/NCBI_genome/choose_long_gene.pl $gff $prefix.faa $prefix > $prefix.extract.list")==0 or die "";
system("perl /work/daihui/software/my-usr/Euk_Gene/script/NCBI_genome/choosefasta.pl $prefix.ffn $prefix.extract.list >$prefix.extract.ffn")==0 or die "";
system("perl /work/daihui/software/my-usr/Euk_Gene/script/NCBI_genome/choosefasta.pl $prefix.faa $prefix.extract.list >$prefix.extract.faa")==0 or die "";
#system("")==0 or die "";
