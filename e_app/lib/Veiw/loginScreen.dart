import 'package:e_app/Veiw/Home.dart';
import 'package:e_app/Veiw/signUpScreen.dart';
import 'package:e_app/Widget/Logintextfileeed.dart';
import 'package:e_app/const/color.dart';
import 'package:e_app/state/currentUser.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();

  void _logInUser(String email, String password, BuildContext context) async {
    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Email and password not match"),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

    CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);

    try {
      if (await _currentUser.logInUser(email, password)) {
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
            content: Text("Email and password not match"),
            duration: Duration(seconds: 2),
          ),
        );
      }
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Error: $e"),
          duration: Duration(seconds: 2),
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
              LogInTextForm(context, hint: "Email", labels: "Email", controllerused: _emailcontroller, isobscure: false),
              SizedBox(
                height: size.height * 0.025,
              ),
              LogInTextForm(context, hint: "* * * * * *", labels: "Password", controllerused: _passwordcontroller,isobscure: true),
              SizedBox(
                height: size.height * 0.3,
              ),
              SizedBox(
                width: size.width * .4,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    _logInUser(_emailcontroller.text, _passwordcontroller.text, context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:colorblue,
                  ),
                  child: const Text(
                    "LogIn",
                    style: TextStyle(color: colorwhite, fontSize: 22, fontFamily: 'Poppins',),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "New here?",
                    style: TextStyle(fontSize: 18, fontFamily: 'Poppins',),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          return const SignUpScreen();
                        },
                      ));
                    },
                    child: const Text(
                      "Signup",
                      style: TextStyle( fontFamily: 'Poppins',fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 12, 83, 190),
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
