#!/bin/bash
set -e -x -o pipefail

main() {

    echo "Value of input_bam: '$input_bam'"
    echo "Value of input_bam_index: '$input_bam_index'"

    echo "installing packages"

    cd /packages
    tar -jxvf samtools-1.16.1.tar.bz2
    cd samtools-1.16.1
    ./configure --prefix=/packages
    make
    make install
    export PATH=/packages/bin:$PATH
    echo 'streaming files'
    cd 

    dx download "$input_bam" -o input_bam
    dx download "$input_bam_index" -o input_bam_index

    outfile=${input_bam_prefix}.flagstat
    samtools flagstat input_bam > $outfile
    flagstat_output=$(dx upload $outfile --brief)
    dx-jobutil-add-output flagstat_output "$flagstat_output" --class=file

}
