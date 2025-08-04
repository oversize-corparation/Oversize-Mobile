import 'package:oversize/features/auth/domain/entity/auth_entity.dart';
import 'package:oversize/features/auth/domain/repository/auth_repository.dart';

class OtpVerifyUsecase {
  final AuthRepository repository;

  OtpVerifyUsecase(this.repository);

  Future<AuthEntity> call({
    required String email,
    required String code,
    required bool restoration,
  }) {
    return repository.otpVerify(
      email: email,
      code: code,
      restoration: restoration,
    );
  }
}
