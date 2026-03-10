final List<int> classScores = [
  33,
  43,
  67,
  32,
  37,
  98,
  73,
  87,
  23,
  78,
  53,
  65,
  44,
  56,
];

int myScore = 99;

bool averageScoreFunc() {
  int averageSum = classScores.reduce((a, b) => a + b);
  int averageScore = averageSum ~/ classScores.length;
  return myScore > averageScore;
}

void main() {
  print(averageScoreFunc());
}
