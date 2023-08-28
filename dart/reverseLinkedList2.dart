// From https://leetcode.com/problems/reverse-linked-list-ii/

class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);

  @override
  String toString() {
    var result = "[$val";
    var current_node = this;
    while (current_node.next != null) {
      current_node = current_node.next!;
      result += ", ${current_node.val}";
    }
    result += "]";
    return result;
  }
}

ListNode? reverseBetween(ListNode? head, int left, int right) {
  if (head?.next == null) { return head; }

  var i = 1; // Index. Starting from 1
  var result = ListNode();

  var current_result_node = result;
  var current_head_node = head;

  // Copy until left
  for (i; i<left; i++) {
    current_result_node.val = current_head_node!.val;

    current_head_node = current_head_node.next;
    current_result_node.next = ListNode();
    current_result_node = current_result_node.next!;
  }

  // Reverse sublist
  var stack = [];
  while (i <= right) {
    stack.add(current_head_node!.val);

    current_head_node = current_head_node.next;
    i += 1;
  }

  while (true) {
    current_result_node.val = stack.removeLast();

    if (stack.isEmpty) {
      break;
    }

    current_result_node.next = ListNode();
    current_result_node = current_result_node.next!;
  }

  // Copy after right
  var end = current_head_node == null;

  if (!end) {
    current_result_node.next = ListNode();
    current_result_node = current_result_node.next!;
  }

  while (!end) {
    current_result_node.val = current_head_node!.val;

    current_head_node = current_head_node.next;
    if (current_head_node != null) {
      current_result_node.next = ListNode();
      current_result_node = current_result_node.next!;
    } else {
      break;
    }
  }

  return result;
}

void main() {
  // Test cases
  var head = ListNode(1, ListNode(2));
  print(reverseBetween(head, 1, 2)); // [2, 1]

  head = ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(5)))));
  print(reverseBetween(head, 2, 4)); // [1, 4, 3, 2, 5]

  head = ListNode(5);
  print(reverseBetween(head, 1, 1)); // [5]
}
