import 'package:gestion_finance/utilities/auth_services.dart';

class GFPrets {
  String? uid;
  double capital = 0;
  String? userUid = authServices.currentUser.uid;
  GFPrets(this.capital);
}
