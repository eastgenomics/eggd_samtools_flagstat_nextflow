nextflow.enable.dsl=2

 include { SAMTOOLS_FLAGSTAT } from './modules/SAMTOOLS_FLAGSTAT'

// run

workflow{


    bam_pairs_ch = channel.fromFilePairs(params.sorted_bam_path)
    SAMTOOLS_FLAGSTAT(bam_pairs_ch)

}
