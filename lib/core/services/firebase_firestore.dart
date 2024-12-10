import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:commerce/core/services/database_services.dart';
import 'package:commerce/feature/auth_feature/data/model/user_model.dart';
import 'package:commerce/feature/auth_feature/domain/entity/user_entity.dart';
import 'package:commerce/shared/constants.dart';

class FireBaseFireStoreServices implements DataBaseRepo {
  CollectionReference<UserModel> getUser() {
    return FirebaseFirestore.instance
        .collection(Constants.userCollectionName)
        .withConverter<UserModel>(
          fromFirestore: (snapshot, options) =>
              UserModel.fromFireStore(snapshot.data()!),
          toFirestore: (value, options) => value.toFireStore(),
        );
  }

  @override
  Future<void> addUser(
      {required Map<String, dynamic> data, required String id}) async {
    await getUser().doc(id).set(UserModel.fromFireStore(data));
  }

  @override
  Future<void> deleteUser({required String id}) async {
    await getUser().doc(id).delete();
  }

  @override
  Future<UserEntity?> getUserData({required String id}) async {
    final DocumentSnapshot<UserModel> doc = await getUser().doc(id).get();
    return doc.data();
  }

  @override
  Future<void> updateUser(
      {required Map<String, dynamic> data, required String id}) async {
    await getUser().doc(id).update(UserModel.fromFireStore(data).toFireStore());
  }
}
