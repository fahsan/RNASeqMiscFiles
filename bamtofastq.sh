for sample in *.local.transcript.bam
        do
        echo $sample
        describer=$(echo ${sample} | sed 's/.local.transcript.bam//')
        echo $describer

        #Convert all local transcript alignments to fastq paired end reads for rMATs, DAPARS, and GIREMI alignment later on. 
        samtools sort -n -o ${describer}.namesort.bam $sample
        bedtools bamtofastq -i ${describer}.namesort.bam -fq ${describer}.pe1.fq -fq2 ${describer}.pe2.fq

done
