List<int> myList = [9,2,8,7,5,4,0,6];

int minSum(List<int> arr) {
  arr.sort();
  int totalSum = 0;
  int i = 0;
  int j = myList.length - 1;
  while (i < j) {
    int pair = arr[i] * arr[j];
    totalSum += pair;
    i++;
    j--;
  }
  return totalSum;
}

void main() {
  int result = minSum(myList);
  print("Мин сумма: $result");
}
