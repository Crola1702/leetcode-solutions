// From https://leetcode.com/problems/longest-substring-without-repeating-characters/

import 'dart:math';

int lengthOfLongestSubstring(String s) {
  if (s.length == 1) {
    return 1;
  }
  var result = 0;

  var i = 0;
  for (int c = 0; c < s.length; c++) {
    var isPresent = s.substring(i, c).indexOf(s[c]);
    if (isPresent != -1) {
      i += isPresent + 1;
    }
    result = max(result, c - i + 1);
  }
  return result;
}

void main() {
  // Test cases
  print(lengthOfLongestSubstring("abcabcbb")); // 3
  print(lengthOfLongestSubstring("bbbbb")); // 1
  print(lengthOfLongestSubstring("pwwkew")); // 3
  print(lengthOfLongestSubstring("")); // 0
  print(lengthOfLongestSubstring("abcdefg")); // 7
}
