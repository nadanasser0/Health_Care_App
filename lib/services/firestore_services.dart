import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:health_care_app/models/user_model.dart';
import 'package:health_care_app/models/doctor_model.dart';
import 'package:health_care_app/models/patient_model.dart';
import 'package:health_care_app/shared/user_session.dart';

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
}
