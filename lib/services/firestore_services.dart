import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:health_care_app/models/user_model.dart';
import 'package:health_care_app/models/doctor_model.dart';
import 'package:health_care_app/models/patient_model.dart';

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
}
