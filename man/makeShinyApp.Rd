% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/makeShinyApp.R
\name{makeShinyApp}
\alias{makeShinyApp}
\title{Make a shiny app}
\usage{
makeShinyApp(
  obj,
  scConf,
  gex.assay = NA,
  gex.slot = c("data", "scale.data", "counts"),
  gene.mapping = FALSE,
  shiny.title = "scRNA-seq shiny app",
  shiny.footnotes = "",
  shiny.dir = "shinyApp/",
  enableSubset = TRUE,
  defPtSiz = 1.25,
  ganalytics = NA,
  default.gene1 = NA,
  default.gene2 = NA,
  default.multigene = NA,
  default.dimred = NA,
  markers.all = FALSE,
  markers.top20 = FALSE,
  de.genes = FALSE,
  gene.ranks = FALSE,
  volc.plot = FALSE,
  volc.plot.max.unique = 50,
  gene.ont = FALSE,
  pval.cutoff = 0.5,
  num.genes = 400
)
}
\arguments{
\item{obj}{input single-cell object for Seurat (v3+) / SingleCellExperiment 
data or input file path for h5ad / loom files}

\item{scConf}{shinycell config data.table}

\item{gex.assay}{assay in single-cell data object to use for plotting 
gene expression, which must match one of the following:
\itemize{
  \item{Seurat objects}: "RNA" or "integrated" assay, 
    default is "RNA"
  \item{SCE objects}: "logcounts" or "normcounts" or "counts", 
    default is "logcounts"
  \item{h5ad files}: "X" or any assay in "layers",
    default is "X"
  \item{loom files}: "matrix" or any assay in "layers",
    default is "matrix"
}}

\item{gex.slot}{slot in single-cell assay to plot. This is only used 
for Seurat objects (v3+). Default is to use the "data" slot}

\item{gene.mapping}{specifies whether to convert human / mouse Ensembl gene 
IDs (e.g. ENSG000xxx / ENSMUSG000xxx) into "user-friendly" gene symbols. 
Set this to \code{TRUE} if you are using Ensembl gene IDs. Default is 
\code{FALSE} which is not to perform any conversion. Alternatively, users 
can supply a named vector where \code{names(gene.mapping)} correspond 
to the actual gene identifiers in the gene expression matrix and 
\code{gene.mapping} correspond to new identifiers to map to}

\item{shiny.title}{title for shiny app}

\item{shiny.footnotes}{text for shiny app footnote. When given as a list, 
citation can be inserted by specifying author, title, journal, volume, 
page, year, doi, link. See example below.}

\item{shiny.dir}{specify directory to create the shiny app in. Default is 
to create a new directory named "shinyApp"}

\item{enableSubset}{specify whether to enable "Toggle to subset cells" 
functionality in the shiny app. Default is to enable this functionality}

\item{defPtSiz}{specify default point size for single cells. For example, a 
smaller size can be used if you have many cells in your dataset}

\item{ganalytics}{Google analytics tracking ID (e.g. "UA-123456789-0")}

\item{default.gene1}{specify primary default gene to show}

\item{default.gene2}{specify secondary default gene to show}

\item{default.multigene}{character vector specifying the default genes to 
show in bubbleplot / heatmap}

\item{default.dimred}{character vector specifying the two default dimension 
reductions. Default is to use UMAP if not TSNE embeddings}

\item{markers.all}{boolean flag as to whether to create the 
"Cluster Markers, All" tab and prepare associated Seurat data}

\item{markers.top20}{boolean flag as to whether to create the
"Cluster Markers, Top 20" tab and prepare associated Seurat data}

\item{de.genes}{boolean flag as to whether to create the "Diff. Exp. Genes"
tab and prepre associated Seurat data}

\item{gene.ranks}{boolean flag as to whether to create the "Gene Signature"
tab and prepare the associated Seurat data}

\item{volc.plot}{boolean flag as to whether to create the 
"Diff. Gene Exp., Volcano" tab and prepare associated Seurat data}

\item{volc.plot.max.unique}{for other data columns existing within the volcano plot dataset, the maximum
number of unique values allowed for use within the app (this is to avoid crashing the app by having too
many checkbox objects load when subsetting the column)}

\item{gene.ont}{boolean flag as to whether to create the "ToppGene Ontology"
tab and prepate the associated Seurat data}

\item{pval.cutoff}{upper limit of pval to filter cluster gene expression by (pvals
greater than this are filtered out)}

\item{num.genes}{max number of most expressed genes to include in ToppGene query}
}
\value{
directory containing shiny app
}
\description{
Make a shiny app based on the shinycell config data.table and single-cell 
data object.
}
\examples{
# Example citation
citation = list(
  author  = "Liu X., Ouyang J.F., Rossello F.J. et al.",
  title   = "",
  journal = "Nature",
  volume  = "586",
  page    = "101-107",
  year    = "2020", 
  doi     = "10.1038/s41586-020-2734-6",
  link    = "https://www.nature.com/articles/s41586-020-2734-6")
makeShinyApp(seu, scConf, 
             shiny.title = "scRNA-seq Shiny app",
             shiny.dir = "shinyApp/", shiny.footnotes = citation,
             default.gene1 = "NANOG", default.gene2 = "DNMT3L",
             default.multigene = c("ANPEP","NANOG","ZIC2","NLGN4X","DNMT3L",
                                   "DPPA5","SLC7A2","GATA3","KRT19"),
             default.dimred = c("UMAP_1", "UMAP_2")) 

}
\author{
John F. Ouyang, Drew Moore
}
