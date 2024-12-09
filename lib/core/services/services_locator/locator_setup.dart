import 'package:commerce/core/services/fire_base_auth_services.dart';
import 'package:commerce/feature/auth_feature/data/repo/auth_repo_impl.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<FireBaseAuthServices>(FireBaseAuthServices());
  getIt.registerSingleton<AuthRepoImpl>(
    AuthRepoImpl(
      getIt<FireBaseAuthServices>(),
    ),
  );
}
