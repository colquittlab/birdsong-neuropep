source("~/nest/rstudio/utils/go.R")

go_ids = c("GO:0005184", #neuropeptide hormone activity,
           #"GO:0007218", #neuropeptide signaling pathway
           "GO:0071855", #neuropeptide receptor binding
           "GO:0160041", #neuropeptide activity
           #"GO:0042923", #neuropeptide binding
          "GO:0008188",  #neuropeptide receptor activity
          #"GO:0017046", #peptide hormone binding
          #"GO:0005179",  # hormone activity
          #"GO:0009755", #hormone-mediated signaling pathway
          "GO:0001635", #	calcitonin gene-related peptide receptor activity
          "GO:0015056", #corticotrophin-releasing factor receptor activity	
          "GO:0004995", #tachykinin receptor activity
          "GO:0038170" #somatostatin signaling pathway

           )

httr::set_config(httr::config(ssl_verifypeer = FALSE))
ensembl = get_ensembl()
genes = map(go_ids, function(go_id) get_genes_by_go(go_id, ensembl)) %>% unlist() %>% unique()
genes = c(genes, "CRHBP",  "NPY2R", "NPY5R", "OPRK1", "OPRM1", "PDYN", "TAC1", "TAC3", "CCKBR", "VIPR1", "VIPR2", "NTSR1", "ADCYAP1R1")
df = gene_symbol_to_entrez(genes)
df = df %>% filter(SYMBOL!="")
fname = "~/nest/gene_lists/neuropeptide_related_genes.txt"
write_delim(df, fname, delim = "\t")
#genes = c(genes, "VIPR2")
