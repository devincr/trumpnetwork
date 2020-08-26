### Clear environment
rm(list = ls(all.names = TRUE))

### Install packages:
library(rio)
# library(networkDynamic)
# library(ndtv)
# library(network)
# library(visNetwork)

####### READ IN STATIC PLOT DATA TO CONVERT TO DYNAMIC PLOT DATA ######

# read in nodes data & clean
nodes.plot <- import("nodes-stat.csv")
nodes2 <- subset(nodes.plot, select = c(id, group, country))
colnames(nodes2) <- c("name","country.label", "country.name")
nodes2$country.type <- ifelse(nodes2$country.label == "united states", 3,
                              ifelse(nodes2$country.label == "russia", 2, 1))
nodes2$id <- paste0("s", rep(1:length(nodes2$name)))
nodes2$id <- paste0("s", formatC(as.numeric(substring(nodes2$id, 2, nchar(nodes2$id))), flag = "0", format = "d", width = 3))
nodes2 <- subset(nodes2, select = c(id, name, country.type, country.label, country.name))

nodes2 <- as.data.frame(nodes2)

nodes2$labels <- ifelse(nodes2$name == "Donald Trump", "Donald Trump",
                        ifelse(nodes2$name == "Vladimir Putin", "Vladimir Putin",
                               ifelse(nodes2$name == "Felix Sater", "Felix Sater",
                                      ifelse(nodes2$name == "Michael Cohen", "Michael Cohen", 
                                             ""))))

# read in links data & clean
edges.plot <- import("links-stat.csv")
links2 <- subset(edges.plot, select = c(from, to, title, width))
edgeinfo <- subset(edgeinfo, !is.na(`i-j edge for verification`))
links2$year <- edgeinfo$`date 1-year`
links2$year <- as.numeric(links2$year)
links2$year[is.na(links2$year)] <- 2016
links2$period <- as.numeric(as.factor(links2$year))
links2$from.id <- nodes2$id[match(links2$from, nodes2$name)]
links2$to.id <- nodes2$id[match(links2$to, nodes2$name)]
#links2 <- sort(links2)
links2 <- subset(links2, select = c(from.id, to.id, title, width, year, period))
colnames(links2) <- c("from", "to", "description","width","year","period")
links2 <- as.data.frame(links2)

links2$from <- paste0("s", formatC(as.numeric(substring(links2$from, 2, nchar(links2$from))), flag = "0", format = "d", width = 3))
links2$to <- paste0("s", formatC(as.numeric(substring(links2$to, 2, nchar(links2$to))), flag = "0", format = "d", width = 3))

links2 <- links2[with(links2, order(period, from, to)),]

# export data
export(nodes2, "nodes-dyn.csv")
export(links2, "links-dyn.csv")


 
# # create network object
# net2 <- network(links2, vertex.attr=nodes2, matrix.type="edgelist",
#                 loops=F, multiple=F, ignore.eval = F)
# 
# # add (transparent) colors for countries
# mygray <- rgb(190, 190, 190, max = 255, alpha = 175, names = "mygray")
# mycoral <- rgb(240, 128, 128, max = 255, alpha = 175, names = "mycoral")
# myblue <- rgb(173, 216, 230, max = 255, alpha = 175, names = "myblue")
# net2 %v% "col" <- c("#BEBEBEAF", "#F08080AF", "#ADD8E6AF")[net2 %v% "country.type"]
# 
# # set one period beyond the max period (period = factored years)
# term <- max(links2$period) + 1
# 
# minterm <- min(links2$year)
# maxterm <- max(links2$year) + 1
# 
# # sets the nodes in the network as active throughout time 0 to max period
# vs2 <- data.frame(onset = minterm, terminus= maxterm, vertex.id=1:(length(nodes2$id)))
# 
# # edges of the network appear one by one, each is active from their first activation til max time period
# es2 <- data.frame(onset=links2$year, terminus= maxterm,
#                   head=as.matrix(net2, matrix.type="edgelist")[,1],
#                   tail=as.matrix(net2, matrix.type="edgelist")[,2])
# 
# # create dynamic network
# net2.dyn <- networkDynamic(base.net=net2, edge.spells=es2, vertex.spells=vs2)
# 
# # compute animation and plot
# compute.animation(net2.dyn, animation.mode = "kamadakawai",
#                   slice.par=list(start= minterm, end= maxterm, interval=1,
#                                  aggregate.dur=1, rule='all'))
# 
# # saves an HTML file to the directory - open the file to view the plot
# render.d3movie(net2.dyn, usearrows = F,
#                displaylabels = T, label=net2 %v% "labels", label.cex = .7,
#                bg="#ffffff", vertex.border="#333333",
#                vertex.cex = log(degree(net2)+1)/2.5,
#                vertex.col = net2.dyn %v% "col",
#                edge.lwd = (net2.dyn %e% "width")/3,
#                edge.col = '#55555599',
#                vertex.tooltip = paste("<b>Name:</b>", (net2.dyn %v% "name") , "<br>",
#                                       "<b>National affiliation:</b>", (net2.dyn %v% "country.name")),
#                edge.tooltip = paste("<b>Connection:</b>", (net2.dyn %e% "description")),
#                launchBrowser=T, filename="dynamic-network-test2.html",
#                render.par=list(tween.frames = 30, show.time = F),
#                plot.par=list(mar=c(0,0,0,0)), 
#                d3.options = list(animateOnLoad = TRUE), output.mode='HTML')
