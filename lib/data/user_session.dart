import 'package:health_care_app/data/models/doctor_model.dart';
import 'package:health_care_app/data/models/patient_model.dart';
import 'package:health_care_app/data/models/user_model.dart';

class UserSession {
  static UserModel? currentUser;
  static DoctorModel? currentDoctor;
  static PatientModel? currentPatient;

  static void clear() {
    currentUser = null;
    currentDoctor = null;
    currentPatient = null;
  }
}