import sys
from Bio import SeqIO

rs = SeqIO.parse(sys.argv[1],'fasta')
rs = dict((r.id,r.seq) for r in rs)

f = open(sys.argv[2])
groups = f.read().strip().split('\n\n')
f.close()

for group in groups:
    group = group.strip().split('\n')
    group = [g.strip().split() for g in group]
    chrom_name = group[0][0]
    gene_name = group[1][-1].split(';')[0][3:]
    fang = group[0][6]
    cds = []
    for g in group:
        if g[2] == 'CDS':
            cds.append((int(g[3]),int(g[4])))
        else:
            continue
    cds.sort(key=lambda x:x[0])
    intron = []
    for n,c in enumerate(cds):
        if n == 0:continue
        intron.append((cds[n-1][1]+1, c[0]-1))
    intron.sort(key=lambda x:x[0])
    cds_seq = ''
    for i in cds:
        cds_seq += rs[chrom_name][i[0]-1:i[1]]
    if len(cds_seq) % 3 != 0:continue
    intron_codon = []
    if fang == '+':
        for i in intron:
            intron_seq = rs[chrom_name][i[0]-1:i[1]]
            intron_codon.append('%s-%s' % (intron_seq[:2],intron_seq[-2:]))
    else:
        cds_seq = cds_seq.reverse_complement()
        for i in intron:
            intron_seq = rs[chrom_name][i[0]-1:i[1]]
            intron_seq = intron_seq.reverse_complement()
            intron_codon.append('%s-%s' % (intron_seq[:2],intron_seq[-2:]))
    start_codon = cds_seq[:3]
    end_codon = cds_seq[-3:]
    print('%s\t%s\t%s\t%s\t%s' % (chrom_name,gene_name,start_codon,end_codon,' '.join(intron_codon)))

