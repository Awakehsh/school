class Edge {
  Node startNode;
  Node endNode;
  int capacity;

  Edge(Node startNode, Node endNode, int capacity) {
    this.startNode = startNode;
    this.endNode = endNode;
    this.capacity = capacity;
  
  }
}
class EdgeSet extends ArrayList<Edge> {
  EdgeSet(int[][] edgeData, NodeSet nodeSet) {
    for (int[] edgeInfo : edgeData) {
      addEdge(nodeSet.get(edgeInfo[0]), nodeSet.get(edgeInfo[1]), edgeInfo[2]);
    }
  }

  void addEdge(Node startNode, Node endNode, int capacity) {
    this.add(new Edge(startNode, endNode, capacity));
  }

  void printEdges() {
    print("Edges: {");
    for (int i = 0; i < this.size(); i++) {
      Edge edge = this.get(i);
      print("{" + edge.startNode.id + ", " + edge.endNode.id + ", " + edge.capacity + "}");
      if (i < this.size() - 1) {
        print(", ");
      }
    }
    println("}");
  }
 
}