library("igraph")
edgelistFile<-read.table("edge_list.txt")
g=graph.data.frame(edgelistFile, directed=T)
g = set_edge_attr(g, 'weight', index = E(g), E(g)$V3)
result<-page_rank(g, vids = V(g), directed = TRUE, d = 0.85, personalized = NULL, weights = NULL, options = NULL)$vector
top10<-head(sort(result, decreasing=TRUE), 10)
pr_results = c()
for( i in 1:10)
{
  vname<-names(top10[i])
  idname<-which(V(g)$name == vname)
  pr_results = c(pr_results,vname)
}
saveRDS(pr_results,file = 'pr_results.rds')

con <- file("artists.txt", open = "r")
lines <- readLines(con)
for(i in 1:length(pr_results))
{
  print(lines[as.numeric(pr_results[i])+1])
}


