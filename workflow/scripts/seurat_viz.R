library(Seurat)
library(ggplot2)

# in R snakemake objects are accessed with @, whereas in python with .
data <- read.csv(snakemake@input[["stats"]]) 

p <- ggplot(data, aes(x=sample, y=n_cells, fill=sample)) + 
     geom_bar(stat="identity") + 
     theme_minimal() + 
     labs(
         title="Cells passing QC", 
         y="Number of Cells", 
         x="Sample Name"
     )

ggsave(snakemake@output[[1]], plot=p, width=6, height=4)