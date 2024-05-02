// space to hold SAMTOOL_FLAGSTAT process

process SAMTOOLS_FLAGSTAT
{
  tag "${bams[0]}, ${bams[1]}"
  debug true
  publishDir params.outdir, mode:'copy'

  input:
    tuple val(sample_id), path(bams)

  output:
    path "*.flagstat"
  script:
    """
    echo $bams
    bash nextflow-bin/nextflow_samtools_flagstat.sh ${bams[0]} ${bams[1]}
    """
}