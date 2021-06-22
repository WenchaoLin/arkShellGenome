# Description

## About

Ark shells are commercially important clam species that inhabit in muddy sediments of shallow coasts in East Asia. For a long time, the lack of genome resources has hindered scientific research of ark shells. Here, we reported a high-quality chromosome-level genome assembly of Scapharca kagoshimensis, with an aim to unravel the molecular basis of heme biosynthesis, and develop genomic resources for genetic breeding and population genetics in ark shells.

This repo contains the scripts used in the research. Check the article and see more information about this research.

## References

'Chromosome-level genome assembly of __Scapharca kagoshimensis__ reveals the expanded molecular basis of heme biosynthesis in ark shell' (Accepted)

----------
# Scripts

## filter_cover.py

filter blast output by length and similartity 

Usage:
`python filter_cover.py -i fasta(quevry sequence) blastn（blast output -m8） length_percent（length %） similartity（similartity%）`


## extract_gene_model.pl

extract sequences（faa：proteins sequences ffn：cds sequences） from a Fasta file that has been annotated with a GFF file. 

Usage：
`perl extract_gene_model.pl Fasta_file gff_file`


## augustus_out_to_gff3.pl

convert augustus out gff file to EVM gff3 format

Usage:
`perl augustus_out_to_gff3.pl augustus_out >EVM_gff3`


## glimmerHMM_out_to_gff3.pl

convert glimmerHMM out gff file to EVM gff3 format

Usage:
`perl glimmerHMM_out_to_gff3.pl glimmerHMM_out >EVM_gff3`

## genemark_out_to_gff3.pl

convert genemark out gff file to EVM gff3 format

Usage:
`perl genemark_out_to_gff3.pl genemark_out >EVM_gff3`

## transcript-out-to-gff3.pl

convert transcript out gff file to EVM gff3 format

Usage:
`perl transcript_out_to_gff3.pl transcript_out >EVM_gff3`

## evm-out.filter.pl

filter ab initio gene modules from EVM output

Usage:
`perl evm-out.filter.pl EVM_output`

## boundarie1.py

scan and count the initial codon, termination codon, exon and intron boundaries of each gene

Usage:
`python boundarie1.py fasta_sequence gff3_file`

----------

