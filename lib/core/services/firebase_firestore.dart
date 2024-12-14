import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:commerce/core/services/database_services.dart';
import 'package:commerce/feature/auth_feature/data/model/user_model.dart';
import 'package:commerce/feature/auth_feature/domain/entity/user_entity.dart';
import 'package:commerce/shared/constants.dart';

class FireBaseFireStoreServices implements DataBaseRepo {
  CollectionReference<UserModel> getUserCollection() {
    return FirebaseFirestore.instance
        .collection(Constants.userCollectionName)
        .withConverter<UserModel>(
          fromFirestore: (snapshot, options) =>
              UserModel.fromFireStore(snapshot.data()!),
          toFirestore: (value, options) => value.toFireStore(),
        );
  }

  @override
  Future<void> deleteUser({required String id}) async {
    await getUserCollection().doc(id).delete();
  }

  @override
  Future<UserEntity?> getUserData({required String id}) async {
    final DocumentSnapshot<UserModel> doc =
        await getUserCollection().doc(id).get();
    return doc.data();
  }

  @override
  Future<void> updateUser(
      {required UserModel userModel, required String id}) async {
    await getUserCollection().doc(id).update(userModel.toFireStore());
  }

  @override
  Future<void> addUser(
      {required UserModel userModel, required String id}) async {
    await getUserCollection().doc(id).set(userModel);
  }

  @override
  Future<bool> isUserExist({required String id}) async {
    final DocumentSnapshot<UserModel> documentSnapshot =
        await getUserCollection().doc(id).get();
    bool exist = documentSnapshot.exists;
    return exist;
  }
}
