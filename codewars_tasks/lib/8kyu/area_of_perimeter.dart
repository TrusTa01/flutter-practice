void main () {

int area_or_perimeter(int l, int w) {
  if(l == w) {
   return l * w;
  } else {
   return  (l + w) * 2;
  }
}
print(area_or_perimeter(6, 10));
}