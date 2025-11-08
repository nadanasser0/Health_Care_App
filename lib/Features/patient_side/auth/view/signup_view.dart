import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:health_care_app/Features/patient_side/auth/view/login_view.dart';
import 'package:health_care_app/Features/patient_side/auth/widgets/shared/custom_button.dart';
import 'package:health_care_app/Features/patient_side/auth/widgets/shared/custom_textfeild.dart';
import 'package:health_care_app/Features/patient_side/auth/widgets/signup_widgets/custom_radio_button.dart';
import 'package:health_care_app/Features/patient_side/auth/widgets/signup_widgets/signup_form.dart';
import 'package:health_care_app/Features/patient_side/auth/widgets/signup_widgets/signup_header.dart';
import 'package:health_care_app/Features/patient_side/auth/widgets/signup_widgets/signup_tail.dart';
import 'package:health_care_app/core/constants/colors.dart';
import 'package:health_care_app/core/constants/sizes.dart';
import 'package:health_care_app/models/doctor_model.dart';
import 'package:health_care_app/models/patient_model.dart';
import 'package:health_care_app/models/user_model.dart';
import 'package:health_care_app/shared/user_session.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  CollectionReference patients = FirebaseFirestore.instance.collection(
    'patients',
  );
  CollectionReference doctors = FirebaseFirestore.instance.collection(
    'doctors',
  );

  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController hospitalController = TextEditingController();

  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController genderController = TextEditingController();

  bool loading = false;
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  String hospitalName = '';

  String _selectedType = 'User';
  String? _selectedSpecialization;

  void handleSelection(String type, String? specialization) {
    setState(() {
      _selectedType = type;
      _selectedSpecialization = specialization;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: loading,
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SignupHeader(),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  children: [
                    SignupForm(
                      formkey: formkey,
                      userNameController: userNameController,
                      emailController: emailController,
                      phoneNumberController: phoneNumberController,
                      passwordController: passwordController,
                      confirmPasswordController: confirmPasswordController,
                      genderController: genderController,
                    ),
                    const SizedBox(height: 20),
                    UserDoctorSelector(onSelectionChanged: handleSelection),
                    if (_selectedType == "Doctor") ...[
                      const SizedBox(height: 20),

                      
                      CustomTextField(
                        label: "Enter your hospital name",
                        icon: Icons.local_hospital_outlined,
                        controller: hospitalController,
                        // validator: (value) {
                        //   if (value == null || value.trim().isEmpty) {
                        //     return "Please enter your hospital name";
                        //   }
                        //   final trimmedValue = value.trim();
                        //   if (trimmedValue.length < 3) {
                        //     return "Hospital name must be at least 3 letters";
                        //   }
                        //   if (!RegExp(
                        //     r'^[a-zA-Z\s]+$',
                        //   ).hasMatch(trimmedValue)) {
                        //     return "Hospital name should contain letters only";
                        //   }
                        //   return null;
                        // },
                      ),
                    ],
                    const SizedBox(height: 30),

                    CustomButton(
                      text: "Sign up",
                      onPressed: () async {
                        if (formkey.currentState!.validate()) {
                          // تحقق من اختيار التخصص لو المستخدم دكتور
                          if (_selectedType == "Doctor" &&
                              _selectedSpecialization == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  "Please choose your specialization",
                                ),
                              ),
                            );
                            if (_selectedType == "Doctor") {
                              final hospitalName = hospitalController.text
                                  .trim();

                              if (hospitalName.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      "Please enter your hospital name",
                                    ),
                                  ),
                                );
                                return;
                              }

                              if (hospitalName.length < 3) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      "Hospital name must be at least 3 letters",
                                    ),
                                  ),
                                );
                                return;
                              }

                              if (!RegExp(
                                r'^[a-zA-Z\s]+$',
                              ).hasMatch(hospitalName)) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      "Hospital name should contain letters only",
                                    ),
                                  ),
                                );
                                return;
                              }
                            }

                            return;
                          }

                          loading = true;
                          setState(() {});
                          try {
                            var auth = FirebaseAuth.instance;
                            UserCredential userCredential = await auth
                                .createUserWithEmailAndPassword(
                                  email: emailController.text
                                      .toLowerCase()
                                      .trim(),
                                  password: passwordController.text.trim(),
                                );

                            UserModel newUser = UserModel(
                              user_id: userCredential.user!.uid,
                              name: userNameController.text.trim(),
                              email: emailController.text.trim().toLowerCase(),
                              password: passwordController.text.trim(),
                              phoneNum: int.parse(
                                phoneNumberController.text.trim(),
                              ),
                              image:"lib/images/profile.png",
                              gender: genderController.text.trim(),
                              role: _selectedType,
                            );

                            await users
                                .doc(userCredential.user!.uid)
                                .set(newUser.toMap());

                            if (_selectedType == "Doctor") {
                              DoctorModel newDoctor = DoctorModel(
                                doctorId: userCredential.user!.uid,
                                name: userNameController.text.trim(),
                                specialization: _selectedSpecialization!,
                                hospital: hospitalController.text,
                                    // imageUrl: "lib/images/profile.png",
                              );

                              await doctors
                                  .doc(userCredential.user!.uid)
                                  .set(newDoctor.toMap());
                            } else {
                              PatientModel newPatient = PatientModel(
                                patientId: userCredential.user!.uid,
                              );

                              await patients
                                  .doc(userCredential.user!.uid)
                                  .set(newPatient.toMap());
                            }

                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginScreen(),
                              ),
                            );
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'weak-password') {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'The password provided is too weak.',
                                  ),
                                ),
                              );
                            } else if (e.code == 'email-already-in-use') {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'The account already exists for that email.',
                                  ),
                                ),
                              );
                            }
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Something went wrong.'),
                              ),
                            );
                          }

                          loading = false;
                          setState(() {});
                        }
                      },
                    ),
                    const SizedBox(height: 40),
                    const SignupTail(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
