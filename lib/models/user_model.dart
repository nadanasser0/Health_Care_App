class UserModel {
  final String user_id;
  final String name;
  final String email;
  final String password;
  final int phoneNum;
  final String? image;
  final String? gender;
  final String role;
  final DateTime createdAt;

  UserModel({
    required this.user_id,
    required this.name,
    required this.email,
    required this.password,
    required this.phoneNum,
    this.image,
    this.gender,
    required this.role,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  factory UserModel.fromMap(Map<String, dynamic> map, String id) {
    return UserModel(
      user_id: id,
      name: map["name"],
      email: map["email"],
      password: map["password"],
      phoneNum: map["phoneNum"],
      gender: map["gender"] ?? "male",
      image: map["image"] ?? "",
      role: map["role"] ?? "User",
      createdAt: map["createdAt"] != null
          ? DateTime.parse(map["createdAt"])
          : DateTime.now(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "email": email,
      "password": password,
      "phoneNum": phoneNum,
      "gender": gender,
      "image": image,
      "role": role,
      "createdAt": createdAt.toIso8601String(),
    };
  }

  // ✅ copyWith method
  UserModel copyWith({
    String? user_id,
    String? name,
    String? email,
    String? password,
    int? phoneNum,
    String? image,
    String? gender,
    String? role,
    DateTime? createdAt,
  }) {
    return UserModel(
      user_id: user_id ?? this.user_id,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      phoneNum: phoneNum ?? this.phoneNum,
      image: image ?? this.image,
      gender: gender ?? this.gender,
      role: role ?? this.role,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
