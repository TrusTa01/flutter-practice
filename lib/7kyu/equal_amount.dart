bool XO(str) {
  String lowerStr = str.toLowerCase();
  int countX = lowerStr.split('x').length - 1;
  int countO = lowerStr.split('o').length - 1;
  return countX == countO;
}

void main() {
  print(XO('xo'));
  print(XO('xoo'));
}

// bool XO(String str) {
//    return str.toLowerCase().split("x").length==str.toLowerCase().split("o").length;
// }