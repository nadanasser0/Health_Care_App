import 'package:cloud_firestore/cloud_firestore.dart';

class DoctorModel{

  final String doctorId;
  final int STR;
  final String name;
  final String specialization;
  final String hospital;
  final String imageUrl;
  final double rating;
  final int reviews;
  final String specializationKey;
  final bool isRecommended;
  final String? aboutMe;
  final String? workingTime;
  final double price;
  final Timestamp? createdAt;

  DoctorModel({
    required this.doctorId,
    required this.name,
    required this.specialization,
    required this.hospital,
    this.imageUrl =
        "https://firebasestorage.googleapis.com/v0/b/YOUR_PROJECT.appspot.com/o/default_doctor.png?alt=media",
    this.rating = 0.0,
    this.reviews = 0,
    this.isRecommended = true,
    this.aboutMe = 
    "Dr. Jenny Watson is the top most Immunologists specialist in Christ Hospital at London. She achived several awards for her wonderful contribution in medical field. She is available for private consultation.",
    this.workingTime = " Monday - Friday, 9:00 AM - 5:00 PM",
    this.price = 0.0,
    this.STR = 0123456, 
    this.createdAt,

    String? specializationKey,
  }) : specializationKey = specializationKey ?? specialization.toLowerCase();

  // 🔁 لتحويل Firestore Map إلى DoctorModel
  factory DoctorModel.fromMap(Map<String, dynamic> map, String id) {
    return DoctorModel(
      doctorId: id,
      name: map['name'] ?? '',
      specialization: map['specialization'] ?? '',
      hospital: map['hospital'] ?? 'Unknown Hospital',
      imageUrl: map['imageUrl'] ??
          "https://firebasestorage.googleapis.com/v0/b/YOUR_PROJECT.appspot.com/o/default_doctor.png?alt=media",
      rating: (map['rating'] ?? 0.0).toDouble(),
      reviews: map['reviews'] ?? 0,
      specializationKey: map['specializationKey'],
      isRecommended: map['isRecommended'] ?? true,
      aboutMe: map['aboutMe'] ?? '',
      workingTime: map['workingTime'] ?? '',
      price: (map['price'] ?? 0.0).toDouble(),
      STR: int.parse(map['STR']),
      createdAt: map['createdAt'],
    );
  }

  // 🗃️ لتحويل الموديل إلى Map لحفظه في Firestore
  Map<String, dynamic> toMap() {
    return {
      'doctorId': doctorId,
      'name': name,
      'specialization': specialization,
      'hospital': hospital,
      'imageUrl': imageUrl,
      'rating': rating,
      'reviews': reviews,
      'specializationKey': specializationKey,
      'isRecommended': isRecommended,
      'aboutMe': aboutMe,
      'workingTime': workingTime,
      'price': price,
      'STR': STR,
      'createdAt': createdAt ?? FieldValue.serverTimestamp(),
    };
  }

}