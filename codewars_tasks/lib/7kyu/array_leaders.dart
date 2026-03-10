final List<int> myArray = [16, 17, 4, 3, 5, 2];

List<int> arrayLeaders(List<int> numbers) {
  List<int> leaders = [];
  int rightSum = 0;

  for (int i = numbers.length - 1; i >= 0; i--) {
    int currentElement = numbers[i];

    if (currentElement > rightSum) {
      leaders.insert(0, currentElement);
    }
    rightSum += currentElement;
  }
  return leaders;
}

void main() {
  print(arrayLeaders(myArray));
}
