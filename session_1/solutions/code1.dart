import 'dart:io';

void fibi(int N){
  int n1 = 1, n2 = 1, n3;
  print(n1);
  print(n2);
  while(N-2 != 0){
    n3 = n1+n2;
    print(n3);
    N--;
    n1 = n2;
    n2 = n3;
  }
}

void main() {
  print('Enter Number');
  int num = int.parse(stdin.readLineSync().toString());
  fibi(num);
}

