class User {
  String name;
  String email;
  String gender;
  int id;

  User({
    required this.name,
    required this.email,
    required this.id,
    required this.gender,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json["name"],
      gender: json["gender"],
      email: json["email"],
      id: json["id"],
    );
  }
}
