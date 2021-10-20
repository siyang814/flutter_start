import 'package:json_annotation/json_annotation.dart';

part 'User.g.dart';


@JsonSerializable()
class User extends Object {

  @JsonKey(name: 'nickname')
  String nickname;

  @JsonKey(name: 'age')
  int age;

  @JsonKey(name: 'courses')
  List<String> courses;

  @JsonKey(name: 'register_date')
  String registerDate;

  @JsonKey(name: 'computer')
  Computer computer;

  User(this.nickname,this.age,this.courses,this.registerDate,this.computer,);

  factory User.fromJson(Map<String, dynamic> srcJson) => _$UserFromJson(srcJson);

  Map<String, dynamic> toJson() => _$UserToJson(this);

}


@JsonSerializable()
class Computer extends Object {

  @JsonKey(name: 'brand')
  String brand;

  @JsonKey(name: 'price')
  int price;

  Computer(this.brand,this.price,);

  factory Computer.fromJson(Map<String, dynamic> srcJson) => _$ComputerFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ComputerToJson(this);

}


