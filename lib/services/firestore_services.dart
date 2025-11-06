import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:health_care_app/models/user_model.dart';
import 'package:health_care_app/models/doctor_model.dart';
import 'package:health_care_app/models/patient_model.dart';

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
