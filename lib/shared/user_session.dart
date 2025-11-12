import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:health_care_app/models/doctor_model.dart';
import 'package:health_care_app/models/patient_model.dart';
import 'package:health_care_app/models/user_model.dart';

class UserSession {
  static UserModel? currentUser;
  static DoctorModel? currentDoctor;
  static PatientModel? currentPatient;

  /// 🧹 لحذف الجلسة عند تسجيل الخروج
  static void clear() {
    currentUser = null;
    currentDoctor = null;
    currentPatient = null;
  }
}
