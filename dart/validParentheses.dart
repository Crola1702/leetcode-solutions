bool isValid(String s) {
  var stack = [];
  var open = ['[', '(', '{'];
  var closed = [']', ')', '}'];

  for (int i = 0; i < s.length; i++) {
    if (open.contains(s[i])) {
      stack.add(open.indexOf(s[i])); // 0, 1, 2 for each type of bracket
    } else if (closed.contains(s[i])) {
      if (stack.isEmpty) { return false; }
      if (stack.last != closed.indexOf(s[i])) { return false; }
      stack.removeLast();
    }
    print(stack);
  }
  return stack.isEmpty;
}

void main() {
}
