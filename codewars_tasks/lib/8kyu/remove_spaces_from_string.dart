String string = '8 j 8   mBliB8g  imjB8B8  jl  B';

void main() {
  String removeSpacesFromString(String i) {
    return i.replaceAll(' ', '');
  }
 print(removeSpacesFromString(string));
}


// String noSpace(String x) {
//   return x.replaceAll(' ', '');
// }