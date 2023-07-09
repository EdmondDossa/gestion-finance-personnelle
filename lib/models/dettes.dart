import 'package:gestion_finance/utilities/auth_services.dart';

class GFDettes {
  String? uid;
  double capital = 0;
  String? userUid = authServices.currentUser.uid;
  GFDettes(this.capital);
}
