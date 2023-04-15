import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meman/core/app_constants.dart';
import 'package:meman/core/utils/preference_manager.dart';
import 'package:meman/data/model/userprofile/user_profile.dart';

class AuthLocalDataSource {
  final PreferenceManager _prefsManager;

  AuthLocalDataSource(this._prefsManager);

  UserProfile? getUserProfile() {
    final localUser = _prefsManager.getJsonMap(AppConstants.prefsUserKey);
    print("Local: $localUser");
    if (localUser.isEmpty) return null;
    return UserProfile.fromJson(localUser);
  }

  void saveUserProfile(UserProfile userProfile) {
    _prefsManager.saveJsonMap(AppConstants.prefsUserKey, userProfile.toJson());
  }

  void clearUser() {
    _prefsManager.prefs.clear();
  }

  static final provider = Provider<AuthLocalDataSource>(
      (ref) => AuthLocalDataSource(ref.watch(PreferenceManager.provider)));
}
