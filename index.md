## Plotting Abramson's (2018) Trump-Russia Network

We are a group of political science PhD students at the University of North Carolina - Chapel Hill who set out to plot the network of relationships described in attorney and professor Seth Abramson's 2018 book *Proof of Collusion*. Our aim was to see if constructing such a plot could be a useful tool to visualize the book's narrative and its over 300-person cast of characters. In so doing we hoped to also provide a useful tool to visualize and understand the political events and relationships leading up to and culiminating in the 2016 election. This website provides the results of this effort, i.e. the interactive dynamic and static network plots, and the data and code required to replicate the plots (links below). 

### Dynamic network plot (1973-2019)

The dynamic network plot plays the evolution of relationships over time, beginning in 1973 and ending in 2019. 

The plot has several interactive features:
+ Clicking a node lets you view the name of the person and their country affiliation
+ Clicking a link between nodes lets you view text from the book about the relationship (with years of interaction and page numbers included).
+ Double clicking a node will keep the node highlighted and label as the plot plays

<a href="trump-russia-dynamic.html" title="Trump network">Click to view the dynamic network </a>

### Static network plots

The static network plots below show the same nodes and connections as in the dynamic plot but at particular time periods (as of 1990, 2000, 2005, 2010, and 2019). The plots for particular time periods were created by subsetting the full network to only include the nodes/links in the network as of that particular year.

The plots have several interactive features, some additional to the dynamic plot:
+ Clicking on the nodes and links again provides infromation about the nodes/links
+ Selecting a node on the plot highlights that node and its closest connections
+ Selecting a node from the dropdown menu (alphabetized) will highlight that node and its closest connections
+ Nodes can be moved around for better visualization

<a href="trump-russia-static.html" title="Trump network">Click to view the full static network </a><br/>
<a href="stat-plot-1990.html" title="Trump network">Click to view the 1990 static network </a><br/>
<a href="stat-plot-2000.html" title="Trump network">Click to view the 2000 static network </a><br/>
<a href="stat-plot-2005.html" title="Trump network">Click to view the 2005 static network </a><br/>
<a href="stat-plot-2010.html" title="Trump network">Click to view the 2010 static network </a><br/>

### Tutorial: methods, code, & additional analysis

Click here to view a short tutorial that provides more information about how we compiled the data from the book, the code used to create the plots, and some additional analyses using the network data.

### Download our replication files

A .zip file of our data and replication code can be found at the link to the GitHub repository on the left of the screen. 
