import 'package:e_app/Veiw/Home.dart';
import 'package:e_app/Veiw/loginScreen.dart';
import 'package:e_app/Widget/Logintextfileeed.dart';
import 'package:e_app/const/color.dart';
import 'package:e_app/state/currentUser.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _namecontroller = TextEditingController();
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();

  void _signUpUser(String email, String password, BuildContext context) async {
    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content:
              Text("Email cannot be empty and password must have 8 charactor"),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

    CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);

    try {
      if (await _currentUser.signUpUser(email, password)) {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) {
              return const HomeScreen();
            },
          ),
          (route) => false,
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Sign up failed"),
            duration: Duration(seconds: 2),
          ),
        );
      }
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Error: $e"),
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Container(
          color: colorwhite,
          height: size.height * 1,
          width: size.width * 1,
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(
                height: 45,
              ),
              const Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    "e-Shop",
                    style: TextStyle(
                      fontSize: 26,
                      color: colorblue,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.20,
              ),
              LogInTextForm(context,
                  isobscure: false,
                  hint: "Your name",
                  labels: "Name",
                  controllerused: _namecontroller),
              SizedBox(
                height: size.height * 0.025,
              ),
              LogInTextForm(context,
                  isobscure: false,
                  hint: "Email",
                  labels: "Email",
                  controllerused: _emailcontroller),
              SizedBox(
                height: size.height * 0.025,
              ),
              LogInTextForm(context,
                  isobscure: true,
                  hint: "* * * * * *",
                  labels: "Password",
                  controllerused: _passwordcontroller),
              SizedBox(
                height: size.height * 0.2,
              ),
              SizedBox(
                width: size.width * .4,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    _signUpUser(_emailcontroller.text, _passwordcontroller.text,
                        context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colorblue,
                  ),
                  child: const Text(
                    "Signup",
                    style: TextStyle(
                      color: colorwhite,
                      fontSize: 22,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account?",
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          return const LoginScreen();
                        },
                      ));
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: colorblue,
                        fontSize: 20,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
