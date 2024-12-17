import 'package:hive_flutter/hive_flutter.dart';
import 'package:track_it/presentation/auth/data/exceptions/custom_exceptions.dart';
import 'package:track_it/presentation/auth/data/models/user.dart';

class AuthDb {
  AuthDb();

  static AuthDb? _instance;
  late Box<User> userBox;

  static Future<AuthDb> getInstance() async {
    if (_instance == null) {
      _instance = AuthDb();
      await _instance!._init();
    }
    return _instance!;
  }

  Future<void> _init() async {
    userBox = await Hive.openBox<User>('users');
  }

  Future<User> storeUserDetails(User user) async {
    try {
      await userBox.put(user.uuid, user).then((_) {
        return user;
      });
      throw const ShowException('Something went wrong');
    } catch (e) {
      throw const ShowException('Something went wrong');
    }
  }

  Future<User?> getUserDetails(String uuid) async {
    try {
      return userBox.get(uuid);
    } catch (e) {
      throw const ShowException('Something went wrong');
    }
  }

  Future<void> deleteUserDetails(String uuid) async {
    try {
      await userBox.delete(uuid);
    } catch (e) {
      throw const ShowException('Something went wrong');
    }
  }
}
