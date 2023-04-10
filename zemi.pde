Graph graph;
NodeSet nodes;
EdgeSet edges;
Node rootNode;
final int UNDISCOVERED=0;
final int DISCOVERED=1;
final int PROCESSED=2;
boolean isBFS=false;
void setup() {
  String[] nodeArray = {"A", "B", "C", "D", "E"};
  nodes = new NodeSet(nodeArray);
  int[][] edgeArray = {
    {0, 1, 3}, 
    {0, 2, 3}, 
    {1, 2, 2}, 
    {1, 3, 3}, 
    {2, 4, 2}, 
    {3, 4, 3}, 
    {1, 0, 3}, 
    {2, 0, 3}, 
    {2, 1, 2}, 
    {3, 1, 3}, 
    {4, 2, 2}, 
    {4, 3, 3}, 
  };
  edges = new EdgeSet(edgeArray, nodes);
  rootNode=nodes.getNode("A");
  graph = new Graph(nodes, edges, rootNode);
  graph.printInfo();
  graph.printAdjMatrix();
  graph.printAdjList();
  graph.printParents();

}

void draw() {
}


