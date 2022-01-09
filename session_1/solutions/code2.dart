import 'dart:io';

bool checker(int num){
  int cnt = 0;
  for (int i = 2; cnt < 2 && i * i <= num; ++i) {
    while (num % i == 0) {
      num ~/= i;
      ++cnt;
    }
  }
  if (num > 1)
  ++cnt;
  return cnt == 2;
}

void main(){
  print("Enter number");
  int num;
  String repeat = "Y";
  while(repeat != "N") {
    num  = int.parse(stdin.readLineSync().toString());
    print(checker(num));
    print("Run again? Y or N");
    repeat = stdin.readLineSync().toString();
  }
}