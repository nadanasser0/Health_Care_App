import 'package:flutter/material.dart';
import 'package:health_care_app/core/routes/app_routes.dart';
import 'package:health_care_app/features/auth/widgets/custom_button.dart';
import 'package:health_care_app/features/auth/widgets/login_form.dart';
import 'package:health_care_app/features/auth/widgets/login_header.dart';
import 'package:health_care_app/features/auth/widgets/login_tail.dart';
import 'package:health_care_app/core/constants/colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

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
      // appBar: AppBar(leading: BackButton()),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(onPressed: (){
              Navigator.pushReplacementNamed(context,AppRoutes.loginOrSignup);

            }, icon: Icon(Icons.arrow_back_ios_new_rounded , color: AppColors.greyColor,size: 20,)),
            LoginHeader(),
            SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  LoginForm(
                    emailController: emailController,
                    passwordController: passwordController,
                  ),
                  SizedBox(height: 8),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, AppRoutes.forgotPassowrd);
                    },
                    child: Text(
                      "Forgot Password ?",
                      style: TextStyle(
                        color: AppColors.textColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  CustomButton(text: 'Login', onPressed:()=> Navigator.pushReplacementNamed(context, AppRoutes.home)),

                  LoginTail(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
