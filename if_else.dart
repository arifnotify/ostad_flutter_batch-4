void main() {
  List<int> gdes = [85, 92, 78, 65, 88, 72];
  int s = 0;
  for (int grade in gdes) {
    s += grade;
  }

  int average = (s / gdes.length).round();
  print("Student's average grade: $average");
  print("Rounded average: $average");
  if (average >= 70) {
    print("Passed");
  } else {
    print("Failed");
  }
}