void main() {
  List<bool> sheep = [
    true,
    true,
    true,
    false,
    true,
    true,
    true,
    true,
    true,
    false,
    true,
    false,
    true,
    false,
    false,
    true,
    true,
    true,
    true,
    true,
    false,
    false,
    true,
    true,
  ];

  int countSheep() {
    int count = 0;
    for (var sheeps in sheep) {
      if (sheeps == true) {
        count++;
      }
    }
    return count;
  }

  print(countSheep());
}

// int countSheep(List<bool?> arr) {
//   return arr.where((s) => s == true).length;
// }