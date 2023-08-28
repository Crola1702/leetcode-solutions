// From https://leetcode.com/problems/add-two-numbers/

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

ListNode? addTwoNumbers(ListNode? l1, ListNode? l2) {
  var finish = false;
  var result = ListNode();

  var next_number = 0;

  var current_node = result;
  do {
    var l1_val = l1 != null ? l1.val : 0;
    var l2_val = l2 != null ? l2.val : 0;
    var sum = l1_val + l2_val + next_number;
    current_node.val = sum % 10;
    next_number = sum ~/ 10;

    l1 = l1 != null ? l1.next : null;
    l2 = l2 != null ? l2.next : null;

    if (l1 == null && l2 == null) {
      if (next_number == 1) {
        current_node.next = ListNode(1);
      }
      finish = true;
    } else {
      current_node.next = ListNode();
      current_node = current_node.next!;
    }

  } while (!finish);

  return result;
}

void main() {
  // Test cases
  var l1 = ListNode(2, ListNode(4, ListNode(3)));
  var l2 = ListNode(5, ListNode(6, ListNode(4)));
  var result = addTwoNumbers(l1, l2);
  print(result!); // [7, 0, 8]
} 

