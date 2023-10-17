import 'package:get_storage/get_storage.dart';

import '../../../app/util/constants.dart';
import '../../../app/util/util.dart';

enum LocalProviderKeys {
  language, //String
  noorApiToken, //String
  noorApiTokenType, //String
  apiToken, //String
  apiTokenType, //String
  notifications, //int
  userModel, //Json String
  loggedInBySocial, //int
  phoneVerified, //int,
  appTheme, //int  0-> light mode , 1-> dark mode
}

class LocalProvider {
  final GetStorage _box = GetStorage();

  init() async {
    await GetStorage.init();
  }

  String getAppLanguage() => get(LocalProviderKeys.language) ?? Constants.mainAppLanguage;

  String? getNoorUserToken() => get(LocalProviderKeys.noorApiToken);

  String? getNoorUserTokenType() => get(LocalProviderKeys.noorApiTokenType);

  String? getUserToken() => get(LocalProviderKeys.apiToken);

  String? getUserTokenType() => get(LocalProviderKeys.apiTokenType);

  bool isLogged() => get(LocalProviderKeys.noorApiToken) != null;

  bool isAr() => (get(LocalProviderKeys.language) ?? Constants.mainAppLanguage) == 'ar';

  bool isDarkMode() => get(LocalProviderKeys.appTheme) == 1;

  bool isAllowingNotifications() => get(LocalProviderKeys.notifications) == 1;

  /// ============= ============== ===================  =================
  Future save(LocalProviderKeys localProviderKeys, dynamic value) async {
    await GetStorage().write(localProviderKeys.name, value);
    Utils.logMessage('Setting value to ${localProviderKeys.name} => $value');
  }

  dynamic get(LocalProviderKeys localProviderKeys) {
    dynamic value = GetStorage().read(localProviderKeys.name);
    // Utils.logMessage('Getting value of ${localProviderKeys.name} => $value');
    return value;
  }

  Future<void> signOut() async {
    await _box.erase();
  }
}
