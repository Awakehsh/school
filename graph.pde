class Graph {
  NodeSet nodeSet;
  EdgeSet edgeSet;
  int[][] adjMatrix;
  Node rootNode;
  int[][] adjList;
  int[] parents;
  
  Graph(NodeSet nodeSet, EdgeSet edgeSet,Node rootNode) {
    this.nodeSet = nodeSet;
    this.edgeSet = edgeSet;
    this.rootNode = rootNode;
    adjMatrix = getAdjMatrix();
    adjList = getAdjList();
    parents = getParents();
  }
  
  int[][] getAdjMatrix() {
    int [][]adjMatrix= new int[nodeSet.size()][nodeSet.size()];
    for (int i = 0; i < nodeSet.size(); i++) {
      for (int j = 0; j < nodeSet.size(); j++) {
        adjMatrix[i][j] = 0;
      }
    }
    for (int i = 0; i < edgeSet.size(); i++) {
      Edge edge = edgeSet.get(i);
      adjMatrix[edge.startNode.index][edge.endNode.index] = edge.capacity;
    }
    
    return adjMatrix;
  }
  
  int[][] getAdjList() {
    int[][] adjList = new int[nodeSet.size()][];
    for (int i = 0; i < nodeSet.size(); i++) {
        IntList list = new IntList();
        for (int j = 0; j < edgeSet.size(); j++) {
            Edge edge = edgeSet.get(j);
            if (i == edge.startNode.index) {
                list.append(edge.endNode.index);
            }
        }
        adjList[i] = list.array();
    }
    return adjList;
  }
  
  int[] BFS() {
    int n = adjList.length;
    //すべての頂点を未発見にしておく
    int[] nodeStatus = new int[n] ;
    for (int v = 0; v < n; v++) {
      nodeStatus[v] = UNDISCOVERED ;
    }
    //自身の頂点の親を-1としておく
    int []parents=new int[n];
    for (int v=0; v<n; v++) {
      parents[v]=-1;
    }
    nodeStatus[rootNode.index] = DISCOVERED ;
    Stack s=new Stack();
    s.push(rootNode.index);
    //探索の開始
    while (! s.isEmpty()) {
      int v = s.pop() ;
      for (int x : adjList[v]) {
        if (nodeStatus[x] != UNDISCOVERED) continue ;
        nodeStatus[x] = DISCOVERED ;
        s.push(x) ;
        parents[x] = v ;
      }
      nodeStatus[v] = PROCESSED ;
    }
    return parents;
  }
    int[] DFS() {
    int n=adjList.length;
    // すべての頂点を未発見にしておく
    int[] nodeStatus = new int[n] ;
    for (int v = 0; v < n; v++) {
      nodeStatus[v] = UNDISCOVERED ;
    }
    // 自身の頂点の親を-1としておく
    int []parents=new int[n];
    for (int v=0; v<n; v++) {
      parents[v]=-1;
    }
    nodeStatus[rootNode.index] = DISCOVERED ;
    Queue s=new Queue();
    s.enqueue(rootNode.index);
    // 探索の開始
    while (! s.isEmpty()) {
      int v = s.dequeue() ;
      for (int x : adjList[v]) {
        if (nodeStatus[x] != UNDISCOVERED) continue ;
        nodeStatus[x] = DISCOVERED ;
        s.enqueue(x) ;
        parents[x] = v ;
      }
      nodeStatus[v] = PROCESSED ;
    }
    return parents;
  }

  int[] getParents() {
    int[] parents;
    if (isBFS) {
      parents = BFS();
    } else {
      parents = DFS();
    }
    return parents;
  }

  void printInfo() {
    nodeSet.printNodes();
    edgeSet.printEdges();
  }

  void printAdjMatrix() {
    int size= nodeSet.size();
    for (int i = 0; i < size; i++) {
      for (int j = 0; j < size; j++) {
        if(j==0) print("{");
        print(adjMatrix[i][j]);
        if(j<size-1) print(",");
        else print("}");
      }
      println();
    }
  }

  void printAdjList() {
    println("Adjacency List:");
    for (int i = 0; i < adjList.length; i++) {
        print("Node " + nodeSet.get(i).id + ": ");
        for (int j = 0; j < adjList[i].length; j++) {
            print(nodeSet.get(adjList[i][j]).id + " ");
        }
        println();
    }
  }

  void printParents() {
    print("Parents: by ");
    if(isBFS) println("BFS search:");
    else println("DFS search:");
    for (int i = 0; i < parents.length; i++) {
      if (parents[i] == -1) {
        println("Node " + nodeSet.get(i).id + ": " + "-1");
      } else {
        println("Node " + nodeSet.get(i).id + ": " + nodeSet.get(parents[i]).id);
      }
    }
  }
}

 