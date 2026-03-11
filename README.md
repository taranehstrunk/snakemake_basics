# Snakemake basics
Repo to understanding snakemake functionalities and setup a basic workflow. 

## Background
- Reproducibility: all tool versions are locked in conda environment -> will work in the future
- Scalability: same code can run on laptop, server, cluster
- Efficiency: only needed steps are run -> don't always rerun whole pipeline, just affected parts if something was e.g. changed


## Structure
### 1. Config
contains data information and keeps that separate from code. 
### 2. Conda environment(s)
`.yaml` files. Handles requirement setup automatically 
### 3. Snakefile 
actual workflow implementation. Uses wildcards, conda and config values 
