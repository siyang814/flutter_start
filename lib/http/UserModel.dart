class UserModel
{
  String? name;
  String? origin;

  UserModel(this.name, this.origin);

  UserModel.fromJson (Map<String, dynamic> json):name = json["name"], origin = json["origin"];
  Map<String, dynamic> toJson ()=><String, dynamic>{
    'name':name,
    'origin':origin,
  };

}