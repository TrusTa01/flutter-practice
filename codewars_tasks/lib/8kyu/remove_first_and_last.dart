final List<String> myArray = ['1', '2', '3', '4', '5'];

List<String> newArray(List<String> arr) {
  arr.removeAt(0);
  arr.removeLast();
  return arr;
}

void main() {
  print(newArray(myArray));
}
