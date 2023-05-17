#!/usr/bin/env Rscript
library("DESeq2")
library(ggplot2)
library("apeglm")
library(pheatmap)

directory <- "/domus/h1/xandri/GenomeAnalysis_Paper1/analysis/06_comparative_genomics/HTSeq/"

filenames <- list.files(directory) 
samples <- sub("_(.*)", "", filenames) 
condition = c("BH", "BH", "BH", "Serum", "Serum", "Serum")

sampleTable <- DataFrame(sampleName = samples,
                         fileName = filenames,
                         condition = factor(condition))

ddsHTSeq <- DESeqDataSetFromHTSeqCount(sampleTable = sampleTable, directory = directory, design = ~condition)
dds <- DESeq(ddsHTSeq)

res <- results(dds)
resFilt <- res[which(res$padj < 0.05 & abs(res$log2FoldChange) > 1),]
# Sort genes based on absolute log2 fold change

top_genes <- head(resFilt[order(abs(resFilt$log2FoldChange), decreasing = TRUE),], n = 20)
write.csv(top_genes, file = "/domus/h1/xandri/GenomeAnalysis_Paper1/analysis/07_expression_analysis/top_genes.csv")


## MA plot
png("/domus/h1/xandri/GenomeAnalysis_Paper1/analysis/07_expression_analysis/MAplot.png")
res <- lfcShrink(dds, coef="condition_Serum_vs_BH", type="apeglm")
plotMA(res, main="MA Plot", ylim=c(-2,2))
dev.off()

## histogram from the analysis data
png("/domus/h1/xandri/GenomeAnalysis_Paper1/analysis/07_expression_analysis/histogram.png")
hist(res$pvalue[res$baseMean > 1], breaks = 0:20/20,
     col = "grey50", border = "white")
dev.off()

## Heatmap
png("/domus/h1/xandri/GenomeAnalysis_Paper1/analysis/07_expression_analysis/heatmap.png")

ass <- assay(rlog(dds))
topVarGenes <- head(order(rowVars(ass), decreasing = TRUE), 20)
mat <- ass[ topVarGenes, ]
mat <- mat - rowMeans(mat)
anno <- as.data.frame(colData(rlog(dds))[, c("condition","sizeFactor")])

pheatmap(mat, annotation_col = anno)

dev.off()

