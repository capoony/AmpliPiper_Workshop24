# AmpliPiper Workshop - NOBIS Tagung 28/11/2024

![AmpliPiper](imgs/AmpliPiper_logo.png)

## Overview

This repository provides published and unpublished test datasets that will be used to test multilocus amplicon sequencing in our workshop during the NOBIS conference at the Naturhistorisches Museum Wien on November 28th 2024. Please find the slides for the presentation in [here](amplipiper_workshop_20241128.pdf)

[AmpliPiper](https://github.com/nhmvienna/AmpliPiper) is an open-source automated analysis pipeline based on BASH scripting, Python and R for analyzing high-throughput amplicon sequencing data for multiple samples and loci. The pipeline performs various tasks, including raw read demultiplexing, filtering, consensus sequence reconstruction, species identification and phylogenetic analysis.

### *Mercurialis* spp. ONT data

Raw reads and phylogenetic tree files of a subset of samples from the complex plant genus *Mercurialis* - a close relative of the nettle (*Urtica dioica*) - were obtained from the following publication:

Gerchen JF, Veltsos P, Pannell JR. Recurrent allopolyploidization, Y-chromosome introgression and the evolution of sexual systems in the plant genus Mercurialis. Philos Trans R Soc Lond B Biol Sci. 2022 May 9;377(1850):20210224. doi: 10.1098/rstb.2021.0224. Epub 2022 Mar 21. PMID: 35306889; PMCID: PMC8935306.

### Opiliones spp. ONT data

An unpublished dataset based on "Daddy longlegs" (Opiliones) samples collected in the course of the [ABOL](https://www.abol.ac.at/en/homepage_en/) initative that were sequenced with ONT for the COX1 locus (amplified with standard barcoding Folmer primers).
___

## Obtain datasets

Make sure that you have `git` installed and properly set up on your system. Clone the repository by typing in your commandline:

```bash
## go to your target directory
cd <path/to/target/folder>

## use git to clone this repository 
git clone https://github.com/nhmvienna/AmpliPiper_Workshop_2024
```

## Running the pipeline in Docker

If you have Docker and want to run the pipeline with that you should:

1. Modify the [.env](./.env) file so that the `USERDATA_PATH` to match with the path to the cloned `AmpliPiper_Workshop_2024` repository.

    > ⚠️ **WARNING!** ⚠️ _If you are on Windows, you should specify the path **exactly** in this way:_ 
    >
    > `USERDATA_PATH="c:/Users/user/path/to/AmpliPiper_Workshop_2024"`
    >
    > _for example:_
    >
    >`USERDATA_PATH="c:/Users/User/AmpliPiper_Workshop_2024"`

2. Use the following command to launch the environment: 

    - If you are on Linux:

    ```bash
    bash compose.sh
    ```
    - If you are on Windows **Powershell**:

    ```powershell
    .\compose.ps1
    ```

3. Inside the environment that this command will create, run:

```bash
bash docker_main.sh
```

## Launch your working environment with GitPod

[![Open in Gitpod](https://gitpod.io/button/open-in-gitpod.svg)](https://gitpod.io/#https://github.com/nhmvienna/AmpliPiper_Workshop_2024)

> ⚠️ **WARNING!** ⚠️ _Workspaces don't automatically delete after you close them!_

Follow these steps to delete a workspace (and save precious cloud quota):

![Gitpod Demo](./imgs/gitpod_demo.gif)

