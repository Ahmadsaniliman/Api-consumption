import 'package:flutter/material.dart';
import 'dart:developer' as devtool show log;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jsonapiintergation/User/Network/api_newtwork.dart';
import 'package:jsonapiintergation/User/Screens/login_screen.dart';

class Register extends ConsumerWidget {
  const Register({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController usernameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 100),
              const Icon(
                Icons.lock,
                size: 100,
              ),
              const SizedBox(height: 100),
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(),
                ),
                child: TextField(
                  controller: usernameController,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 15),
                    border: InputBorder.none,
                    hintText: 'Enter Your Username',
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(),
                ),
                child: TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 15),
                    border: InputBorder.none,
                    hintText: 'Enter Your Email',
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(),
                ),
                child: TextField(
                  controller: passwordController,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 15),
                    border: InputBorder.none,
                    hintText: 'Enter Your Password',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                        onTap: () {
                          Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                              builder: (context) => const Login(),
                            ),
                            (route) => false,
                          );
                        },
                        child: const Text('Login')),
                    Container(),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              GestureDetector(
                onTap: () {
                  final userName = usernameController.text;
                  final email = emailController.text;
                  final password = passwordController.text;

                  NetworkApi().registerUser(
                    username: userName,
                    email: email,
                    gender: password,
                  );
                  devtool.log('succefull');
                },
                child: Container(
                  height: 50,
                  width: 100,
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(15)),
                  child: const Center(
                    child: Text('Register'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RegisterValidator extends StatefulWidget {
  const RegisterValidator({super.key});

  @override
  State<RegisterValidator> createState() => _RegisterValidatorState();
}

class _RegisterValidatorState extends State<RegisterValidator> {
  final hidePassword = true;
  final privacyPolicy = false;
  final emailContr = TextEditingController();
  final passwordContr = TextEditingController();
  final numberContr = TextEditingController();
  final usernameContr = TextEditingController();
  GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Validator'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 70),
              const Icon(Icons.lock, size: 100),
              const SizedBox(height: 50),
              Form(
                key: registerFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Email'),
                    Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: TextFormField(
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Email is required';
                          }

                          final emailRegExp =
                              RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                          if (!emailRegExp.hasMatch(value)) {
                            return 'Invalid email address';
                          }

                          return null;
                        },
                        controller: emailContr,
                        decoration: const InputDecoration(
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 15),
                            border: InputBorder.none,
                            hintText: 'limanahmad@gmail.com'),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text('Password'),
                    Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: TextFormField(
                        controller: passwordContr,
                        obscureText: hidePassword,
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Password is required';
                          }

                          if (value.length < 7) {
                            return 'password must be at leaset 7';
                          }

                          if (!value.contains(
                            RegExp(r'[A-Z]'),
                          )) {
                            return 'password must atleast contain one uppercase';
                          }

                          if (!value.contains(
                            RegExp(r'[0-9]'),
                          )) {
                            return 'password must atleast contain one number';
                          }

                          if (!value.contains(
                            RegExp(r'[!@£%^&*(),.?":{|<>}]'),
                          )) {
                            return 'password must atleast contain one special character';
                          }

                          return null;
                        },
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                              onPressed: () => hidePassword == !hidePassword,
                              icon: const Icon(Icons.visibility_off),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            border: InputBorder.none,
                            hintText: 'Mgmhg1!'),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text('Number'),
                    Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: TextFormField(
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'password is required';
                          }

                          final numRegExp = RegExp(r'^\d{11}$');

                          if (!numRegExp.hasMatch(value)) {
                            return 'invalid phone number, 11 digit required';
                          }

                          return null;
                        },
                        controller: numberContr,
                        decoration: const InputDecoration(
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 15),
                            border: InputBorder.none,
                            hintText: '09087564323'),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text('Username'),
                    Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: TextFormField(
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'username cannot be empty';
                          }

                          return null;
                        },
                        controller: usernameContr,
                        decoration: const InputDecoration(
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 15),
                            border: InputBorder.none,
                            hintText: 'liman'),
                      ),
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: privacyPolicy,
                          onChanged: (value) {
                            privacyPolicy == value;
                          },
                        ),
                        const Text('I agree to privacy policy'),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 25),
              InkWell(
                onTap: () {
                  if (registerFormKey.currentState!.validate()) return;
                },
                child: Container(
                  height: 50,
                  width: 100,
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(10)),
                  child: const Center(
                    child: Text('Enter'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}