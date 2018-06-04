library("igraph")
edgelistFile<-read.table("movie_edge_list.txt")
g=graph.data.frame(edgelistFile, directed=F)
g = set_edge_attr(g, 'weight', index = E(g), E(g)$V3)
comm <-readRDS('fastgreedy_data.rds')
mem = membership(comm)


con <- file("movie_genre.txt", open = "r")
lines <- readLines(con)
for(i in 1:length(lines))
{
  print(i)
  temp <-lines[i]
  temp = iconv(enc2utf8(temp),sub="byte")
  pos = regexpr('\t\t',temp)
  lines[i]<- substr(temp,pos+2,nchar(temp))
}

genre_list = unique(lines)
genre_counts = list()
for(i in 1:10)
{
  genre_counts[[i]] = integer(length(genre_list))
}

for(i in 1:length(mem))
{
  if(mem[i] == 1){
    genre_counts[[1]][(lines[i] == genre_list) ] = genre_counts[[1]][(lines[i] == genre_list)] + 1
  }
  else if(mem[i] == 2){
    genre_counts[[2]][(lines[i] == genre_list) ] = genre_counts[[2]][(lines[i] == genre_list)] + 1
  }
  else if(mem[i] == 3){
    genre_counts[[3]][(lines[i] == genre_list) ] = genre_counts[[3]][(lines[i] == genre_list)] + 1
  }
  else if(mem[i] == 4){
    genre_counts[[4]][(lines[i] == genre_list) ] = genre_counts[[4]][(lines[i] == genre_list)] + 1
  }
  else if(mem[i] == 5){
    genre_counts[[5]][(lines[i] == genre_list) ] = genre_counts[[5]][(lines[i] == genre_list)] + 1
  }
  else if(mem[i] == 6){
    genre_counts[[6]][(lines[i] == genre_list) ] = genre_counts[[6]][(lines[i] == genre_list)] + 1
  }
  else if(mem[i] == 7){
    genre_counts[[7]][(lines[i] == genre_list) ] = genre_counts[[7]][(lines[i] == genre_list)] + 1
  }
  else if(mem[i] == 8){
    genre_counts[[8]][(lines[i] == genre_list) ] = genre_counts[[8]][(lines[i] == genre_list)] + 1
  }
  else if(mem[i] == 9){
    genre_counts[[9]][(lines[i] == genre_list) ] = genre_counts[[9]][(lines[i] == genre_list)] + 1
  }
  else if(mem[i] == 10){
    genre_counts[[10]][(lines[i] == genre_list) ] = genre_counts[[10]][(lines[i] == genre_list)] + 1
  }
}
for(i in 1:10){
  name = paste("plot", toString(i),".png", sep = '')
  png(filename=name, width = 1600)
  barplot(genre_counts[[i]],  names.arg=genre_list, cex.names=0.6,space = 0.5)
  #dev.print(png, file=name);
  dev.off()
}
