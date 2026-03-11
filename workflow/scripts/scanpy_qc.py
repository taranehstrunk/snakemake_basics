import scanpy as sc
import pandas as pd
import os

# Read the 10x directory directly
adata = sc.read_10x_mtx(snakemake.input[0], var_names='gene_symbols', cache=True)
adata.var_names_make_unique()

# Perform QC
sc.pp.filter_cells(adata, min_genes=snakemake.params.min_g)
sc.pp.filter_genes(adata, min_cells=3)

# Save outputs
os.makedirs(os.path.dirname(snakemake.output.h5ad), exist_ok=True)
adata.write(snakemake.output.h5ad)

# Create stats CSV
stats = pd.DataFrame({
    "sample": [snakemake.wildcards.sample],
    "n_cells": [adata.n_obs],
    "n_genes": [adata.n_vars]
})
stats.to_csv(snakemake.output.stats, index=False)