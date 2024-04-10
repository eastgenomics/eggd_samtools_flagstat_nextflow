# eggd_samtools_flagstat_nextflow


eggd_samtools_flagstat is an app used to quantify the number of alignments for each FLAG field in a bam file. It takes in a bam and index file and calculates statistics based on bit flags in the FLAG field, information about the flags can be found in the following document: https://samtools.github.io/hts-specs/SAMv1.pdf

## What does this app do?

This app runs the samtools flagstat script on a .bam file and the corresponding .bam.bai index file and returns a .flagstat file.

The .flagstat file provides read counts for each of 13 categories based primarily on bit flags in the FLAG field. Each category in the output is broken down into QC pass and QC fail. In the default output format, these are presented as "#PASS + #FAIL" followed by a description of the category. See http://www.htslib.org/doc/samtools-flagstat.html for further documentation.

Additionally to the 13 aforementioned categories three rows are given that additionally filter on the reference name (RNAME), mate reference name (MRNM), and mapping quality (MAPQ) fields:  

This is the source code for an app that runs on the DNAnexus Platform.
For more information about how to run or modify it, see
https://documentation.dnanexus.com/.

## What are typical use cases for this app?
This app should be executed to calculate Quality Control statistics related to reads in .bam files.
## What are the inputs?
The app requires a BAM file (.bam), and a corresponding index file (bam.bai).
## What are the outputs?
The output is a .flagstat file with 16 lines in the format #PASS + #FAIL:

1. The first row of output gives the total number of reads that are QC pass and fail (according to flag bit 0x200). 
### Additional categories given for reads are:

2. primary (neither 0x100 nor 0x800 bit set)
3. secondary (0x100 bit set)
4. supplementary (0x800 bit set)
5. duplicates (0x400 bit set)
6. primary duplicates (0x400 bit set and neither 0x100 nor 0x800 bit set)
7. mapped (0x4 bit not set)
8. primary mapped (0x4, 0x100 and 0x800 bits not set)
9. paired in sequencing (0x1 bit set)
10. read1 (both 0x1 and 0x40 bits set)
11. read2 (both 0x1 and 0x80 bits set)
12. properly paired (both 0x1 and 0x2 bits set and 0x4 bit not set)
13. with itself and mate mapped (0x1 bit set and neither 0x4 nor 0x8 bits set)
14. singletons (both 0x1 and 0x8 bits set and bit 0x4 not set)
### And finally, two rows are given that additionally filter on the reference name (RNAME), mate reference name (MRNM), and mapping quality (MAPQ) fields:  
15. with mate mapped to a different chr
    (0x1 bit set and neither 0x4 nor 0x8 bits set and MRNM not equal to RNAME)
16. with mate mapped to a different chr
    ((mapQ>=5) 0x1 bit set and neither 0x4 nor 0x8 bits set and MRNM not equal to RNAME and MAPQ >= 5)
## How to run this app from the command line?
```

dx run app-eggd_samtools_flagstat -iinput_bam <fileID> -iinput_bam_index <fileID>

```
### This app was made by EMEE GLH
