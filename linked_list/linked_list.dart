class Node<T> {
  Node({required this.value, this.next});

  T value;
  Node<T>? next;

  // Note: When a method calls itself, this is known as recursion. A recursive
  // method must have a base case, which is its exit strategy so that the method
  // doesn’t keep calling itself forever. In the example above, the base case is when
  // the next node is null .

  @override
  String toString() {
    if (next == null) return '$value';
    return '$value -> ${next.toString()}';
  }
}

class LinkedList<E> {
  LinkedList(this.head, this.tail);

  Node<E>? head;
  Node<E>? tail;

  bool get isEmpty => head == null;

  void push(E value) {
    head = Node(value: value, next: head);
    tail ??= head;
  }

  void append(E value) {
// 1
    if (isEmpty) {
      push(value);
      return;
    }
// 2
    tail!.next = Node(value: value);

// 3
    tail = tail!.next;
  }

  Node<E>? nodeAt(int index) {
// 1
    var currentNode = head;
    var currentIndex = 0;

// 2
    while (currentNode != null && currentIndex < index) {
      currentNode = currentNode.next;
      currentIndex += 1;

      return currentNode;
    }
    return null;
  }

  Node<E> insertAfter(Node<E> node, E value) {
// 1
    if (tail == node) {
      append(value);
      return tail!;
    }

// 2
    node.next = Node(value: value, next: node.next);
    return node.next!;
  }

  @override
  String toString() {
    if (isEmpty) return 'Empty list';
    return head.toString();
  }
}

void main() {
  final node1 = Node(value: 1);
  final node2 = Node(value: 2);
  final node3 = Node(value: 3);
  node1.next = node2;
  node2.next = node3;
  // You know that the list is empty if the head is null . Also, since you already designed
  // Node to recursively print any nodes that follow it, you can print the entire linked list
  // just by calling head.toString
  print(node1);
  final linkedList = LinkedList(node1, node3);
  final linkedList1 = LinkedList(null, null);
  print(linkedList);
  print(linkedList1);
  final list = LinkedList<int>(null, null);
  list.push(3);
  list.push(2);
  list.push(1);
  print(list);
  list.append(1);
  list.append(2);
  list.append(3);
  print(list);
  final anotherList = LinkedList<int>(null, null);
  anotherList.push(4);
  anotherList.push(5);
  anotherList.push(6);
  print('Before: $anotherList');
  var middleNode = anotherList.nodeAt(1)!;
  anotherList.insertAfter(middleNode, 42);
  print('After:$anotherList');
}
