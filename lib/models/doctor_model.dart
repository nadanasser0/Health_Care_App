class DoctorModel {
  final String doctorId;
  // final String specialityId;
  final String speciality;
  final String? aboutMe;
  final String? workingTime;
  final double? price;
  final String? hospital;
  final DateTime createdAt;

  DoctorModel({
    required this.doctorId,
    // required this.specialityId,
    required this.speciality,
    this.aboutMe,
    this.workingTime,
    this.price,
    this.hospital,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  factory DoctorModel.fromMap(Map<String, dynamic> map, String id) {
    return DoctorModel(
      doctorId: id,
      speciality: map["speciality"],
      aboutMe: map["aboutMe"],
      workingTime: map["workingTime"],
      price: map["price"] != null ? (map["price"] as num).toDouble() : null,
      hospital: map["hospital"],
      createdAt: map["createdAt"] != null
          ? DateTime.parse(map["createdAt"])
          : DateTime.now(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "doctorId": doctorId,
      "specialityId": speciality ?? "",
      "aboutMe": aboutMe ?? "",
      "workingTime": workingTime ?? "",
      "price": price ?? 0.0,
      "hospital": hospital ?? "",
      "createdAt": createdAt.toIso8601String(),
    };
  }

  DoctorModel copyWith({
    String? doctorId,
    String? userId,
    String? specialityId,
    String? aboutMe,
    String? workingTime,
    double? price,
    String? hospital,
    DateTime? createdAt,
  }) {
    return DoctorModel(
      doctorId: doctorId ?? this.doctorId,
      speciality: specialityId ?? this.speciality,
      aboutMe: aboutMe ?? this.aboutMe,
      workingTime: workingTime ?? this.workingTime,
      price: price ?? this.price,
      hospital: hospital ?? this.hospital,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
