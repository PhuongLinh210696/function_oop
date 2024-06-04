import 'dart:io';

void main() {
  int number;

  print('Enter number:');
  number = int.parse(stdin.readLineSync()!);
  print('Factorial of ${number} is: ${factorialOfInt(number)}');
}

int factorialOfInt(int number){
  if(number == 0){
    return 1;
  }else{
    return(number*factorialOfInt(number -1));
  }
}