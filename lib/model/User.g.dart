// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'User.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      json['nickname'] as String,
      json['age'] as int,
      (json['courses'] as List<dynamic>).map((e) => e as String).toList(),
      json['register_date'] as String,
      Computer.fromJson(json['computer'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'nickname': instance.nickname,
      'age': instance.age,
      'courses': instance.courses,
      'register_date': instance.registerDate,
      'computer': instance.computer,
    };

Computer _$ComputerFromJson(Map<String, dynamic> json) => Computer(
      json['brand'] as String,
      json['price'] as int,
    );

Map<String, dynamic> _$ComputerToJson(Computer instance) => <String, dynamic>{
      'brand': instance.brand,
      'price': instance.price,
    };
