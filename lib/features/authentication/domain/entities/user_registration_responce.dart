import 'package:equatable/equatable.dart';

class UserRegistrationResponce extends Equatable {
  final int responcecode;
  final dynamic message;

  const UserRegistrationResponce(
    this.responcecode,
    this.message,
  );
  @override
  String toString() {
    return 'UserRegistrationResponce{statusCode: $responcecode, message: $message}';
  }

  @override
  List<Object?> get props => [responcecode, message];
}
