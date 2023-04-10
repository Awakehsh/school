class Node {
  String id;
  int index;
  Node(String id) {
    this.id = id;
  }
}

class NodeSet extends ArrayList<Node> {
  NodeSet(String[] ids) {
    for (String id : ids) {
      addNode(id);
    }
  }

  void addNode(String id) {
    Node newNode = new Node(id);
    this.add(newNode);
    setIndex();
  }
  
  void setIndex(){
    for (int i = 0; i < this.size(); i++) {
      this.get(i).index = i;
    }
  }

  void printNodes() {
    print("Nodes: {");
    for (int i = 0; i < this.size(); i++) {
      print(this.get(i).id);
      if (i < this.size() - 1) {
        print(", ");
      }
    }
    println("}");
  }
  Node getNode(String id) {
    for (Node node : this) {
      if (node.id.equals(id)) {
        return node;
      }
    }
    return null; 
  }
}
