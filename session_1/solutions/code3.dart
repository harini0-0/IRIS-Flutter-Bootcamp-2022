import 'dart:io';

List<bool> prime = List.filled(100, true);

void savePrime() {
  prime[0] = prime[1] = false;
  for (int i = 2; i < 100; i++)
    if (prime[i])
      for (int j = 2 * i; j < 100; j += i)
        prime[j] = false;
}

bool checkArray(List<int> arr, int n) {
  int sum = 0;
  for (int i = 0; i < n; i++) {
    if (prime[arr[i]]) {
      sum += arr[i];
    }
  }
  if (prime[sum]) {
    return true;
  }
  return false;
}

void main() {
  List<int> arr = [];
  int i;
  int n ;
  while(true) {
    i=0;
    print("Array length");
    n = int.parse(stdin.readLineSync().toString());
    print("Array elements");
    while (i != n) {
      arr.add(int.parse(stdin.readLineSync().toString()));
      i++;
    }
    savePrime();
    if (checkArray(arr, n))
      print("Yes");
    else
      print("No");
    print("Run again? Y or N");
    if (stdin.readLineSync().toString() == 'N') {
      break;
    }
  }
}
