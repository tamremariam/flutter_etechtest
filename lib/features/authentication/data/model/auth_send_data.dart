import 'package:json_annotation/json_annotation.dart';

part 'auth_send_data.g.dart';

@JsonSerializable()
class AuthSendData {
  final String username;
  final String password;

  AuthSendData({required this.username, required this.password});

  factory AuthSendData.fromJson(Map<String, dynamic> json) =>
      _$AuthSendDataFromJson(json);

  Map<String, dynamic> toJson() => _$AuthSendDataToJson(this);
}
