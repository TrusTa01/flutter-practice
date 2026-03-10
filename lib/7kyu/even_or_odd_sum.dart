final List<int> myArray = [1, 2, 3];

String oddOrEven(List<int> array) {
  if (array.isEmpty) {
    return 'even';
  }
  int sum = 0;
  for (int number in array) {
    sum += number;
  }
  if (sum % 2 == 0) {
    return 'even';
  }
  return 'odd';
}

void main() {
  print(oddOrEven(myArray));
}


// String oddOrEven(List<int> array) =>array.reduce((a, b) => a + b).isEven ? 'even' : 'odd';