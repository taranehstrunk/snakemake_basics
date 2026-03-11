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
actual workflow implementation. Uses wildcards, conda and config values, is the heart of the pipeline

## Example workflow
### Execute target rule and 4 main rules:
0. `rule_all`: target rule, doesn't process anything itself but lists all files we want to exist at end of the day 
1. `download_data`: 
2. `run_qc`: 
3. `plot_results`:
4. `summarize`: 


### Wildcards
`{sample}` is used as wildcard -> look in config file and replace with name -> can handle many samples with 1 rule 
### Streams
rules follow certain stream structure -> create dependency 
- `input` files that must exist before rule starts
- `output` files that must exist after rule finishes
- `params` variables pulled from `config.yaml` to help keep code clean

### Prerequisites
- need mamba / conda installation and install snakemake 
```
mamba install -c conda-forge -c bioconda snakemake
```

### Execution
Dry-run: 
```
snakemake --use-conda -n
```
Execution:
```
snakemake --use-conda --cores 1
```



## Notes
- first run takes a tiny bit longer because R and python are installed internally. This is also a dependency that is later met and will thus not be executed again!
- VSCode has a snakemake extension 
- pinning major dependencies in `.yaml` ensures pipeline works exactly as it is (e.g. `numpy<2.0`)