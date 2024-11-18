int UCLN(int a, int b) {
  while (b != 0) {
    int temp = b;
    b = a % b;
    a = temp;
  }
  return a;
}

int BCNN(int a, int b) =>  (a * b) ~/ UCLN(a, b);

void main(){
  int a = 20, b = 54;
  int result_UCLN = UCLN(a,b);
  int result_BCNN=BCNN(a,b);
  print('UCLN: $result_UCLN');
  print('BCNN: $result_BCNN');
}