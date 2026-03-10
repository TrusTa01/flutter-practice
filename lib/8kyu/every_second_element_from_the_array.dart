void main() {
  List<dynamic> myList = ["Keep", "Remove", "Keep", "Remove", "Keep"];
  List<dynamic> resultList = removeEveryOther(myList);
  print(resultList); 
}


List<dynamic> removeEveryOther(List<dynamic> originalList) {
  List<dynamic> newList = [];

  for (int i = 0; i < originalList.length; i += 2) {
    newList.add(originalList[i]);
  }
  return newList;
}