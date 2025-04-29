import 'dart:convert';

import 'package:commerce/constants.dart';
import 'package:commerce/core/services/shared_preferences_singleton.dart';
import 'package:commerce/features/auth/data/models/user_model.dart';
import 'package:commerce/features/auth/domain/entites/user_entity.dart';

UserEntity getUser() {
  var jsonString = Prefs.getString(kUserData);
  var userEntity = UserModel.fromJson(jsonDecode(jsonString));
  return userEntity;
}
