import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:health_care_app/Features/patient_side/auth/view/login_view.dart';
import 'package:health_care_app/Features/patient_side/auth/widgets/shared/custom_button.dart';
import 'package:health_care_app/Features/patient_side/auth/widgets/signup_widgets/custom_radio_button.dart';
import 'package:health_care_app/Features/patient_side/auth/widgets/signup_widgets/signup_form.dart';
import 'package:health_care_app/Features/patient_side/auth/widgets/signup_widgets/signup_header.dart';
import 'package:health_care_app/Features/patient_side/auth/widgets/signup_widgets/signup_tail.dart';
import 'package:health_care_app/core/constants/colors.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  CollectionReference doctors = FirebaseFirestore.instance.collection('doctors');

  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  bool loading = false;
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  String _selectedType = 'User';
  String? _selectedSpecialization;

  // دالة لحفظ القيم المختارة من الويجد
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
                    ),
                    const SizedBox(height: 20),

                    UserDoctorSelector(onSelectionChanged: handleSelection),

                    const SizedBox(height: 40),

                    CustomButton(
                      text: "Sign up",
                      onPressed: () async {
                        if (formkey.currentState!.validate()) {
                          // تحقق من اختيار التخصص لو المستخدم دكتور
                          if (_selectedType == "Doctor" &&
                              _selectedSpecialization == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Please choose your specialization"),
                              ),
                            );
                            return;
                          }

                          loading = true;
                          setState(() {});
                          try {
                            var auth = FirebaseAuth.instance;
                            UserCredential userCredential =
                                await auth.createUserWithEmailAndPassword(
                              email: emailController.text.trim(),
                              password: passwordController.text.trim(),
                            );

                            await doctors.add({
                              'id': userCredential.user!.uid,
                              'userName': userNameController.text.trim(),
                              'email': emailController.text.trim(),
                              'phoneNumber': phoneNumberController.text.trim(),
                              'password': passwordController.text.trim(),
                              'role': _selectedType, // User / Doctor
                              'specialization': _selectedSpecialization ?? '',
                              'createdAt': DateTime.now(),
                            });

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
                                  content: Text('The password provided is too weak.'),
                                ),
                              );
                            } else if (e.code == 'email-already-in-use') {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('The account already exists for that email.'),
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
