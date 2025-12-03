import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AppointmentModel {
  final String appointmentId;
  final String patientId;
  final String doctorId;
  final DateTime appointmentDate;
  final String appointmentTime;
  final String appointmentType;
  final String gender;
  final String name;
  final int age;
  final double price;
  final String billingMethod;
  final DateTime createdAt;
  final String status; // upcoming, canceled, done
  final String? prescription;

  // ✅ Receipt fields
  final String? paymentStatus; // pending, submitted, paid, rejected
  final String? receiptUrl;
  final String? receiptNote;
  final DateTime? receiptUploadedAt;

  AppointmentModel({
    required this.appointmentId,
    required this.patientId,
    required this.doctorId,
    required this.appointmentDate,
    required this.appointmentTime,
    required this.appointmentType,
    required this.gender,
    required this.name,
    required this.age,
    required this.price,
    required this.billingMethod,
    DateTime? createdAt,
    this.status = 'upcoming',
    this.prescription,
    this.paymentStatus = 'pending',
    this.receiptUrl,
    this.receiptNote,
    this.receiptUploadedAt,
  }) : createdAt = createdAt ?? DateTime.now();

  static DateTime _parseDate(dynamic value) {
    if (value == null) return DateTime.now();
    if (value is Timestamp) return value.toDate();
    if (value is DateTime) return value;
    return DateTime.tryParse(value.toString()) ?? DateTime.now();
  }

  factory AppointmentModel.fromMap(Map<String, dynamic> map) {
    return AppointmentModel(
      appointmentId: (map['appointmentId'] ?? '').toString(),
      patientId: (map['patientId'] ?? '').toString(),
      doctorId: (map['doctorId'] ?? '').toString(),

      // ✅ لو مخزنها Timestamp (وأنت بتخزنها Timestamp بالفعل)
      appointmentDate: _parseDate(map['appointmentDate']),

      appointmentTime: (map['appointmentTime'] ?? '').toString(),
      appointmentType: (map['appointmentType'] ?? '').toString(),
      gender: (map['gender'] ?? '').toString(),
      name: (map['name'] ?? '').toString(),
      age: (map['age'] is num) ? (map['age'] as num).toInt() : 0,
      price: (map['price'] is num) ? (map['price'] as num).toDouble() : 0.0,
      billingMethod: (map['billingMethod'] ?? '').toString(),

      // ✅ انتِ بتخزني createdAt كـ String iso
      createdAt: _parseDate(map['createdAt']),
      status: (map['status'] ?? 'upcoming').toString(),
      prescription: map['prescription']?.toString(),

      // ✅ Receipt
      paymentStatus: (map['paymentStatus'] ?? 'pending').toString(),
      receiptUrl: map['receiptUrl']?.toString(),
      receiptNote: map['receiptNote']?.toString(),
      receiptUploadedAt: _parseDate(map['receiptUploadedAt']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'appointmentId': appointmentId,
      'patientId': patientId,
      'doctorId': doctorId,
      'appointmentDate': Timestamp.fromDate(appointmentDate),
      'appointmentTime': appointmentTime,
      'appointmentType': appointmentType,
      'gender': gender,
      'name': name,
      'age': age,
      'price': price,
      'billingMethod': billingMethod,

      // ✅ خليه Timestamp أفضل (حتى لو كان شغال String عندك)
      'createdAt': Timestamp.fromDate(createdAt),

      'status': status,
      'prescription': prescription,

      // ✅ Receipt
      'paymentStatus': paymentStatus ?? 'pending',
      'receiptUrl': receiptUrl,
      'receiptNote': receiptNote,
      'receiptUploadedAt':
      receiptUploadedAt == null ? null : Timestamp.fromDate(receiptUploadedAt!),
    };
  }

  AppointmentModel copyWith({
    String? appointmentId,
    String? patientId,
    String? doctorId,
    DateTime? appointmentDate,
    String? appointmentTime,
    String? appointmentType,
    String? gender,
    String? name,
    int? age,
    double? price,
    String? billingMethod,
    DateTime? createdAt,
    String? status,
    String? prescription,
    String? paymentStatus,
    String? receiptUrl,
    String? receiptNote,
    DateTime? receiptUploadedAt,
  }) {
    return AppointmentModel(
      appointmentId: appointmentId ?? this.appointmentId,
      patientId: patientId ?? this.patientId,
      doctorId: doctorId ?? this.doctorId,
      appointmentDate: appointmentDate ?? this.appointmentDate,
      appointmentTime: appointmentTime ?? this.appointmentTime,
      appointmentType: appointmentType ?? this.appointmentType,
      gender: gender ?? this.gender,
      name: name ?? this.name,
      age: age ?? this.age,
      price: price ?? this.price,
      billingMethod: billingMethod ?? this.billingMethod,
      createdAt: createdAt ?? this.createdAt,
      status: status ?? this.status,
      prescription: prescription ?? this.prescription,
      paymentStatus: paymentStatus ?? this.paymentStatus,
      receiptUrl: receiptUrl ?? this.receiptUrl,
      receiptNote: receiptNote ?? this.receiptNote,
      receiptUploadedAt: receiptUploadedAt ?? this.receiptUploadedAt,
    );
  }
}