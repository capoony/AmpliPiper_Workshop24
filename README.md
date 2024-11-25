# AmpliPiper Workshop - NOBIS Tagung 28/11/2024

![AmpliPiper](datasets/AmpliPiper_logo.png)

## Overview

This repository provides published and unpublished test datasets that will be used to test multilocus amplicon sequencing in our workshop during the NOBIS conference at the Naturhistorisches Museum Wien on November 28th 2024.

[AmpliPiper](https://github.com/nhmvienna/AmpliPiper) is an open-source automated analysis pipeline based on BASH scripting, Python and R for analyzing high-throughput amplicon sequencing data for multiple samples and loci. The pipeline performs various tasks, including raw read demultiplexing, filtering, consensus sequence reconstruction, species identification and phylogenetic analysis.

### *Mercurialis* spp. ONT data

Raw reads and phylogenetic tree files of a subset of samples from the complex plant genus *Mercurialis* - a close relative of the nettle (*Urtica dioica*) - were obtaines from the following publication:

Gerchen JF, Veltsos P, Pannell JR. Recurrent allopolyploidization, Y-chromosome introgression and the evolution of sexual systems in the plant genus Mercurialis. Philos Trans R Soc Lond B Biol Sci. 2022 May 9;377(1850):20210224. doi: 10.1098/rstb.2021.0224. Epub 2022 Mar 21. PMID: 35306889; PMCID: PMC8935306.

### Opiliones spp. ONT data

An unpublished dataset based on daddy-longlegs samples collected in the course of the ABOL initative that were sequenced with ONT for the COX1 locus (amplified with standard barcoding Folmer primers).
___

## Obtain datasets

Make sure that you have `git` installed and properly set up on your system. Clone the repository by typing in your commandline:

```bash
## go to your target directory
cd <path/to/target/folder>
git clone https://github.com/nhmvienna/AmpliPiper_Workshop_2024
```

## Launch your working environment with GitPod

[![Open in Gitpod](https://gitpod.io/button/open-in-gitpod.svg)](https://gitpod.io/#https://github.com/nhmvienna/AmpliPiper_Workshop_2024)
