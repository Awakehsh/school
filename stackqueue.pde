final int CAPACITY = 40 ;
class Stack {
  int size ;
  int[] container ;
  Stack() {
    size = 0 ;
    container = new int[CAPACITY] ;
  }
  void push(int v) {
    container[size] = v ;
    size++ ;
  }
  int pop() {
    size-- ;
    return container[size] ;
  }
  boolean isEmpty() {
    return (size == 0) ;
  }
  String toString() {
    if (isEmpty()) return "[ ]" ;
    String stg = str(container[0]) ;
    for (int i = 1 ; i < size ; i++) {
      stg += ", " + str(container[i]) ;
    }
    return "[ " + stg + " ]" ;
  }
}

class Queue {
  int head ;
  int tail ;
  int[] container ;
  Queue() {
    head = tail = 0 ;
    container = new int[CAPACITY] ;
  }
  void enqueue(int v) {
    container[tail] = v ;
    tail++ ;
  }
  int dequeue() {
    int v = container[head] ;
    head++ ;
    return v ;
  }
  boolean isEmpty() {
    return (head == tail) ;
  }
}