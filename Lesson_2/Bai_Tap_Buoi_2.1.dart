// ignore_for_file: unused_local_variable
// ignore: duplicate_ignore
// ignore: unused_local_variable, unused_import
import 'dart:io';
double tinh_tien_dien(double so_Dien){
  double tien_dien = 1;
  int _50khwDau = 1678;
  int _50kwhTiepTheo = 1734;
  int _100kwhTiepTheo = 2014;
  int _100kwhTiepTheoNua = 2536;
  int _kwhTiepTheo = 2834;
  if(so_Dien <= _50khwDau){
    tien_dien = so_Dien * _50khwDau;
  }
  else if(so_Dien <= 100){
    tien_dien = (50 * _50khwDau) + ((so_Dien - 50) * _50kwhTiepTheo);
  }
  else if(so_Dien <= 200){
    tien_dien = (50 * _50khwDau) + (50 * _50kwhTiepTheo) + ((so_Dien - 100) * _100kwhTiepTheo);
  }
  else if(so_Dien <= 300){
    tien_dien = (50 * _50khwDau) + (50 * _50kwhTiepTheo) + ((100 * _100kwhTiepTheo) + ((so_Dien - 200) * _100kwhTiepTheoNua));
  }else{
     tien_dien = (50 * _50khwDau) + (50 * _50kwhTiepTheo) + ((100 * _100kwhTiepTheo) + (100 * _100kwhTiepTheoNua) +  (so_Dien - 300) * _kwhTiepTheo);
  }
  return tien_dien;
}
void main(){
    print ('nhập số điện: ');
    double soDien = double.parse(stdin.readLineSync()!);
    double tienDien = tinh_tien_dien(soDien);
    print('$soDien kwh điện có tổng tiền điện là: $tienDien ');
}