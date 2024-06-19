import '../../features/personalization/models/user_model.dart';

class Core {
  static UserModel? _user;

  UserModel? get user => _user;

  Future<void> setUserData() async {
    // loads user data from shared preferences and sets it to
    // [user]
  }
}
