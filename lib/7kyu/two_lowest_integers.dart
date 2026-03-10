List<int> myNumbers = [5, 8, 3, 6, 4, 7, 3, 21, 54, 8, 9, 2, 3, 4, 6, 3, 6, 3, 4];

List<int> findTwoSmallest(List<int> numbers) {
  if (numbers.length < 2) {
    throw ArgumentError('Нужно как минимум 2 числа');
  }
  
  numbers.sort();
  return numbers.sublist(0, 2);
}

void main () {
  print(findTwoSmallest(myNumbers));
}

// int sumTwoSmallestNumbers(List<int> nums) {
//   int n1 = nums.reduce(min);
//   nums.remove(n1);
//   int n2 = nums.reduce(min);
//   return n1 + n2;
// }