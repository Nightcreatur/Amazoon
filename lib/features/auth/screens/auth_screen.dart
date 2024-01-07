import 'package:amaazon/commons/custom_button.dart';
import 'package:amaazon/commons/custom_textfield.dart';
import 'package:amaazon/constants/global_variables.dart';
import 'package:amaazon/features/auth/services/auth_service.dart';
import 'package:flutter/material.dart';

enum Auth { signUp, signIn }

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});
  static const routeName = './auth-screen';

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _signUpFormKey = GlobalKey<FormState>();
  final _signInFormKey = GlobalKey<FormState>();
  final _authService = AuthService();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  Auth _auth = Auth.signUp;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void signUp() {
    _authService.signup(
      name: nameController.text,
      email: emailController.text,
      password: passwordController.text,
      context: context,
    );
  }

  void signIn() {
    _authService.signIn(
      email: emailController.text,
      password: passwordController.text,
      context: context,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVaribales.greyBackgroundCOlor,
      appBar: AppBar(
        title: const Text('Welcome'),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ListTile(
              tileColor: (_auth == Auth.signUp)
                  ? GlobalVaribales.backgroundColor
                  : GlobalVaribales.greyBackgroundCOlor,
              leading: Radio(
                groupValue: _auth,
                value: Auth.signUp,
                activeColor: GlobalVaribales.secondaryColor,
                onChanged: (Auth? value) {
                  setState(() {
                    _auth = value!;
                  });
                },
              ),
              title: const Text(
                'Create an Account',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
              ),
            ),
            if (_auth == Auth.signUp)
              Container(
                padding: const EdgeInsets.all(8),
                color: GlobalVaribales.backgroundColor,
                child: Form(
                  key: _signUpFormKey,
                  child: Column(
                    children: [
                      CustomTextField(
                        hintText: 'Name',
                        controller: nameController,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      CustomTextField(
                          hintText: 'Email', controller: emailController),
                      const SizedBox(
                        height: 15,
                      ),
                      CustomTextField(
                        hintText: 'Password',
                        controller: passwordController,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      CustomButton(
                          text: 'SignUp',
                          onTap: () {
                            if (_signUpFormKey.currentState!.validate()) {
                              signUp();
                            }
                          })
                    ],
                  ),
                ),
              ),
            ListTile(
              tileColor: (_auth == Auth.signIn)
                  ? GlobalVaribales.backgroundColor
                  : GlobalVaribales.greyBackgroundCOlor,
              leading: Radio(
                groupValue: _auth,
                value: Auth.signIn,
                activeColor: GlobalVaribales.secondaryColor,
                onChanged: (Auth? value) {
                  setState(() {
                    _auth = value!;
                  });
                },
              ),
              title: const Text(
                'SignIn',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
              ),
            ),
            if (_auth == Auth.signIn)
              Container(
                color: GlobalVaribales.backgroundColor,
                padding: const EdgeInsets.all(8),
                child: Form(
                  key: _signInFormKey,
                  child: Column(
                    children: [
                      CustomTextField(
                        hintText: 'Email',
                        controller: emailController,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      CustomTextField(
                        hintText: 'Password',
                        controller: passwordController,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      CustomButton(
                          text: 'SignIn',
                          onTap: () {
                            if (_signInFormKey.currentState!.validate()) {
                              signIn();
                            }
                          })
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
