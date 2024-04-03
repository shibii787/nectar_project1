class UserModel{
  final String name;
  final String email;
  final String password;
  final String location;
  final int? phoneNumber;
UserModel({
  required this.name,
  required this.email,
  required this.password,
  required this.location,
  required this.phoneNumber
});
Map<String,dynamic> tomap(){
  return{
    "name": this.name,
    "email": this.email,
    "password": this.password,
    "location": this.location,
    "phoneNumber":this.phoneNumber
  };
}
factory UserModel.fromMap(Map<String,dynamic>map){
  return UserModel(
      name: map["name"]??"",
      email: map["email"]??"",
      password: map["password"]??"",
      location: map["location"]??"",
      phoneNumber: map["phoneNumber"]??""
  );
}
UserModel copyWith({
    String? name,
    String? email,
    String? password,
    String? location,
    int? phoneNumber,
}){
  return UserModel(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      location: location ?? this.location,
      phoneNumber: phoneNumber ?? this.phoneNumber
  );
}
}
