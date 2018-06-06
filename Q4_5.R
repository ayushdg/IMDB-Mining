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
  actor = lines[as.numeric(pr_results[i])+1]
  print(actor_movie_hash$X1[which(actor_movie_hash$X...Claw == actor)])
}
new_actors = c(
  'Tom Cruise',
  'Emma Watson (II)',
  'George Clooney',
  'Tom Hanks',
  'Dwayne Johnson (I)',
  'Johnny Depp',
  'Will Smith (I)',
  'Meryl Streep',
  'Leonardo DiCaprio',
  'Brad Pitt'
)
result = readRDS('pr_res.rds')
for(i in 1:length(new_actors))
{
  id = which(lines == new_actors[i])
  print(result[toString(id)])
  print(actor_movie_hash$X1[which(actor_movie_hash$X...Claw == new_actors[i])])
}

mapped = c()
pranks = c()
for(i in 1:length(result))
{
  id = names(result[i])
  print(i)
  mapped = c(mapped, c(lines[as.numeric(id)+1]) )    
  pranks = c(pranks,result[[i]])
}
write.csv(mapped, file = "MyData.csv")



which(lines == 'Pitt, Brad')
result["53187"]
degree(g1, v = "53187", mode = c("in"))
which(actor_movie_hash$X...Claw == 'Pitt, Brad')
actor_movie_hash$X1[1533741]
