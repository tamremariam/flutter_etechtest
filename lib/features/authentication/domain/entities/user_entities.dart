import 'package:equatable/equatable.dart';

class UserEntities extends Equatable {
  final String name;
  final String email;
  final String phoneNumber;
  final String type;
  final int age;
  final String gender;
  final String image;
  final String token;

  const UserEntities(this.name, this.email, this.phoneNumber, this.type,
      this.age, this.gender, this.image, this.token);

  @override
  List<Object?> get props =>
      [name, email, phoneNumber, type, age, gender, image, token];
}
