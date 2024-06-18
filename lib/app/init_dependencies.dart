import 'package:lookup/core/constants/app_constants.dart';

Future appInit({required AppEnv appEnv}) async {
  Constants.appEnv = appEnv;

  if (appEnv != AppEnv.PROD) Constants.appName = "Rps Remit ${appEnv.name}";
}
