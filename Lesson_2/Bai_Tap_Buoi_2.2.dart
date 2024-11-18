import 'dart:math';

List<double>? quadratic(double a, double b, double c) {
  if (a == 0) {
    if (b == 0) {
      if (c == 0) {
        return null;
      }
    } else {
      return [-c / b];
    }
  }
  double delta = b * b - 4 * a * c;
  if (delta < 0)
    return null;
  else if (delta == 0) {
    double x = -b / (2 * a);
    return [x];
  } else {
    double x1 = (-b + sqrt(delta) / (2 * a));
    double x2 = (-b - sqrt(delta) / (2 * a));
    return [x1, x2];
  }
}

void main() {
  List<double>? result = quadratic(1, 3, -2);
  if (result?.length == null)
    print('Phương trình vô số nghiệm.');
  else if (result?.length == 1)
    print('Phương trình có nghiệm kép là $result');
  else
    print('Phương trình có 2 nghiệm phân biệt là $result');
}
