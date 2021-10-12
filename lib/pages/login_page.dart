import 'package:flutter/material.dart';
import 'package:flutter_codepur/utils/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = '';
  bool changeButton = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                'images/login_image.png',
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 16),
              Text(
                email.isEmpty ? 'Welcome' : 'Welcome $email',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 32,
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        onChanged: (value) {
                          setState(() {
                            email = value;
                          });
                        },
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          hintText: 'Enter Your Email',
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Email cannot be empty.";
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: 'Password',
                          hintText: 'Enter Password',
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Password cannot be empty.";
                          } else if (value.length < 8) {
                            return "Password should have 8 or more characters.";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      Material(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(16),
                        child: InkWell(
                          onTap: onClickLogin,
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            width: changeButton ? 1 : 150,
                            height: 50,
                            alignment: Alignment.center,
                            child: const Text(
                              'Login',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  onClickLogin() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton ? changeButton = false : changeButton = true;
      });
      await Future.delayed(const Duration(milliseconds: 210));
      Navigator.pushNamed(context, MyRoutes.routeHome);
    }
  }
}
