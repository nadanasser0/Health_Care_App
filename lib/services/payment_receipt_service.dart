import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:health_care_app/models/user_model.dart';
import 'package:health_care_app/models/doctor_model.dart';
import 'package:health_care_app/models/patient_model.dart';
import 'package:health_care_app/shared/user_session.dart';

import '../models/appiontment_model.dart';
import '../models/review_model.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addUser(UserModel user) async {
    await _firestore.collection('users').doc(user.user_id).set(user.toMap());
  }

  Future<void> addDoctor(DoctorModel doctor) async {
    await _firestore
        .collection('doctors')
        .doc(doctor.doctorId)
        .set(doctor.toMap());
  }

  Future<void> updateDoctorData(String doctorId, Map<String, dynamic> data) async {
    await FirebaseFirestore.instance.collection('doctors').doc(doctorId).update(data);
  }
  // 🔹 Stream حيحدث بيانات الدكتور تلقائيًا عند أي تعديل في Firestore
  Stream<DoctorModel> streamDoctorData(String doctorId) {
    return FirebaseFirestore.instance
        .collection('doctors')
        .doc(doctorId)
        .snapshots()
        .map((snapshot) {
      final data = snapshot.data();
      if (data == null) {
        throw Exception("Doctor not found: $doctorId");
      }
      return DoctorModel.fromMap(data, snapshot.id);
    });
  }



  Future<void> addPatient(PatientModel patient) async {
    await _firestore
        .collection('patients')
        .doc(patient.patientId)
        .set(patient.toMap());
  }

  Future<UserModel> getUser(String userId) async {
    final doc = await _firestore.collection('users').doc(userId).get();
    if (!doc.exists || doc.data() == null) {
      throw Exception('User not found: $userId');
    }
    return UserModel.fromMap(doc.data()!,doc.id);
  }

  Future<DoctorModel> getDoctor(String docId) async {
    final doc = await _firestore.collection('doctors').doc(docId).get();
    if (!doc.exists || doc.data() == null) {
      throw Exception('Doctor not found: $docId');
    }
    return DoctorModel.fromMap(doc.data()!,doc.id);
  }


  Future<PatientModel> getPatient(String userId) async {
    final doc = await _firestore.collection('patients').doc(userId).get();
    if (!doc.exists || doc.data() == null) {
      throw Exception('Patient not found: $userId');
    }
    return PatientModel.fromMap(doc.data()!,doc.id);
  }

  Future<void> updateDoctorField(String field, dynamic newValue) async {
    final doctorId = UserSession.currentDoctor!.doctorId;
    await _firestore.collection('doctors').doc(doctorId).update({field: newValue});
  }

  Future<void> updateUserField(String field, dynamic newValue) async {
    final user_id = UserSession.currentUser!.user_id;
    await _firestore.collection('users').doc(user_id).update({field: newValue});
  }

  //////////add your services here
  final CollectionReference appointmentsRef =
  FirebaseFirestore.instance.collection('appointments');

  Future<void> addAppointment(AppointmentModel appointment) async {
    await appointmentsRef.doc(appointment.appointmentId).set(appointment.toMap());
  }

  Future<void> updateAppointment(AppointmentModel appointment) async {
    await appointmentsRef.doc(appointment.appointmentId).update(appointment.toMap());
  }

  Future<void> deleteAppointment(String appointmentId) async {
    await appointmentsRef.doc(appointmentId).delete();
  }

  Future<AppointmentModel?> getAppointment(String appointmentId) async {
    final doc = await appointmentsRef.doc(appointmentId).get();
    if (doc.exists) {
      return AppointmentModel.fromMap(doc.data() as Map<String, dynamic>);
    }
    return null;
  }

  Stream<List<AppointmentModel>> getAllAppointments() {
    return appointmentsRef.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return AppointmentModel.fromMap(doc.data() as Map<String, dynamic>);
      }).toList();
    });
  }

  Future<void> cancelAppointment(AppointmentModel appointment) async {
    final docRef = FirebaseFirestore.instance
        .collection('appointments')
        .doc(appointment.appointmentId);

    await docRef.update({'status': 'canceled'});
  }



  Future<void> addReview(ReviewModel review) async {
    final docRef = _firestore.collection('reviews').doc();
    final newReview = review.copyWith(reviewId: docRef.id);
    await docRef.set(newReview.toMap());
    print('✅ Review added with ID: ${docRef.id}');
  }

  /// تحديث مراجعة موجودة
  Future<void> updateReview(String reviewId, Map<String, dynamic> data) async {
    await _firestore.collection('reviews').doc(reviewId).update(data);
  }

  /// حذف مراجعة
  Future<void> deleteReview(String reviewId) async {
    await _firestore.collection('reviews').doc(reviewId).delete();
  }

  /// جلب كل المراجعات الخاصة بطبيب معين
  Stream<List<ReviewModel>> getDoctorReviews(String doctorId) {
    return _firestore
        .collection('reviews')
        .where('doctorId', isEqualTo: doctorId)
    // .orderBy('createdAt', descending: true) ← احذفيها مؤقتًا
        .snapshots()
        .map((snapshot) => snapshot.docs
        .map((doc) => ReviewModel.fromMap(doc.data(), doc.id))
        .toList());
  }


}