DSI-Africa: First Human Genome Repeat Expansions Analysis Virtual Workshop
May 8-21, 2024
Group Project Description

Stream 1 (Groups 1-4)

Project Title: Identification of pathogenic disease-associated short tandem repeats (STRs) in clinical samples

Overview
The Neurology Department at a teaching hospital in South Africa recently acquired a seed grant from a new biotechnology start-up company. This company plans to bring affordable next-generation sequencing to the South African market for genetic diagnosis- a space which currently has a very limited service offering. The Neurology Department jumped at the opportunity to have 10 patient genomes sequenced for free and tasked a bioinformatics student with the analysis of the whole genome sequencing (WGS) data. The 10 selected patients presented with “progressive adult-onset muscle weakness” with a diverse but variable range of symptoms including slurred speech, muscle cramps and twitches, muscle wasting and even cognitive decline in some patients. Although the neurologists felt that these patients may have a possible genetic aetiology for their symptoms, the bioinformatics student who analysed the data did not find any pathogenic variants when screening single nucleotide polymorphisms (SNPs) and short insertions and deletions (in/dels) in the WGS data.
 
Given the prominent role of repeat expansions in neurological disorders, the Neurology Department has approached your group to ask for assistance to screen the WGS data from their 10 patients. They are concerned that they may be missing disease-associated short tandem repeats (STRs) amongst this group which were not picked up by the standard variant calling pipeline which focuses on SNPs and in/dels.

Dataset
Illumina PCR-free 30X coverage whole genome sequencing data from 10 individuals

TR Genotyping Tools
ExpansionHunter, REViewer, Samtools

Expected Results
On successful implementation of the project, participants should be able to:
i) Provide a genetic diagnosis for one patient by identifying a disease-associated repeat expansion in the pathogenic range.
ii) Identify 3 patients with intermediate range disease-associated repeat expansions.
iii) Provide a visualization of all 4 of the identified disease-associated REs clearly showing the read support for each allele.
iv) Provide some feedback for the Neurology Department regarding the following queries:
Are you sure these REs are real? Do you suggest we validate them by any other method?
How confident are you in the size of the expanded repeats? Is your analysis accurate?
Do you think we could offer RE testing as a diagnostic service in our clinic using whole genome sequencing data? Can you foresee any challenges or important things we need to consider?
Where did you get your reference ranges from? Are these ranges valid in African populations?
Can we use whole exome sequencing (WES) data to analyse REs? The start-up company has offered WES to us at a very good price but WGS is unfortunately not within our budget.
 

The analysis for this project employed [ExpansionHunter](https://github.com/Illumina/ExpansionHunter), [REViewer](https://github.com/Illumina/REViewer) and [STRipy Database Pipeline](https://gitlab.com/andreassh/stripy-pipeline) to call and annotate Short Tandem Repeats (STRs).
