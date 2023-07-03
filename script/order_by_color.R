###根据不同的细胞类型进行着色
###先从scobj中提取三种细胞类型
rm(list = ls())
library(ggplot2)
library(Seurat)
scobj <- readRDS(file = "output/hamony_seurat_annotaion.rds")
B_scobj <- subset(scobj,idents = c("B cell","DC","NK cell"))
##指定三种颜色
my_colors <- c("#b3eebe", "#46bac2", "#371ea3")
##对三种细胞类型按照顺序进行着色
B_scobj@meta.data$celltype <- factor(B_scobj@meta.data$celltype, levels = c("DC","NK cell","B cell"))
Idents(B_scobj) <- "celltype"
DimPlot(B_scobj, reduction = "umap",cols = my_colors)


###此外，还可以对于sample的顺序和group的顺序进行排序
B_scobj@meta.data$group <- factor(B_scobj@meta.data$group,levels = c("TAI","T5AE42","WT"))
DimPlot(B_scobj, reduction = "umap",cols = my_colors,group.by = "group")
DimPlot(B_scobj, reduction = "umap",cols = my_colors,group.by = "celltype",split.by = "group")

