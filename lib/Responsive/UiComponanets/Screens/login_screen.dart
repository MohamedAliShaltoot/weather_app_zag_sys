import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:weather_app_zag_sys/Responsive/UiComponanets/Screens/sign_up_screen.dart';

import '../../ReusableWidgets/custom-text-form_field.dart';
import '../../ReusableWidgets/custom_button_login.dart';
import '../../ReusableWidgets/custom_text.dart';
import '../../ReusableWidgets/inside_button.dart';
import '../../ReusableWidgets/reuse_body_of_button.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController passwordController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    var formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios_new_outlined,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 24, right: 25),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                    text: "Login", fontWeight: FontWeight.w700, fontSize: 32),
                const SizedBox(
                  height: 30,
                ),
                CustomText(
                    text: "Gmail", fontWeight: FontWeight.w400, fontSize: 16),
                const SizedBox(
                  height: 10,
                ),
                TextFormFieldForEmail(
                    hint: "Example:user@gmail.com",
                    controller: emailController),
                const SizedBox(
                  height: 20,
                ),
                CustomText(
                    text: "Password",
                    fontWeight: FontWeight.w400,
                    fontSize: 16),
                const SizedBox(
                  height: 10,
                ),
                customTextFieldFOrPassword(
                    hint: " your password", controller: passwordController),
                const SizedBox(
                  height: 70,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 44, right: 44),
                  child: SizedBox(
                    height: 50,
                    width: 550,
                    child: customButtonLogin(
                        text: "LOGIN",
                        color: const Color.fromARGB(255, 169, 157, 157),
                        onClick: () async {
                          if (formKey.currentState!.validate()) {
                            try {
                              final credential = await FirebaseAuth.instance
                                  .signInWithEmailAndPassword(
                                email: emailController.text,
                                password: passwordController.text,
                              );
                              Navigator.pushNamed(context, "/homeScreen");
                            } on FirebaseAuthException catch (e) {
                              print('There is an error. $e');
                            } catch (e) {
                              print(e);
                            }
                          }
                          // if (formKey.currentState!.validate()) {
                          //   if (kDebugMode) {
                          //     print(emailController.text);
                          //   }
                          //   if (kDebugMode) {
                          //     print(passwordController.text);
                          //   }
                          // }
                          // Navigator.push(context, MaterialPageRoute(builder: (context){
                          //   return const LoginScreen();
                          // }));
                        }),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                const SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Text(
                          "----------------------------------------------- or ----------------------------------------- "),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                elevatedButtonBody(
                    child: insideButton(
                        text: "Login With Google",
                        asset: "assets/images/google.png")),
                const SizedBox(
                  height: 20,
                ),
                elevatedButtonBody(
                    child: insideButton(
                        text: "Login With Apple",
                        asset: "assets/images/apple.png")),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                        text: "Don’t have an account? ",
                        fontWeight: FontWeight.w400,
                        fontSize: 14),
                    InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const RegisterScreen();
                          }));
                        },
                        child: CustomText(
                            text: "Register",
                            fontWeight: FontWeight.w400,
                            fontSize: 14)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
