import 'dart:io';

void main() {
  double r;

  print('Enter number of r:');
  r = double.parse(stdin.readLineSync()!);

  calCircle(r);
}

void calCircle(double r) {
  const double pi = 3.14;
  double area, perimeter;

  area = pi * r * r;
  perimeter = 2 * pi *r;
  
  print('Area of circle: $area');
  print('Perimeter of circle: $perimeter');
}




  