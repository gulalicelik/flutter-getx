import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get.dart';

class SayacController extends GetxController {
  var _sayac = 0.obs;

  get sayac => _sayac.value;

  set sayac(deger) => _sayac.value = deger;

  void arttir() {
    sayac = sayac + 1;
    Get.snackbar('Tebrikler', 'Sayacı ne kadar güzel atırdın öyle');
  }

  void azalt() {
    sayac = sayac - 1;
    Get.showSnackbar(GetBar(
      title: 'Tebrikler',
      message: 'sayacı harika azalttın',
      duration: Duration(seconds: 4),
      isDismissible: true,
      dismissDirection: SnackDismissDirection.HORIZONTAL,
    ));
  }
}
