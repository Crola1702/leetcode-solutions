// https://leetcode.com/problems/two-sum/

List<int> twoSum(List<int> nums, int target) {
  var hash = <int, int>{};
  for (int i = 0; i < nums.length; i++) {
    if (hash.containsKey(target - nums[i])) {
      print("Return ${[i, hash[target - nums[i]]!]}");
      return [hash[target - nums[i]]!, i];
    }
    hash[nums[i]] = i;
  }
  return [];
}

void main() {
  // Test cases
  print(twoSum([2, 7, 11, 15], 9)); // [0, 1]
  print(twoSum([3, 2, 4], 6)); // [1, 2]
  print(twoSum([3, 3], 6)); // [0, 1]
}
