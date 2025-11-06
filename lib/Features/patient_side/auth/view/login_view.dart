import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:health_care_app/Features/doctor_side/navigation_screen.dart';
// import 'package:health_care_app/Features/doctor_side/navigation_screen.dart';

import 'package:health_care_app/core/constants/methods.dart';
import 'package:health_care_app/core/routes/app_routes.dart';
import 'package:health_care_app/Features/patient_side/auth/widgets/shared/custom_button.dart';
import 'package:health_care_app/Features/patient_side/auth/widgets/login_widgets/login_form.dart';
import 'package:health_care_app/Features/patient_side/auth/widgets/login_widgets/login_header.dart';
import 'package:health_care_app/Features/patient_side/auth/widgets/login_widgets/login_tail.dart';
import 'package:health_care_app/core/constants/colors.dart';
import 'package:health_care_app/models/user_model.dart';
import 'package:health_care_app/services/firestore_services.dart';
import 'package:health_care_app/shared/methods/navigator.dart';
import 'package:health_care_app/shared/user_session.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool loading = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LoginHeader(),
              SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    LoginForm(
                      formKey: formKey,
                      emailController: emailController,
                      passwordController: passwordController,
                    ),

                    SizedBox(height: 8),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                          context,
                          AppRoutes.forgotPassowrd,
                        );
                      },
                      child: Text(
                        "Forgot Password ?",
                        style: TextStyle(
                          color: AppColors.textColor,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    CustomButton(
                      text: 'Login',
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          loading = true;
                          setState(() {});
                          try {
                            var auth = FirebaseAuth.instance;
                            UserCredential userCredential = await auth
                                .signInWithEmailAndPassword(
                                  email: emailController.text.trim(),
                                  password: passwordController.text.trim(),
                                );

                            FirestoreService firestoreService =
                                FirestoreService();

                            UserModel user = await firestoreService.getUser(
                              userCredential.user!.uid,
                            );
                            UserSession.currentUser = user;                       
                             
                            snackBarMessage(
                              context,
                              "Sign in successfully",
                              color: Colors.green,
                            );
                            
                            if (user.role == 'Doctor') {

                             UserSession.currentDoctor = await firestoreService.getDoctor( 
                                userCredential.user!.uid,
                              );

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => NavigationScreen(),
                                ),
                              );
                            } 
                            
                            
                            else {

                              UserSession.currentPatient = await firestoreService.getPatient( 
                                userCredential.user!.uid,
                              );
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => NavigationnScreen(),
                                ),
                              );
                            }

                            
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'user-not-found') {
                              snackBarMessage(
                                context,
                                'No user found for that email.',
                                color: Colors.red,
                              );
                            } else if (e.code == 'wrong-password') {
                              snackBarMessage(
                                context,
                                'Wrong password provided for that user.',
                                color: Colors.red,
                              );
                            } else {
                              snackBarMessage(
                                context,
                                'Something went wrong. Please try again later.',
                                color: Colors.red,
                              );
                            }
                          }
                          loading = false;
                          setState(() {});
                        }
                      },
                    ),
                    SizedBox(height: 20),

                    LoginTail(),
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
