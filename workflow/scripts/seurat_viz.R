library(Seurat)
library(ggplot2)
library(SeuratDisk) # Note: May need 'remotes::install_github("mojaveazure/seurat-disk")' 
                    # but for simplicity in a tutorial, use standard ReadH5AD if available

# Convert and Load
# In a real tutorial, you'd show how to handle h5ad -> Seurat conversion
# For this example, let's assume a simple plot of the metadata
data <- read.csv(snakemake.input$stats) 

p <- ggplot(data, aes(x=sample, y=cell_count, fill=sample)) + 
     geom_bar(stat="identity") + 
     theme_minimal() + 
     labs(title="Cells passing QC")

ggsave(snakemake.output[[1]], plot=p, width=6, height=4)