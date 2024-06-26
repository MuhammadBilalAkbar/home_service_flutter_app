import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:home_service_flutter_app/animation/FadeAnimation.dart';
import 'package:icons_plus/icons_plus.dart';
import '../widgets/build_custom_scaffold.dart';
import '../widgets/build_text_field.dart';
import '../widgets/show_snackbar.dart';
import 'signin_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final formSignupKey = GlobalKey<FormState>();
  bool agreePersonalData = true;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> signUpUser() async {
    if (passwordController.text == confirmPasswordController.text) {
      try {
        final userCredentials =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
        debugPrint('UserCredentials: $userCredentials');
        if (!mounted) return;
        ScaffoldMessenger.of(context).removeCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(
          showSnackBar('Registered Successfully. Please Sign In...'),
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const SignInPage(),
          ),
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          debugPrint('Password Provided is too Weak');
          ScaffoldMessenger.of(context).removeCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(
            showSnackBar('Password Provided is too Weak'),
          );
        } else if (e.code == 'email-already-in-use') {
          debugPrint('Account Already exists');
          ScaffoldMessenger.of(context).removeCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(
            showSnackBar('Account Already exists'),
          );
        } else {
          debugPrint('$e');
          ScaffoldMessenger.of(context).removeCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(showSnackBar('$e'));
        }
      }
    } else {
      debugPrint('Password and Confirm Password doesn\'t match');
      ScaffoldMessenger.of(context).removeCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
        showSnackBar('Password and Confirm Password doesn\'t match'),
      );
    }
  }

  @override
  Widget build(BuildContext context) => BuildCustomScaffold(
        child: Column(
          children: [
            const Expanded(
              flex: 1,
              child: SizedBox(height: 10),
            ),
            Expanded(
              flex: 2,
              child: FadeAnimation(
                1, Container(
                  padding: const EdgeInsets.fromLTRB(25, 50, 25, 20),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  child: SingleChildScrollView(
                    // get started form
                    child: Form(
                      key: formSignupKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // get started text
                          const Text(
                            'Get Started',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w900,
                              color: Colors.blue,
                            ),
                          ),
                          const SizedBox(height: 40),
                          BuildTextField(
                            validateText: 'Please enter email',
                            labelText: 'Email',
                            controller: emailController,
                          ),
                          const SizedBox(height: 25),
                          BuildTextField(
                            validateText: 'Please enter password',
                            labelText: 'Password',
                            controller: passwordController,
                            obscureText: true,
                          ),
                          const SizedBox(height: 25),
                          BuildTextField(
                            validateText: 'Please confirm password',
                            labelText: 'Confirm Password',
                            controller: confirmPasswordController,
                            obscureText: true,
                          ),
                          const SizedBox(height: 25),
                          Row(
                            children: [
                              Checkbox(
                                value: agreePersonalData,
                                onChanged: (value) => setState(
                                  () => agreePersonalData = value!,
                                ),
                                activeColor: Colors.blue,
                              ),
                              const Text(
                                'I agree to the processing of ',
                                style: TextStyle(color: Colors.black45),
                              ),
                              const Text(
                                'Personal data',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 25),
                          // signup button
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                if (formSignupKey.currentState!.validate() &&
                                    agreePersonalData) {
                                  signUpUser();
                                } else if (!agreePersonalData) {
                                  ScaffoldMessenger.of(context)
                                      .removeCurrentSnackBar();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    showSnackBar(
                                      'Please agree to the processing of personal data',
                                    ),
                                  );
                                }
                              },
                              child: const Text('Sign up'),
                            ),
                          ),
                          const SizedBox(height: 30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Divider(
                                  thickness: 0.7,
                                  color: Colors.grey.withOpacity(0.5),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  'Sign up with',
                                  style: TextStyle(color: Colors.black45),
                                ),
                              ),
                              Expanded(
                                child: Divider(
                                  thickness: 0.7,
                                  color: Colors.grey.withOpacity(0.5),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Logo(Logos.facebook_f),
                              Logo(Logos.twitter),
                              Logo(Logos.google),
                              Logo(Logos.apple),
                            ],
                          ),
                          const SizedBox(height: 25),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Already have an account? ',
                                style: TextStyle(
                                  color: Colors.black45,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (e) => const SignInPage(),
                                    ),
                                  );
                                },
                                child: const Text(
                                  'Sign in',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}
