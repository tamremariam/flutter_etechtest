// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_send_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthSendData _$AuthSendDataFromJson(Map<String, dynamic> json) => AuthSendData(
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$AuthSendDataToJson(AuthSendData instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };
